# 🗿 Caveman Skill Set

**17 agent skills: инженерная дисциплина, охота за фактами, безопасная работа и чистое мышление.**
One skill set, any harness. Based on the open [Agent Skills](https://agentskills.io/specification) format.

> 🇷🇺 Русская версия: этот файл · 🇬🇧 English: [README.en.md](README.en.md).

[![Skills](https://img.shields.io/badge/skills-17-orange)](#каталог-скиллов)
[![Version](https://img.shields.io/badge/version-1.3.0-blue)](#releases)
[![Languages](https://img.shields.io/badge/languages-RU+EN-yellow)](#каталог-скиллов)
[![Format](https://img.shields.io/badge/format-Agent%20Skills-blue)](https://agentskills.io/specification)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![skills.sh](https://skills.sh/b/aidvizhhub/caveman-dvizh-skills)](https://skills.sh/b/aidvizhhub/caveman-dvizh-skills)
[![CI](https://github.com/aidvizhhub/caveman-dvizh-skills/actions/workflows/ci.yml/badge.svg)](https://github.com/aidvizhhub/caveman-dvizh-skills/actions/workflows/ci.yml)

---

## Что это

Каждый скилл — папка `skills/<имя>/SKILL.md` по открытому стандарту **Agent Skills** (Anthropic → open standard, agentskills.io). Агент при старте видит только `name` + `description` (прогрессивное раскрытие), полный текст грузит, когда задача подходит. Поэтому 17 скиллов занимают в контексте копейки, а пользы — как целая книга.

Скиллы работают в любом **skills-совместимом** харнесе:

| Харнес | Где ставится | Проверено |
|---|---|---|
| [Claude Code](https://code.claude.com/docs/en/skills) | `~/.claude/skills/` | ✅ |
| [OpenCode](https://opencode.ai/docs/skills/) | `~/.config/opencode/skills/` | ✅ |
| [Codex CLI](https://github.com/openai/codex) | `~/.codex/skills/` | ✅ |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | `~/.gemini/skills/` | ✅ |
| GitHub Copilot / любой агент | `~/.agents/skills/` | ✅ |

> Скиллы — двуязычные: `description` на русском + строка `EN: ...` (в metadata `languages: ru,en`), тело на русском, а его полный английский перевод — в `references/EN.md` каждого скилла (указатель есть в начале SKILL.md). Поэтому скиллы включаются и русскими словами («бро», «ресёрч», «не работает»), и английскими. Каждый скилл помечен `version`, история — в [RELEASES.md](RELEASES.md), версия поднимается через `./bump.sh minor`.

---

## Быстрый старт

```bash
# 1. Клонировать и установить во все харнесы
git clone https://github.com/aidvizhhub/caveman-dvizh-skills.git
cd caveman-dvizh-skills
./install.sh all

# 2. Или только в один харнес
./install.sh opencode      # claude | opencode | codex | gemini | agents

# 3. Проверить, что встало
./install.sh status

# 4. Убрать
./install.sh uninstall all
```

Однострочно, без клона (сам скачает репо в кэш и установит):

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/aidvizhhub/caveman-dvizh-skills/main/install.sh) --remote opencode
```

Или через CLI-менеджер скиллов `npx skills` (75+ харнесов, без клона):

```bash
npx skills add aidvizhhub/caveman-dvizh-skills --list   # показать 17 скиллов
npx skills add aidvizhhub/caveman-dvizh-skills -g -a claude-code -y
```

После установки просто скажи агенту «пользуйся скиллом caveman-loop» или опиши задачу словами из триггеров — скилл сам подхватится.

---

## Совместимость: тул кауфми (camoufox-research)

Скиллы **caveman-research** и **caveman-diagnose** обращаются к «кауфми» — нашему MCP-серверу разведки [camoufox-research](https://github.com/aidvizhhub/camoufox-research) (48 тулов: веб-поиск, чтение страниц, батчи, скриншоты). Это внешний тул, в набор скиллов он НЕ входит. Без него агент честно скажет «кауфми лёг» — это значит «нет подключённого инструмента», а не беда:

```bash
# Установка кауфми (один раз, нужен python3)
git clone https://github.com/aidvizhhub/camoufox-research.git && cd camoufox-research
python3 -m venv ~/.venvs/camoufox-research
~/.venvs/camoufox-research/bin/pip install .
~/.venvs/camoufox-research/bin/python -m camoufox fetch   # скачать браузер (один раз)

# Проверка подключения: opencode mcp list → camoufox: connected
```

Остальные 15 скиллов работают без кауфми — им нужен только шелл.

---

## Каталог скиллов

| Скилл | Что делает | Триггеры (примеры) |
|---|---|---|
| **caveman-advise** | Советник: 3-4 варианта «куда дальше» + 1 рекомендация, формат COR | варианты, куда дальше, посоветуй |
| **caveman-cheat** | Читерское мышление: рычаг 80/20, де Боно, шорткаты вместо брутфорса | читерский, хак, ловкий путь, 80/20 |
| **caveman-code** | Код как индустрия: чужой код → паттерны → адаптация, KISS/DRY/YAGNI | код, как пишут код, паттерн, рефакторинг |
| **caveman-conclusion** | Вывод всегда: вердикт 1-2 строки + предвосхищение вопроса | вывод, итог, подведи итог, так? |
| **caveman-desktop** | Машина и видео: автозапуск (systemd/launchd/schtasks), OBS FPS, игры через Wine/Proton, монтаж, NVENC | автозапуск, obs, fps, ffmpeg, nvenc |
| **caveman-diagnose** | Чиним без гадания: улики → веб → лечи, одна переменная за раз | не работает, зависло, логи, dmesg, диагноз |
| **caveman-kill** | Охота без самострела: безопасное убийство процессов | pkill, kill, убить процесс, сатоубийство |
| **caveman-loop** | Цикл племени: 8 шагов от памяти до отчёта, пока «готово» не доказано | цикл, ритуал, сделай по-канону |
| **caveman-portability** | Портативность: без хардкод-путей, build-once-run-anywhere | перенос, флешка, другой ПК, vendor-agnostic |
| **caveman-prevent** | Превентив: премортем, FMEA, чини до ошибки | заранее, грабли, риски, превентивно |
| **caveman-research** | Ресёрч: разведка 10+ источников, проверка фактов, градация 🟢🟡🔴 | ресёрч, кауфми, копать, проверь в интернете |
| **caveman-run** | Запуск и долгие процессы: фон + лог + маркер, без поллинга | фоновый, done.json, завис, сторож |
| **caveman-save** | Экономия и форма: батч, дедуп, скрипты в /tmp, файлы 100-300 строк | экономия, сжать, дубликат, критерии успеха |
| **caveman-style** | Стиль пещерника: БРО+🗿, коротко, без воды, желание юзера = закон | бро, пещерник, как говорить |
| **caveman-teach** | Обучение на моём уровне: причины, связи, ДО→ПОСЛЕ, «так?» | обучи, объясни, на пальцах, почему так |
| **caveman-think** | Мышление с откатом: Tree-of-Thoughts, аудит, итерация задачи | подумай, откат, тупик, проверь себя |
| **caveman-verify** | Дотошная проверка: факт vs как должно, пути/связи, постмортем | проверь дотошно, как есть, 5 почему |

---

## Примеры использования

```text
«бро, у меня завис процесс и не убивается»        → включается caveman-kill
«разберись, почему ffmpeg падает на этом файле»   → caveman-diagnose + caveman-desktop
«предложи, куда дальше по проекту»                → caveman-advise
«сделай задачу по-канону»                          → caveman-loop (весь ритуал)
```

---

## Свой скилл за 5 минут

1. Создай папку `skills/my-skill/` с файлом `SKILL.md`.
2. Frontmatter: `name` (совпадает с папкой, `[a-z0-9]+(-[a-z0-9]+)*`), `description` (что делает + когда использовать, до 1024 символов), `license`.
3. Тело — пошаговые инструкции, примеры, грабли. Держи до 500 строк, детали — в `references/`.
4. Запусти `./validate.sh` — проверка по стандарту.
5. Полный стандарт: [agentskills.io/specification](https://agentskills.io/specification).

---

## Релизы

История версий — в [RELEASES.md](RELEASES.md) (формат Keep a Changelog, версии SemVer). Версия каждого скилла — в его metadata (`version`). Поднять версию и записать релиз одним вызовом:

```bash
./bump.sh minor -m "что нового"   # major | minor | patch, по умолчанию patch
```

## Проверка и CI

- `./validate.sh` — локальная проверка всех скиллов: строгий YAML frontmatter, имя=папка, длина description, EN-перевод, **паритет RU/EN** (заголовки и код-блоки должны совпадать 1:1), сверка индекса **SKILLS.yaml** с frontmatter, отсутствие трейсов конкретной машины.
- `SKILLS.yaml` — машиночитаемый индекс всех скиллов (name/version/path/description/languages) для CLI и маркетплейсов; пересобирается через `./update-index.sh` (и сам после `bump.sh`), расхождение ловит validate.sh.
- `.github/workflows/ci.yml` — на каждый push: валидация → тест установки (чистый контейнер: 17 скиллов встают и убираются) → [gitleaks](https://github.com/gitleaks/gitleaks).

## Лицензия

[MIT](LICENSE) © 2026 aidvizhhub. Вольный камень — бери и встраивай.
