# 🗿 Caveman Skill Set

**17 agent skills: engineering discipline, fact-hunting, safe operations, and clean thinking.**
One skill set, any harness. Based on the open [Agent Skills](https://agentskills.io/specification) format.

> 🇷🇺 Русская версия: [README.ru.md](README.md) · 🇬🇧 English: this file.

[![Skills](https://img.shields.io/badge/skills-17-orange)](#skill-catalog)
[![Version](https://img.shields.io/badge/version-1.3.0-blue)](#releases)
[![Languages](https://img.shields.io/badge/languages-RU+EN-yellow)](#skill-catalog)
[![Format](https://img.shields.io/badge/format-Agent%20Skills-blue)](https://agentskills.io/specification)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![skills.sh](https://skills.sh/b/aidvizhhub/caveman-dvizh-skills)](https://skills.sh/b/aidvizhhub/caveman-dvizh-skills)

---

## What is this

Each skill is a folder `skills/<name>/SKILL.md` following the open **Agent Skills** standard (Anthropic → open standard, agentskills.io). At startup an agent only sees `name` + `description` (progressive disclosure); the full body loads only when the task matches. So 17 skills cost almost nothing in context while carrying a book's worth of guidance.

Skills work in any **skills-compatible** harness:

| Harness | Install path | Verified |
|---|---|---|
| [Claude Code](https://code.claude.com/docs/en/skills) | `~/.claude/skills/` | ✅ |
| [OpenCode](https://opencode.ai/docs/skills/) | `~/.config/opencode/skills/` | ✅ |
| [Codex CLI](https://github.com/openai/codex) | `~/.codex/skills/` | ✅ |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | `~/.gemini/skills/` | ✅ |
| GitHub Copilot / any agent | `~/.agents/skills/` | ✅ |

> Skills are bilingual: `description` in Russian + `EN:` line (metadata `languages: ru,en`), body in Russian with a full English translation in `references/EN.md` (pointer at the top of each SKILL.md). So they trigger on Russian words («бро», «ресёрч», «не работает») and English ones alike. Each skill carries `version`; history lives in [RELEASES.md](RELEASES.md); bump it with `./bump.sh minor`.

---

## Quick start

```bash
# 1. Clone and install into all harnesses
git clone https://github.com/aidvizhhub/caveman-dvizh-skills.git
cd caveman-dvizh-skills
./install.sh all

# 2. Or into a single harness
./install.sh opencode      # claude | opencode | codex | gemini | agents

# 3. Verify what's installed
./install.sh status

# 4. Remove
./install.sh uninstall all
```

One-liner without cloning (fetches the repo into a cache dir):

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/aidvizhhub/caveman-dvizh-skills/main/install.sh) --remote opencode
```

Or with the community CLI manager (75+ harnesses, no clone):

```bash
npx skills add aidvizhhub/caveman-dvizh-skills -g -a claude-code -y
npx skills add aidvizhhub/caveman-dvizh-skills --list   # see the 17 skills first
```

After install, just say "use skill caveman-loop" or describe your task with trigger words — the skill picks itself up.

---

## Compatibility: the kaumi tool (camoufox-research)

Skills **caveman-research** and **caveman-diagnose** refer to "kaumi" — our research MCP server [camoufox-research](https://github.com/aidvizhhub/camoufox-research) (48 tools: web search, page reading, batches, screenshots). It is an external tool, NOT included in this skill set. Without it the agent honestly says "kaumi is down" — that just means "no such tool connected", not a fault:

```bash
# Install kaumi once (needs python3)
git clone https://github.com/aidvizhhub/camoufox-research.git && cd camoufox-research
python3 -m venv ~/.venvs/camoufox-research
~/.venvs/camoufox-research/bin/pip install .
~/.venvs/camoufox-research/bin/python -m camoufox fetch   # download the browser (once)

# Verify connection: opencode mcp list → camoufox: connected
```

The other 15 skills need no kaumi — just a shell.

---

## Skill catalog

| Skill | What it does | Example triggers |
|---|---|---|
| **caveman-advise** | Advisor: after any task — 3-4 next-step options with cost, then ONE firm recommendation (COR format) | ideas, options, what's next |
| **caveman-cheat** | Cheater thinking: leverage 80/20, de Bono lateral moves, shortcuts over brute force | smarter way, bypass, shortcut |
| **caveman-code** | Code the industry way: study examples and patterns, adapt, minimal clean code (KISS/DRY/YAGNI) | code, refactor, review patterns |
| **caveman-conclusion** | Always conclude: 1-2 line verdict + anticipated next question | summary, wrap up, verdict |
| **caveman-desktop** | Machine & video: autostart (systemd/launchd/schtasks), OBS FPS, Linux gaming, video editing, NVENC | autostart, obs, ffmpeg, transcoding |
| **caveman-diagnose** | Fix without guessing: local clues → web by clues → treat, one variable at a time | broken, hangs, logs, dmesg |
| **caveman-kill** | Safe process hunting: never bare pkill -f, bracket trick, SIGTERM first, verify empty | kill, stuck process, restart |
| **caveman-loop** | Tribe loop: 8-step ritual (memory → research → bounds → plan → verify → prove → report → memory) until "done" is proven | act by canon, step-by-step |
| **caveman-portability** | Portability: no hardcoded paths, no vendor lock-in, build-once-run-anywhere | another machine, USB stick, cloud |
| **caveman-prevent** | Prevent: pre-mortem, FMEA, fix before it breaks, test early, monitor | risks, foresight, avoid bugs |
| **caveman-research** | Research: 10+ sources first, official docs, verify facts, grade 🟢🟡🔴 | fact-check, ambiguous question |
| **caveman-run** | Long processes: background + log + done marker, no polling, catch death + notify | background job, timeout, watchdog |
| **caveman-save** | Economy & form: batch, dedupe, temp scripts in one file, 100-300 line files | save calls/tokens, compress |
| **caveman-style** | Caveman style: БРО+🗿, fire/stone imagery, short, no water; user's wish is law | bro, caveman, how to speak |
| **caveman-teach** | Teach at my level: WHY, explicit links, before/after, anticipate confusion, "так?" | explain simply, teach, clarify |
| **caveman-think** | Thinking with backtracking: Tree-of-Thoughts, audit, rollback; truth = facts | hard problem, stuck, verify yourself |
| **caveman-verify** | Verify everything: actual state vs "should be", fix before next step, rollback, postmortem | check, confirm, thorough |

---

## Usage examples

```text
«my process is stuck and won't die»       → caveman-kill
«figure out why ffmpeg fails on this file» → caveman-diagnose + caveman-desktop
«what's next for the project»              → caveman-advise
«do the task by the canon»                 → caveman-loop (full ritual)
```

---

## Your own skill in 5 minutes

1. Create folder `skills/my-skill/` with a `SKILL.md`.
2. Frontmatter: `name` (must match the folder, `[a-z0-9]+(-[a-z0-9]+)*`), `description` (what + when, ≤1024 chars), `license`.
3. Body: step-by-step instructions, examples, edge cases. Keep under 500 lines; details go to `references/`.
4. Run `./validate.sh` — checks the standard + RU/EN parity.
5. Full standard: [agentskills.io/specification](https://agentskills.io/specification).

## Releases

History: [RELEASES.md](RELEASES.md) (Keep a Changelog format, SemVer). Each skill carries its `version` in metadata. Bump it all at once:

```bash
./bump.sh minor -m "what changed"   # major | minor | patch, default patch
./bump.sh --release                 # create the GitHub release for the new version
```

## Validation & CI

- `./validate.sh` — checks all skills: strict YAML, name=folder, description ≤1024, EN translation present, **RU/EN parity** (headings and code blocks must match 1:1), `SKILLS.yaml` index vs frontmatter, no machine traces.
- `SKILLS.yaml` — machine-readable index of all skills (name/version/path/description/languages) for CLIs and marketplaces; rebuilt via `./update-index.sh` (also auto after `bump.sh`); validate.sh catches drift.
- `.github/workflows/ci.yml` — on every push: validate → install test (clean container: 17 skills install and uninstall) → [gitleaks](https://github.com/gitleaks/gitleaks).

## Contributing

The stone grows with the tribe. Simple rules:

- **Contribution guidelines** — [CONTRIBUTING.md](CONTRIBUTING.md): one skill = one job, triggers in description, RU+EN mirror, test before sending.
- **Code of conduct** — [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).
- **Found a vulnerability?** — [SECURITY.md](SECURITY.md), quietly, via private report.
- Issues and pull requests — use templates from `.github/` (auto-filled).

## License

[MIT](LICENSE) © 2026 aidvizhhub. Free stone — take it and embed it.
