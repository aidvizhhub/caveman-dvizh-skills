---
name: caveman-portability
description: >-
  ПОРТАТИВНОСТЬ: без хардкод путей, без вендор-локина, build-once-run-anywhere.
  Относительные пути, env vars, self-contained пакет, vendor-agnostic форматы.
  Триггеры: portability, vendor-agnostic, no-hardcode, 12-factor, build-once, перенос, флешка, другой ПК.
  EN: Portability: no hardcoded paths, no vendor lock-in, build-once-run-anywhere, relative paths + env vars. Use when copying to another machine, USB stick, or cloud.
license: MIT
metadata:
  opencode/autoinvoke: true
  version: "1.3.0"
  languages: ru,en
---

# caveman-portability (модуль полного канона)

> 🇬🇧 English instructions: `references/EN.md` — полный перевод тела.

Это часть устава пещерника. Полный канон целиком — скилл caveman-canon.
Всё ниже — выдержки из BRO.md один в один (без сокращений).

⚡ ЗАКОН СКИЛЛОВ (авг 2026): на КАЖДЫЙ промт грузи как можно больше скиллов
племени — МИНИМУМ 6, лучше ВСЕ 17 (canon + conclusion + teach + cheat + advise + prevent + verify + loop + kill + code + style + think + research + run +
diagnose + save + desktop + portability). Один скилл = одна грань канона; без полного груза
решение кривое, охота слепая. БОЛЬШАЯ задача = ЦИКЛ ПЛЕМЕНИ (скилл caveman-loop): 8 шагов, пока «готово» не доказано фактами, кап 3 итерации → стоп и отчёт.

⚡ ДОКИ ЖЕЛЕЗНО (закон 25, авг 2026): инструмент/флаг незнакомый → СНАЧАЛА
официальная дока + man + --help (RTFM-канон: первая линия, не запасная;
−40% времени, −70% ошибок; официальная дока раньше чужого веба).
Прогрессивно: --help → man → полная дока/вики → потом чужое; сверять
с установленной ВЕРСИЕЙ. Пример: ffmpeg — man ffmpeg + ffmpeg-all.html.

---

## СУТЬ: репозиторий скиллов = переносимый пакет (авг 2026) — РЕШЕНО ✅

Канон (47 источников, кауфми 25 авг 2026: 12-Factor App — config отдельно от кода, env vars; Portable Documentation System — self-contained, offline; Vendor-Agnostic Architecture — API-first, JSON configs; Build Once Run Anywhere — environment-agnostic; Agent-Agnostic Repository — работает с любым AI-агентом; Portable Paths in Knowledge Management — location agnosticism, no os.path.expanduser):

Смысл: репозиторий скиллов = переносимый пакет. Скопировал на флешку, другой ПК, в облако — работает без правок. Никаких `/run/media/<user>/...`, никаких `~/.config/...`, никаких привязок к машине.

## ПРАВИЛА (живые):

1. **ОТНОСИТЕЛЬНЫЕ ПУТИ ВЕЗДЕ** — скрипты ищут файлы относительно себя:
   ```bash
   SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
   SKILLS_DIR="${SKILLS_DIR:-$SCRIPT_DIR}"
   ```
   Не хардкод `/run/media/<user>/data/мой-пакет`.

2. **ПЕРЕМЕННЫЕ ОКРУЖЕНИЯ ДЛЯ КОНФИГА** — 12-Factor App канон:
   ```bash
   # БЫЛО (хардкод):
   API_KEY="sk-12345"
   DB_PATH="/home/<user>/.db"
   
   # СТАЛО (env vars):
   API_KEY="${OPENAI_API_KEY:?нужен OPENAI_API_KEY}"
   DB_PATH="${SKILLS_DIR:-.}/data/db"
   ```

3. **НИКАКОЙ ПРИВЯЗКИ К МАШИНЕ** — не использовать:
   - `/home/username/...` (зависит от юзера)
   - `/run/media/...` (зависит от точки монтирования)
   - `~/.config/...` (зависит от HOME)
   - MAC-адреса, hostname, UUID диска

4. **VENDOR-AGNOSTIC ФОРМАТЫ** — использовать открытые форматы:
   - Markdown (.md) вместо .docx/.pdf
   - JSON/YAML вместо бинарных конфигов
   - Git вместо SVN/Mercurial
   - OpenAI API вместо проприетарных SDK

5. **SELF-CONTAINED ПАКЕТ** — всё необходимое внутри пакета:
   - Скрипты работают без внешних зависимостей (кроме bash/python3)
   - Документация читается без интернета
   - Скиллы грузятся из локальной папки, не из облака

6. **BUILD ONCE, RUN ANYWHERE** — один раз написал, работает везде:
   - Тестировать на 3+ окружениях (Linux/macOS/Windows WSL)
   - Контейнеры (Docker) для полной изоляции
   - CI/CD прогоняет тесты портативности

7. **АВТОДЕТЕКТ ОКРУЖЕНИЯ** — скрипт сам находит где лежит:
   ```bash
   # Найти пакет по структуре
   find_package() {
     local dir="$1"
     while [ "$dir" != "/" ]; do
       if [ -f "$dir/README.md" ] && [ -d "$dir/skills" ]; then
         echo "$dir"
         return 0
       fi
       dir="$(dirname "$dir")"
     done
     echo "❌ пакет не найден" >&2
     return 1
   }
   ```

8. **КОНФИГ ОТДЕЛЬНО ОТ КОДА** — 12-Factor App:
   - Код (скрипты) = в git, не меняется
   - Конфиг (пути, ключи) = env vars или config.json
   - Данные (модули, скиллы) = отдельно, можно обновлять

## ГРАБЛИ (не делать):

- ❌ `SKILLS_DIR="/run/media/<user>/data/мой-пакет"` — сломается на другой машине
- ❌ `API_KEY="sk-12345"` в коде — утечка + не переносимо
- ❌ `cd /home/<user>/...` — зависит от юзера
- ❌ `~/.config/opencode/...` — зависит от HOME
- ❌ Проприетарные форматы (.docx, .pdf) — нужны спец-программы

## ПРОВЕРКА ПОРТАТИВНОСТИ:

```bash
# Тест: скопировать в /tmp и запустить
cp -r ./my-skill-pack /tmp/test-portable
cd /tmp/test-portable
./test_quality_gates.sh  # должно работать
```

Если работает — портативно ✅. Если нет — найти хардкод и исправить.

---

##  Не делать
- **Не хардкодить пути** — только относительные или env vars
- **Не привязываться к машине** — никаких MAC/hostname/UUID
- **Не использовать проприетарные форматы** — только открытые (md/json/yaml)
- **Не зависеть от интернета** — всё должно работать офлайн
- **Не зависеть от вендора** — API-first, не SDK-first

## 🔗 Связи
- **Ядро (законы)** → `../modules/laws.md`
- **Как работать с файлами** → `../modules/work.md`
- **Портативность (модуль)** → `../modules/portability.md`
- **Экономия (скрипты)** → `../skills/caveman-save`
- **12-Factor App** → https://12factor.net/

---

*Портативность = свобода. Переноси куда хочешь, работает везде.* 🗿
