#!/usr/bin/env bash
# update-index.sh — пересобрать SKILLS.yaml из skills/*/SKILL.md (источник истины — frontmatter).
# Вызывается сам в bump.sh после смены версии; вручную — после правки frontmatter.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
python3 - "$ROOT" <<'PY'
import sys, pathlib, yaml
root = pathlib.Path(sys.argv[1])
skills = []
for f in sorted((root / "skills").glob("*/SKILL.md")):
    raw = f.read_text(encoding="utf-8")
    fm = raw.split("---", 2)[1]
    meta = yaml.safe_load(fm)
    skills.append({
        "name": meta["name"],
        "path": str(f.parent.relative_to(root)),
        "version": meta.get("metadata", {}).get("version", ""),
        "license": meta.get("license", ""),
        "languages": meta.get("metadata", {}).get("languages", "").split(","),
        "description": meta.get("description", ""),
    })
index = {
    "index-version": "1",
    "skills-version": skills[0]["version"] if skills else "",
    "count": len(skills),
    "skills": skills,
}
out = root / "SKILLS.yaml"
text = yaml.safe_dump(index, allow_unicode=True, sort_keys=False, width=200)
out.write_text(text, encoding="utf-8")
print(f"✅ SKILLS.yaml: {len(skills)} скиллов, версия {index['skills-version']}")
PY
