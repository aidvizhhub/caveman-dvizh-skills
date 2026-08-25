# RELEASES

Формат — [Keep a Changelog](https://keepachangelog.com/ru/1.0.0/), версии — [SemVer](https://semver.org/lang/ru/).
(Индустрия чаще называет файл `CHANGELOG.md`; у нас имя `RELEASES.md` — как заказано.)

## [Unreleased]

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
