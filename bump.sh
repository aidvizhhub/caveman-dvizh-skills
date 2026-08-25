#!/usr/bin/env bash
# bump.sh — поднять версию всех 17 скиллов + записать в RELEASES.md.
# Использование: ./bump.sh [major|minor|patch] [-m "что нового"] [--dry-run]
# Пример: ./bump.sh minor -m "EN-переводы тел скиллов (references/EN.md)"
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS="$ROOT/skills"
PART="${1:-patch}"
NOTE=""
DRY=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    major|minor|patch) PART="$1" ;;
    -m|--message) shift; NOTE="$1" ;;
    --dry-run) DRY=1 ;;
  esac
  shift
done

# Текущая версия — из первого скилла (источник истины: metadata)
CUR="$(sed -n 's/^  version: "\(.*\)"/\1/p' "$SKILLS/caveman-advise/SKILL.md" | head -1)"
[ -n "$CUR" ] || { echo "❌ не нашёл текущую версию"; exit 1; }

# Семвер: MAJOR.MINOR.PATCH
MAJOR="${CUR%%.*}"; REST="${CUR#*.}"
MINOR="${REST%%.*}"; PATCH="${REST#*.}"
case "$PART" in
  major) MAJOR=$((MAJOR+1)); MINOR=0; PATCH=0 ;;
  minor) MINOR=$((MINOR+1)); PATCH=0 ;;
  patch) PATCH=$((PATCH+1)) ;;
esac
NEW="$MAJOR.$MINOR.$PATCH"
TODAY="$(date +%Y-%m-%d)"

echo "Версия: $CUR → $NEW ($PART, $TODAY)${NOTE:+ — $NOTE}"
[ "$DRY" = 1 ] && { echo "(dry-run: ничего не меняю)"; exit 0; }

# 1. Обновить metadata во всех скиллах
for md in "$SKILLS"/*/SKILL.md; do
  sed -i "s/^  version: \"$CUR\"/  version: \"$NEW\"/" "$md"
done
echo "✅ version $NEW в $(ls -d "$SKILLS"/*/ | wc -l) скиллах"

# 2. RELEASES.md: Unreleased → новый релиз, сверху свежий Unreleased
RELEASES="$ROOT/RELEASES.md"
[ -f "$RELEASES" ] || { echo "❌ нет RELEASES.md"; exit 1; }
NOTE_SAFE="${NOTE//|/\\|}"
sed -i "s|^## \[Unreleased\]$|## [$NEW] - $TODAY\n\n### Changed\n- $NOTE_SAFE|" "$RELEASES"
# вставить свежий Unreleased сразу после заголовка
python3 - "$RELEASES" <<'PY'
import sys
p = sys.argv[1]
t = open(p, encoding="utf-8").read()
if "## [Unreleased]" not in t:
    lines = t.splitlines(keepends=True)
    # после первой строки-заголовка "# RELEASES" вставить Unreleased
    for i, l in enumerate(lines):
        if l.startswith("# "):
            lines.insert(i+1, "\n## [Unreleased]\n")
            break
    open(p, "w", encoding="utf-8").write("".join(lines))
PY
echo "✅ RELEASES.md обновлён"

# 3. Проверка
"$ROOT/validate.sh"
echo "Готово: версия $NEW. Дальше: git add -A && git commit && git push && gh release create v$NEW"
