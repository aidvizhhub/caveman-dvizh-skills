# caveman-portability (English)

This is part of the caveman's ruleset. The full canon in its entirety — the skill caveman-canon.
Everything below — verbatim excerpts from BRO.md (no cuts).

⚡ SKILL LAW (Aug 2026): on EVERY prompt load as many tribe skills as possible — MINIMUM 6, better ALL 17 (canon + conclusion + teach + cheat + advise + prevent + verify + loop + kill + code + style + think + research + run +
diagnose + save + desktop + portability). One skill = one facet of the canon; without a full load
the solution is crooked, the hunt is blind. A BIG task = TRIBE LOOP (skill caveman-loop): 8 steps, until "done" is proven by facts, cap of 3 iterations → stop and report.

⚡ DOCS ARE IRON (law 25, Aug 2026): unfamiliar tool/flag → FIRST official docs + man + --help (RTFM canon: first line, not a backup;
−40% time, −70% errors; official docs before someone else's web).
Progressive: --help → man → full docs/wiki → then others; verify
with the installed VERSION. Example: ffmpeg — man ffmpeg + ffmpeg-all.html.

---

## ESSENCE: skills repository = portable package (Aug 2026) — SOLVED ✅

Canon (47 sources, kaumi (camoufox-research MCP) Aug 25, 2026: 12-Factor App — config separate from code, env vars; Portable Documentation System — self-contained, offline; Vendor-Agnostic Architecture — API-first, JSON configs; Build Once Run Anywhere — environment-agnostic; Agent-Agnostic Repository — works with any AI agent; Portable Paths in Knowledge Management — location agnosticism, no os.path.expanduser):

Meaning: the skills repository = a portable package. Copied to a USB stick, another PC, into the cloud — works without edits. No `/run/media/<user>/...`, no `~/.config/...`, no bindings to the machine.

## RULES (live):

1. **RELATIVE PATHS EVERYWHERE** — scripts look for files relative to themselves:
   ```bash
   SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
   SKILLS_DIR="${SKILLS_DIR:-$SCRIPT_DIR}"
   ```
   Don't hardcode `/run/media/<user>/data/мой-пакет`.

2. **ENVIRONMENT VARIABLES FOR CONFIG** — 12-Factor App canon:
   ```bash
   # WAS (hardcode):
   API_KEY="sk-12345"
   DB_PATH="/home/<user>/.db"
   
   # NOW (env vars):
   API_KEY="${OPENAI_API_KEY:?нужен OPENAI_API_KEY}"
   DB_PATH="${SKILLS_DIR:-.}/data/db"
   ```

3. **NO BINDING TO THE MACHINE** — don't use:
   - `/home/username/...` (depends on the user)
   - `/run/media/...` (depends on the mount point)
   - `~/.config/...` (depends on HOME)
   - MAC addresses, hostname, disk UUID

4. **VENDOR-AGNOSTIC FORMATS** — use open formats:
   - Markdown (.md) instead of .docx/.pdf
   - JSON/YAML instead of binary configs
   - Git instead of SVN/Mercurial
   - OpenAI API instead of proprietary SDKs

5. **SELF-CONTAINED PACKAGE** — everything needed inside the package:
   - Scripts work without external dependencies (except bash/python3)
   - Documentation reads without internet
   - Skills load from a local folder, not from the cloud

6. **BUILD ONCE, RUN ANYWHERE** — wrote once, works everywhere:
   - Test on 3+ environments (Linux/macOS/Windows WSL)
   - Containers (Docker) for full isolation
   - CI/CD runs portability tests

7. **ENVIRONMENT AUTODETECT** — the script finds where it lies itself:
   ```bash
   # Find the package by structure
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

8. **CONFIG SEPARATE FROM CODE** — 12-Factor App:
   - Code (scripts) = in git, doesn't change
   - Config (paths, keys) = env vars or config.json
   - Data (modules, skills) = separate, can be updated

## RAKES (don't do):

- ❌ `SKILLS_DIR="/run/media/<user>/data/мой-пакет"` — will break on another machine
- ❌ `API_KEY="sk-12345"` in code — leak + not portable
- ❌ `cd /home/<user>/...` — depends on the user
- ❌ `~/.config/opencode/...` — depends on HOME
- ❌ Proprietary formats (.docx, .pdf) — require special programs

## PORTABILITY CHECK:

```bash
# Test: copy to /tmp and run
cp -r ./my-skill-pack /tmp/test-portable
cd /tmp/test-portable
./test_quality_gates.sh  # should work
```

If it works — portable ✅. If not — find the hardcode and fix it.

---

##  Don't do
- **Don't hardcode paths** — only relative or env vars
- **Don't bind to the machine** — no MAC/hostname/UUID
- **Don't use proprietary formats** — only open (md/json/yaml)
- **Don't depend on the internet** — everything should work offline
- **Don't depend on the vendor** — API-first, not SDK-first

## 🔗 Links
- **Core (laws)** → `../modules/laws.md`
- **How to work with files** → `../modules/work.md`
- **Portability (module)** → `../modules/portability.md`
- **Economy (scripts)** → `../skills/caveman-save`
- **12-Factor App** → https://12factor.net/

---

*Portability = freedom. Carry it anywhere you want, it works everywhere.* 🗿
