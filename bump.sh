#!/usr/bin/env bash
# bump.sh — поднять версию всех 17 скиллов + записать в RELEASES.md + (опц.) создать релиз.
# Использование: ./bump.sh [major|minor|patch] [-m "что нового"] [--release] [--dry-run]
# Пример: ./bump.sh minor -m "EN-переводы тел скиллов" --release
#   только релиз (без бампа): ./bump.sh --release
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS="$ROOT/skills"
RELEASES="$ROOT/RELEASES.md"
PART=""
NOTE=""
DRY=0
DO_RELEASE=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    major|minor|patch) PART="$1" ;;
    -m|--message) shift; NOTE="$1" ;;
    --release) DO_RELEASE=1 ;;
    --dry-run) DRY=1 ;;
  esac
  shift
done
[ -z "$PART" ] && PART="none"

# Текущая версия — из первого скилла (источник истины: metadata)
CUR="$(sed -n 's/^  version: "\(.*\)"/\1/p' "$SKILLS/caveman-advise/SKILL.md" | head -1)"
[ -n "$CUR" ] || { echo "❌ не нашёл текущую версию"; exit 1; }

release_from_releases() {
  local ver="$1"
  python3 - "$RELEASES" "$ver" <<'PY'
import sys, re
text = open(sys.argv[1], encoding="utf-8").read()
ver = sys.argv[2]
m = re.search(rf"^## \[{re.escape(ver)}\] - .*?\n(.*?)(?=^## \[|\Z)", text, re.M | re.S)
print(m.group(1).strip() if m else "")
PY
}

create_release() {
  local ver="$1"
  command -v gh >/dev/null || { echo "❌ нет gh CLI — релиз не создан (можно: gh release create v$ver)"; exit 1; }
  local notes; notes="$(release_from_releases "$ver")"
  [ -n "$notes" ] || { echo "❌ секция [$ver] не найдена в RELEASES.md"; exit 1; }
  gh release create "v$ver" --title "Caveman Skill Set $ver" --notes "$notes"
  echo "✅ релиз: v$ver"
}

if [ "$PART" = "none" ]; then
  echo "Текущая версия: $CUR (без бампа)"
  if [ "$DO_RELEASE" = 1 ]; then
    create_release "$CUR"
  else
    echo "Использование: ./bump.sh [major|minor|patch] [-m \"...\"] [--release] [--dry-run]"
  fi
  exit 0
fi

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
[ -f "$RELEASES" ] || { echo "❌ нет RELEASES.md"; exit 1; }
NOTE_SAFE="${NOTE//|/\\|}"
sed -i "s|^## \[Unreleased\]$|## [$NEW] - $TODAY\n\n### Changed\n- $NOTE_SAFE|" "$RELEASES"
python3 - "$RELEASES" <<'PY'
import sys
p = sys.argv[1]
t = open(p, encoding="utf-8").read()
if "## [Unreleased]" not in t:
    lines = t.splitlines(keepends=True)
    for i, l in enumerate(lines):
        if l.startswith("# "):
            lines.insert(i+1, "\n## [Unreleased]\n")
            break
    open(p, "w", encoding="utf-8").write("".join(lines))
PY
echo "✅ RELEASES.md обновлён"

# 3. Проверка
"$ROOT/validate.sh"

# 4. Релиз (опционально)
if [ "$DO_RELEASE" = 1 ]; then
  create_release "$NEW"
else
  echo "Готово: версия $NEW. Дальше: git add -A && git commit && git push && ./bump.sh --release"
fi
