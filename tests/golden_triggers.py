#!/usr/bin/env python3
"""Золотые тесты триггеров: проверяем, что слова-триггеры скиллов
не пустые, не дублируются между скиллами и всегда зовут свой скилл.

Зачем: агент выбирает скилл по описанию (прогрессивное раскрытие).
Если два скилла хватаются за одно слово — агент зовёт не того.
Это зеркало "golden tests" из чек-листа публикации скиллов:
проверь, что description реально рождает включение.

Выход: PASS (exit 0) или FAIL (exit 1) со списком проблем.
"""
import glob
import re
import sys

import yaml

SKILLS = "skills"
MIN_TRIGGERS = 3
MIN_TRIGGER_LEN = 2


def norm(s):
    """Один пробел между словами, всё в нижнем регистре."""
    return re.sub(r"\s+", " ", s.lower())


def load_skills():
    """Все скиллы: имя, описание, список триггеров, текст файла."""
    skills = {}
    for path in sorted(glob.glob(f"{SKILLS}/*/SKILL.md")):
        name = path.split("/")[1]
        text = open(path, encoding="utf-8").read()
        fm = re.search(r"^---\n(.*?)\n---", text, re.S)
        if not fm:
            raise SystemExit(f"FAIL: {path} — нет frontmatter")
        desc = yaml.safe_load(fm.group(1)).get("description", "") or ""
        # рубеж EN-раздела — только «en» с двоеточием, иначе режем
        # внутри слов (vendor-agnostic, …)
        tm = re.search(r"Триггеры:\s*(.+?)(?:\.\s*)?en\s*:", desc,
                       re.I | re.S)
        triggers = []
        if tm:
            # нормализуем пробелы: yaml-описание сворачивается с переносами,
            # и «не\n работает» ≠ «не работает» для проверок
            triggers = [norm(t.strip().strip("."))
                        for t in re.split(r"[;,]", tm.group(1)) if t.strip()]
        skills[name] = {
            "desc": desc,
            "desc_lower": norm(desc),
            "triggers": triggers,
            "text_lower": norm(text),
        }
    return skills


def check_triggers(skills):
    """A: у каждого скилла есть непустой список триггеров,
    каждый триггер существует в тексте скилла (не мёртвый)."""
    errors = []
    for name, s in sorted(skills.items()):
        if len(s["triggers"]) < MIN_TRIGGERS:
            errors.append(f"{name}: триггеров {len(s['triggers'])} "
                          f"(минимум {MIN_TRIGGERS})")
            continue
        for t in s["triggers"]:
            if len(t) < MIN_TRIGGER_LEN:
                errors.append(f"{name}: триггер '{t}' короче "
                              f"{MIN_TRIGGER_LEN} символов")
            elif t not in s["text_lower"]:
                errors.append(f"{name}: триггер '{t}' не встречается "
                              f"в тексте скилла (опечатка?)")
    return errors


def check_duplicates(skills):
    """B1: внутри одного скилла триггер не должен повторяться."""
    errors = []
    for name, s in sorted(skills.items()):
        seen = set()
        for t in s["triggers"]:
            if t in seen:
                errors.append(f"{name}: триггер '{t}' повторяется "
                              f"в списке (мусор)")
            seen.add(t)
    return errors


def check_uniqueness(skills):
    """B2: общий триггер у разных скиллов — двусмысленность.
    Не валит: общие слова бывают намеренными; но их видно."""
    owner = {}
    for name, s in skills.items():
        for t in s["triggers"]:
            owner.setdefault(t, set()).add(name)
    return sorted(
        f"триггер '{t}' общий для {sorted(names)} — уточни «НЕ для»"
        for t, names in owner.items() if len(names) > 1)


def check_golden(skills):
    """C (золото): промпт из триггера скилла X должен матчиться
    только на скиллы, где этот триггер заявлен. Промпт из чужого
    триггера попал в описание Y → Y зовётся ложно."""
    warnings = []
    for name, s in skills.items():
        for t in s["triggers"]:
            matched = [n for n, info in skills.items()
                       if re.search(rf"\b{re.escape(t)}\b", info["desc_lower"])]
            foreign = [n for n in matched
                       if n != name and t not in skills[n]["triggers"]]
            if foreign:
                warnings.append(f"{name}: '{t}' ложно зовёт {foreign} "
                                f"(добавь исключение «НЕ для» в описание)")
    return warnings


def main():
    skills = load_skills()
    if not skills:
        print("FAIL: скиллов не найдено")
        return 1
    problems = check_triggers(skills) + check_duplicates(skills)
    warnings = check_uniqueness(skills) + check_golden(skills)

    for w in warnings:
        print(f"  WARN: {w}")
    if problems:
        for p in problems:
            print(f"  FAIL: {p}")
        print(f"GOLDEN-TRIGGERS: FAIL ({len(problems)} проблем в "
              f"{len(skills)} скиллах)")
        return 1
    print(f"GOLDEN-TRIGGERS: PASS ({len(skills)} скиллов, "
          f"{sum(len(s['triggers']) for s in skills.values())} триггеров, "
          f"{len(warnings)} предупреждений)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
