# RELEASES

## [Unreleased]

### Changed
- Бейдж skills.sh (счётчик установок) добавлен в README (RU/EN).

## [1.3.0] - 2026-08-25

### Changed
- SKILLS.yaml — машиночитаемый индекс (сверка в CI, авто-пересборка в bump.sh)

## [1.2.0] - 2026-08-25

### Changed
- страж RU/EN (паритет заголовков и код-блоков), README.en.md, bump.sh --release, npx-совместимость (YAML-фикс)

Формат — [Keep a Changelog](https://keepachangelog.com/ru/1.0.0/), версии — [SemVer](https://semver.org/lang/ru/).
(Индустрия чаще называет файл `CHANGELOG.md`; у нас имя `RELEASES.md` — как заказано.)

## [1.1.0] - 2026-08-25

### Added
- Полные EN-переводы тел: `references/EN.md` (17/17), в каждой SKILL.md — указатель на перевод.
- `bump.sh` — поднять версию скиллов + записать в RELEASES.md одним вызовом.
- CI: `install-test` — установка во все харнесы в чистом контейнере (17 скиллов → status → uninstall).

### Changed
- Версия 1.0.0 → 1.1.0 во всех 17 скиллах (metadata).
- Вычищен служебный хвост opencode (`<skill_files>` и т.п.) из SKILL.md и EN.md.

## [1.0.0] - 2026-08-25

### Added
- 17 скиллов по открытому стандарту [Agent Skills](https://agentskills.io/specification) (`skills/<имя>/SKILL.md`).
- Двуязычность: у каждого скилла в `description` — русская часть + строка `EN: ...`; в metadata `languages: ru,en`.
- Версия: `version: "1.0.0"` в metadata каждого скилла.
- `install.sh` — установка в 5 харнесов (claude / opencode / codex / gemini / agents), команды install / status / uninstall / `--remote`.
- `validate.sh` — проверка по спецификации (frontmatter, name = папка, description ≤1024, отсутствие следов машины).
- CI: валидация + gitleaks (проверка секретов).
- README (RU, таблицы, бейджи), LICENSE (MIT).

### Changed
- Первая сборка: скиллы перенесены из внутреннего набора, все следы конкретной машины вычищены (пути `<user>`, примеры без имён игр).
