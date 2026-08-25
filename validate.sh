#!/usr/bin/env bash
# Валидация скиллов по стандарту Agent Skills (agentskills.io/specification):
# frontmatter, name = папка, регекс имени, длина description, license,
# отсутствие следов конкретной машины. Выход: 0 = всё чисто.
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$ROOT/skills"
FAIL=0
BANNED=("admin1" "Base directory for this skill" "BROboses")

for md in "$SKILLS_DIR"/*/SKILL.md; do
  dir="$(basename "$(dirname "$md")")"
  body="$(cat "$md")"

  # 1. Frontmatter есть
  if ! head -1 "$md" | grep -q "^---$"; then
    echo "❌ $dir: нет YAML frontmatter"; FAIL=1; continue
  fi

  # 2. name = папка + регекс
  name="$(sed -n 's/^name:[[:space:]]*//p' "$md" | head -1)"
  if [ "$name" != "$dir" ]; then
    echo "❌ $dir: name='$name' ≠ папка '$dir'"; FAIL=1
  fi
  if ! echo "$name" | grep -qE '^[a-z0-9]+(-[a-z0-9]+)*$'; then
    echo "❌ $dir: name не по регексу"; FAIL=1
  fi

  # 3. description есть и ≤1024 (свернутый блок)
  desc="$(awk '/^description:/{f=1; next} /^[a-z-]+:/{f=0} f' "$md")"
  if [ -z "$desc" ]; then
    echo "❌ $dir: нет description"; FAIL=1
  elif [ "${#desc}" -gt 1024 ]; then
    echo "❌ $dir: description ${#desc} симв. > 1024"; FAIL=1
  fi

  # 4. license в frontmatter (опционально, но рекомендуем)
  grep -q "^license:" "$md" || echo "⚠️  $dir: нет license в frontmatter"

  # 4b. версия, языки, двуязычное описание
  grep -q '^  version:' "$md" || echo "⚠️  $dir: нет version в metadata"
  grep -q '^  languages:' "$md" || echo "⚠️  $dir: нет languages в metadata"
  grep -q 'EN:' "$md" || echo "⚠️  $dir: нет EN-части в description"

  # 5. Следы машины
  for b in "${BANNED[@]}"; do
    if grep -q "$b" "$md"; then
      echo "❌ $dir: найден след машины: $b"; FAIL=1
    fi
  done
done

n="$(ls -d "$SKILLS_DIR"/*/ | wc -l)"
if [ "$n" -lt 1 ]; then echo "❌ не найдено скиллов в $SKILLS_DIR"; FAIL=1; fi

if [ "$FAIL" -eq 0 ]; then
  echo "✅ PASS: $n скиллов валидны ($(cat "$SKILLS_DIR"/*/SKILL.md | wc -l) строк)"
else
  echo "❌ FAIL — есть ошибки"
fi
exit $FAIL
