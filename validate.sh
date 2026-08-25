#!/usr/bin/env bash
# Валидация скиллов по стандарту Agent Skills (agentskills.io/specification) + стража RU/EN:
# frontmatter (строгий YAML), name = папка, длина description, license/version/languages,
# EN-перевод тела (references/EN.md), паритет заголовков и код-блоков между SKILL.md и EN.md,
# отсутствие следов конкретной машины. Выход: 0 = всё чисто.
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$ROOT/skills"
FAIL=0
BANNED=("admin1" "Base directory for this skill" "BROboses" "Relative paths in this skill")

for md in "$SKILLS_DIR"/*/SKILL.md; do
  dir="$(basename "$(dirname "$md")")"

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

  # 3. Следы машины
  for b in "${BANNED[@]}"; do
    if grep -q "$b" "$md"; then
      echo "❌ $dir: найден след машины/мусор: $b"; FAIL=1
    fi
  done
done

# 4. Строгий YAML + паритет RU/EN (одним python-заходом)
python3 - "$ROOT" "$SKILLS_DIR" <<'PY'
import re, sys, pathlib, yaml
root = pathlib.Path(sys.argv[1])
skills = sorted(pathlib.Path(sys.argv[2]).glob("*/SKILL.md"))
issues = []
for f in skills:
    d = f.parent.name
    raw = f.read_text(encoding="utf-8")
    fm = raw.split("---", 2)[1]
    try:
        meta = yaml.safe_load(fm)
    except Exception as e:
        issues.append(f"❌ {d}: YAML сломан — {str(e).splitlines()[0]}")
        continue
    if not isinstance(meta, dict):
        issues.append(f"❌ {d}: frontmatter не mapping"); continue
    if meta.get("name") != d:
        issues.append(f"❌ {d}: name ≠ папка")
    desc = meta.get("description", "")
    if len(desc) > 1024:
        issues.append(f"❌ {d}: description {len(desc)} симв. > 1024")
    if "EN:" not in desc:
        issues.append(f"⚠️  {d}: нет EN-части в description")
    if not meta.get("license"):
        issues.append(f"⚠️  {d}: нет license")
    if not (meta.get("metadata") or {}).get("version"):
        issues.append(f"⚠️  {d}: нет version в metadata")
    if not (meta.get("metadata") or {}).get("languages"):
        issues.append(f"⚠️  {d}: нет languages в metadata")
    body = raw.split("---", 2)[2]
    if "references/EN.md" not in body:
        issues.append(f"⚠️  {d}: нет указателя на references/EN.md")
    en = f.parent / "references" / "EN.md"
    if not en.exists():
        issues.append(f"⚠️  {d}: нет references/EN.md (EN-перевод тела)")
        continue
    ent = en.read_text(encoding="utf-8")
    h_ru, h_en = len(re.findall(r"^#{2,3} ", raw, re.M)), len(re.findall(r"^#{2,3} ", ent, re.M))
    c_ru, c_en = len(re.findall(r"^```", raw, re.M)), len(re.findall(r"^```", ent, re.M))
    if h_ru != h_en:
        issues.append(f"❌ {d}: заголовки RU {h_ru} ≠ EN {h_en}")
    if c_ru != c_en:
        issues.append(f"❌ {d}: код-блоки RU {c_ru} ≠ EN {c_en}")

# 5. SKILLS.yaml — индекс должен совпадать с frontmatter (источник истины)
idx_path = root / "SKILLS.yaml"
if idx_path.exists():
    idx = yaml.safe_load(idx_path.read_text(encoding="utf-8"))
    idx_skills = {s["name"]: s for s in idx.get("skills", [])}
    real_names = {f.parent.name for f in skills}
    if set(idx_skills) != real_names:
        issues.append(f"❌ SKILLS.yaml: набор скиллов разошёлся (индекс {sorted(set(idx_skills))[:3]}..., факт {sorted(real_names)[:3]}...)")
    for f in skills:
        d = f.parent.name
        meta = yaml.safe_load(f.read_text(encoding="utf-8").split("---", 2)[1])
        s = idx_skills.get(d)
        if not s:
            continue
        ver = (meta.get("metadata") or {}).get("version", "")
        if s.get("version") != ver:
            issues.append(f"❌ SKILLS.yaml: {d} version {s.get('version')} ≠ {ver}")
        if s.get("path") != f"skills/{d}":
            issues.append(f"❌ SKILLS.yaml: {d} path {s.get('path')} ≠ skills/{d}")
        if s.get("description") != meta.get("description"):
            issues.append(f"❌ SKILLS.yaml: {d} description разошёлся с SKILL.md")
else:
    issues.append("⚠️  нет SKILLS.yaml (индекс) — запусти ./update-index.sh")

for i in issues:
    print(i)
n = len(skills)
if not issues:
    print(f"✅ YAML+паритет+индекс: {n}/{n} скиллов идеальны")
    sys.exit(0)
sys.exit(1 if any(i.startswith("❌") for i in issues) else 0)
PY
[ $? -ne 0 ] && FAIL=1

# Золотые тесты триггеров: описания зовут скиллы правильно (A-гейт: структура
# триггеров, мёртвые слова, дубли; WARN: двусмысленности и ложные вызовы)
if ! python3 "$ROOT/tests/golden_triggers.py"; then
  echo "❌ золотые тесты триггеров: FAIL"; FAIL=1
fi

n="$(ls -d "$SKILLS_DIR"/*/ | wc -l)"
if [ "$FAIL" -eq 0 ]; then
  echo "✅ PASS: $n скиллов валидны ($(cat "$SKILLS_DIR"/*/SKILL.md | wc -l) строк RU + $(cat "$SKILLS_DIR"/*/references/EN.md | wc -l) строк EN)"
else
  echo "❌ FAIL — есть ошибки"
fi
exit $FAIL
