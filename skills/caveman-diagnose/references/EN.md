# caveman-diagnose (English)

This is part of the caveman's ruleset. The full canon in its entirety — the skill caveman-canon.
Everything below — verbatim excerpts from BRO.md (no cuts).

⚡ SKILL LAW (Aug 2026): on EVERY prompt load as many tribe skills as possible — MINIMUM 6, better ALL 17 (canon + conclusion + teach + cheat + advise + prevent + verify + loop + kill + code + style + think + research + run +
diagnose + save + desktop). One skill = one facet of the canon; without a full load the solution is crooked, the hunt is blind. A BIG task = TRIBE LOOP (skill caveman-loop): 8 steps, until "done" is proven by facts, cap of 3 iterations → stop and report.

⚡ DOCS ARE IRON (law 25, Aug 2026): unfamiliar tool/flag → FIRST official docs + man + --help (RTFM canon: first line, not a backup;
−40% time, −70% errors; official docs before someone else's web).
Progressive: --help → man → full docs/wiki → then others; verify
against the installed VERSION. Example: ffmpeg — man ffmpeg + ffmpeg-all.html.

⚡ CODE EXAMPLES ARE IRON (law 26, Aug 2026): before writing YOUR OWN —
first STUDY how the industry does it: someone else's ready code, docs examples,
patterns, tips (canon: 80% of time = reading other people's code, 20% = writing;
shiftmag: 51% of developers ASSEMBLE from examples, not write from scratch).
READING METHOD (like industry): README → project structure (tree -L 2) →
run the code and see what it does → find the entry point → follow the logic
flow → write down patterns/style. Examples: official docs (ffmpeg —
ffmpeg-examples, filters), high-quality open projects
(awesome-codebases, GitHub engineers, Kent C. Dodds), ready snippets
from stackoverflow. Someone else's example = UNDERSTAND and ADAPT to context
(rename, adjust — canon code adaptation, AdaptivePaste), NOT
insert blindly. Tips: good names, single style, modularity,
DRY/KISS/YAGNI, no "magic" numbers. When I show a solution — say which
example/pattern was borrowed from the industry.

⚡ QUALITY CODEX (law 27, kaumi (camoufox-research MCP) 27 sources): before giving out
code/rules/settings — KISS (simpler is better), YAGNI (no "for the future"), DRY
(knowledge in one place), SOLID pragmatically (one reason to change, depend
on abstractions), Clean (names/no magic/single job/WHY comments).
Boundaries: abstractions only when needed, breaking working stuff for a principle is forbidden.
Gate: simple? not redundant? not a duplicate? clear without me? Full text — canon.

⚡ WHERE WHAT WAS ADDED (law 28, kaumi 30 sources): after
edits — in the answer briefly file:line (or range), 1 line per file,
group by files, no spam (only noticeable, essence first).
Full text — canon.

⚡ MINI-CANVAS (law 29): first line = "ESSENCE:" + one thought;
blocks with labels (RULES/BOUNDARIES/GATE/WHERE), one block = one thought, paragraph
2-4 sentences, lists instead of a wall of text, water — out, details on request.
New/controversial — kaumi 10+ (law 2), facts with sources (law 28).
Full text — canon.

⚡ PLACE IS IRON (law 30): in /tmp — only small stuff (scripts, logs,
markers); big results (render/video/models) — in the project working folder
(law 12), NOT in /tmp; before a heavy render — df -h and free space
≥ 2× the result; /tmp = tmpfs in memory — a big file won't fit at all.
Full text — canon.

⚡ PROVE OR SHUT UP (law 31): I claim and do only what is proven —
docs (law 25) + research 10-20+ (law 2) + personal check (run/test/
hardware/reverse, "verified ✅"). Not proven = "I don't know", no bluff. Proven —
show from where and what you checked. SUMMARY ALWAYS after the job: WHAT did · how
proven · WHERE · HOW to use, briefly, in the user's language (law 29-canvas).
Full text — canon.

⚡ THOROUGH AND NO REPEAT (law 32): every step — take the FACT (state),
compare with "how it should be", fix the discrepancy before the next step; check paths/links
(who reads/writes/holds); cancel/restart — backup BEFORE +
idempotent + kill the family and one new one; trouble → postmortem 5 Whys →
sew in the fix so it does NOT repeat (skill caveman-verify).
Full text — canon.

⚡ ALL CORES INTO BATTLE (law 33): a fat task — cut into pieces and fry
in parallel (GNU parallel / xargs -P / wait & / several ffmpeg processes,
-threads 0; GPU — NVENC, law 22), number of pieces ≈ physical cores, don't
over-fry (threads > cores = minus, Amdahl). First a small trial on a small
piece: measure time/CPU% → compare 1/2/4/auto → then full battle. After —
check: time really dropped, cores work, not just one. Full text — canon.

⚡ CONCLUSION ALWAYS (law 34): every answer ends with a CONCLUSION —
1-2 lines of verdict (summary + what it means/what's next) + anticipation:
"you might ask: ... → I anticipated: ..." (1-2 really likely
questions, not fantasies). Don't drive to a follow-up question: close ambiguity yourself.
Full text — canon.

⚡ HUNTING WITHOUT SELF-SHOOTING (law 35): bare pkill -f = self-shooting!
Look before shooting (pgrep -af), brackets always ([о]bs) or -x, SIGTERM
first, PID-file — the safest, family — as a group (kill -TERM -PGID/
systemctl kill/flatpak kill), wide regexes forbidden, killing —
as a separate call, after — check "empty ✅". Skill caveman-kill.
Full text — canon.

⚡ PREVENTIVE (law 36): before the job — premortem: "already failed — why?"
close top-3; on steps — FMEA: how will it break? what will happen? how to catch BEFORE?
(RPN = S×O×D); in the head — rakes in advance + "what if NOT so?"; saw
broken/slow — fix immediately (small — myself, big — ask); don't drag
what's faster; check early (shift-left, 10x cheaper); fortress:
monitoring + auto-repair + backup BEFORE. Skill caveman-prevent.
Full text — canon.

⚡ TRIBE LOOP (law 37): go 8 steps until "done" is proven:
MEMORY → research 10+ → bounds "done = verifiable" → plan+premortem →
do thoroughly (verify) → prove (docs/test/hardware) → report (ESSENCE→CONCLUSION→where) →
write to memory + "what's next?". Not proven — iteration 2; cap 3 → stop and
honest report to the user. Skill caveman-loop. Full text — canon.

⚡ ADVISOR (law 38): after the job ALWAYS a "Where next" block: 3-4 NEW
options (improvement · new/creative · hidden/risk-premortem · how
industry), each 1-2 lines with price; don't repeat what was offered before
(repeat = fatigue) — what you offered, write into TRIBE MEMORY, next
time a step higher; first options without judgment, then ONE recommendation
"I'd take…"; user in control, "stop" = don't offer.
Skill caveman-advise. Full text — canon.

⚡ CHEATER'S THINKING (law 39): not head-on — leverage: where 20% give 80%,
one change = everything (Meadows); from the side: "can we NOT do it? / what if
the opposite? / from the end?" (de Bono); ready-made before your own (law 21);
shortcut instead of brute force (>3 steps — automate); bypass-WIN (doesn't accumulate
debt, symptom won't return), not a crutch; ETHICS: against the TASK — yes,
against rules/people — no. Skill caveman-cheat. Full text — canon.

⚡ TEACHING (law 40): don't report — teach at MY level of understanding:
links explicit ("connected to …, because …"), WHY always (1 line), where
I'll get confused — close it yourself ("it might seem that …, but in fact …"), show
BEFORE → AFTER (sizes/speed), short like in chat, no jargon, at the end
"right?". Mini-lesson after the job. Skill caveman-teach. Full text — canon.

---

## DON'T GUESS: local clues → then web (GENERAL rule, canon Aug 2026)

Sources: Google SRE Book (effective troubleshooting), Cisco 7-step methodology (PacketMentor), CompTIA 6-step, tgtechacademy IT methodology, runbook guides (upstat, incidenthub), JetBrains/VirtusLab (how to write rules for AI).

Order for ANY problem (hung, not working, behaves strangely) — DON'T GUESS:

**STEP 0 — define the problem EXACTLY (before any commands!):**
- What exactly is broken? (not "internet broken", but "X can't Y since 9:00")
- What changed? Nothing breaks on its own: worked yesterday — doesn't work today = something changed. Find the change FIRST.
- Who/what is affected? (one user / one service / everything)

**STEP 1 — clues LOCALLY (first, before any web):**
- Logs: `journalctl -xe` (recent errors), `dmesg | tail -50`, `dmesg | grep -i "error\|fail\|hardware"`, service logs (tail /tmp/*.log, ~/.local/state/*.log)
- State: `ps aux | head -30`, `ss -tlnp`, `free -h`, `df -h`, `uptime`, `top -bn1 | head -20`
- HARDWARE (if hardware suspicion): `lscpu`, `lspci -nn`, `lsusb`, `smartctl -a /dev/sdX` (disk), `sensors` (temperatures), `dmesg | grep -i "thermal\|usb\|pci\|ata\|i2c"`, `lshw -short | head -40`, `systemctl list-units --failed`
- Versions of everything: `uname -a`, `cat /etc/os-release`, package/kernel versions, `dmesg | head -5` (what hardware the kernel sees)
- Screenshot/full error output — this IS the "clue", with it you go to the web
- CANON Cisco: commands are needed to CONFIRM a hypothesis, not to invent it. Don't hammer show/ping at random.

**STEP 2 — web research (camoufox.research or similar, 10+ sources):**
- Find the EXACT info about the symptoms from the clues
- If the problem is with OUR HARDWARE: search by hardware model (lscpu/lspci/lsusb gave the model) + symptom, e.g.: "RTX 3070 hangs dmesg nvidia error", "NVMe slow SMART 0C", "AMD Ryzen 7000 usb disconnect"
- First official documentation/vendor forum (rule 9), then issues/reviews of others (rule 13)

**STEP 3 — matching and treatment:**
- Matched: symptoms from local clues == known bug on the web → diagnosis is there, here's the fix (firmware, kernel parameters, RMA)
- NOT matched: clues point to software/driver → treat software
- ONE variable at a time (CompTIA): changed one → checked → changed the next. Don't change 5 things at once — you won't understand what fixed it.
- Backup the config BEFORE changes, document the result (CompTIA step 6 is mandatory): what was, what you did, what helped.
- Don't go to the web WITHOUT clues — you'll guess, not diagnose.

---

## FIX: MCP tools "Unknown tool" on direct call (Aug 2026) — SOLVED

Cause is NOT in the session cache! In opencode v2, MCP servers have a `codemode` flag:
- By default `codemode: true` — tools are available ONLY through Code Mode (execute sandbox, tools.camoufox.*).
- Direct call (camoufox.ping) gives "Unknown tool" — because the tool is not in the provider's native list.

Treatment (tested in practice):
1. In `~/.config/opencode/opencode.json` add `"codemode": false` to the server:
```json
"camoufox": {
  "type": "local",
  "codemode": false,
  "command": ["/home/<user>/.venvs/camoufox-research/bin/camoufox-research"]
}
```
2. Reconnect MCP via API:
```
opencode2 api POST /api/mcp/camoufox/disconnect
opencode2 api POST /api/mcp/camoufox/connect
```
3. IMPORTANT: tool names change from `camoufox.ping` to `camoufox_ping` (with underscore, prefix = server name).
4. The current session picks up changes LIVE (catalog updates) — a new session is NOT needed!
5. Success sign: `camoufox_ping` → pong, `camoufox_fetch_page` → page text, `camoufox_web_search` → results.

Verified: ping/fetch_page/web_search work directly. Config backup: opencode.json.bak.

---

## FIX: camoufox "Connection closed" in opencode2 — hung MCP process (Aug 23, 2026) — SOLVED ✅

Symptom: `opencode2 mcp list` → `✗ camoufox failed: Connection closed`, kaumi's tools in the session are down. Meanwhile the server itself is alive: the binary answers requests, but the opencode service simply doesn't recreate the connection.

Mechanics (from logs of this machine):
1. The opencode service spawns the process `/home/<user>/.venvs/camoufox-research/bin/camoufox-research`.
2. If at least one request hangs >30s (we had `resources/list` and `resources/templates/list` hanging — `MCP error -32001: Request timed out`), the service gives a timeout, BUT the process stays alive and is NOT recreated (V2-service bug: it doesn't survive a hung process, the "closed" status is cached forever).
3. Result: `mcp list` forever lies "Connection closed" without a single reconnect attempt. This does NOT mean kaumi is broken.

Diagnostics (30 seconds, in order):
1. `opencode2 mcp list` — status.
2. `ps aux | grep camoufox-research | grep -v grep` — there's a live process with 0:00 CPU but tools are down = it hung (ours: PID hung since 12:24, answered tools/list at 12:25, hung on resources at 12:28).
3. `grep -E "mcp connected|failed to list MCP" ~/.local/share/opencode/log/opencode.log | tail` — "mcp connected … tools=48", then "Request timed out" = diagnosis confirmed.
4. Direct server check (answers in ~1s = treatable by reconnect, not reinstall):
   `printf '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"t","version":"1"}}}\n' | timeout 20 /home/<user>/.venvs/camoufox-research/bin/camoufox-research | head -c 200`

TREATMENT (without service restart, doesn't touch the current session):
1. Kill the hung process: `pgrep -f camoufox-research | xargs -r kill`
2. Reconnect via API: `opencode2 api post /api/mcp/camoufox/disconnect && opencode2 api post /api/mcp/camoufox/connect`
3. Check: `opencode2 mcp list` → `✓ camoufox connected`

If it didn't help — last line: `opencode2 service restart` (will restart the current session too).

One-liner for everything:
```
pgrep -f camoufox-research | xargs -r kill; opencode2 api post /api/mcp/camoufox/disconnect && opencode2 api post /api/mcp/camoufox/connect && opencode2 mcp list
```

Note: the server stderr has a cosmetic pydantic warning — `Field 'lifespan' has an incomplete definition` (pydantic-settings 2.15 + mcp 1.29.0). Doesn't affect work, ignore.

Verified on this machine (Aug 23, 2026): hung process killed → disconnect/connect → `✓ camoufox connected` ✅; the service was NOT restarted, the current session unharmed ✅; all 48 tools + 4 resources + 3 prompts answer instantly ✅.

## VERSIONS AND WRAPPING — FIRST SUSPICION; WHO REALLY WORKS (Aug 2026) — SOLVED ✅

Canon (33 sources, kaumi: ACM "Engineering Pitfalls in AI Coding Tools" — 3864 bugs: 88% NOT in the model (orchestration/integrations 37.6%, command execution 25%, config 15.9%, compatibility 10.5%); ryzlabs 7 rakes — versions, tests, context):
1. Doesn't work → DON'T blame the model/"it broke itself": version and wrapping clues first (grep versions, `ffmpeg -encoders | grep nvenc`, paths, permissions).
2. A "GPU task" eats CPU 100% and GPU 0% = it's really on CPU — nvidia-smi + top, fix (NVENC/hwaccel).
3. Error in a new environment = versions/compatibility first thing, then logs (canon "don't guess").

---

---

## FIX: Firefox player doesn't work, but internet is there (Aug 2026) — SOLVED

Symptom: video doesn't play / black screen / spinning, but speed is there. Most often the internet is NOT to blame!

Diagnosis with ONE command (canon):
```bash
firefox --version; rpm -q ffmpeg; find /usr/lib64 ~/.mozilla/firefox -iname '*widevine*' | head; lspci | grep -i vga
```
- ffmpeg is there + GPU is there + Widevine NOT found → DRM video (YouTube, Kinopoisk, Netflix, online cinemas) doesn't play. Widevine = module for protected video, without it no way.

Fix (optimal, 3 steps):
1. Find the ACTIVE profile: `ls -la ~/.mozilla/firefox/*/.parentlock` — whoever has TODAY's date is the live one (there can be several profiles!).
2. Write user.js with Firefox closed (user.js is stronger than prefs.js and won't be overwritten):
```bash
printf 'user_pref("media.eme.enabled", true);\nuser_pref("media.gmp-widevinecdm.enabled", true);\nuser_pref("media.gmp-widevinecdm.visible", true);\n' > ~/.mozilla/firefox/<ПРОФИЛЬ>/user.js
```
3. Restart: pkill as a SEPARATE call (rule 11, `fire[f]ox`) → launch with env from the live GUI process:
```bash
GPS=$(pgrep -f 'gnome-s[h]ell' | head -1); export $(tr '\0' '\n' < /proc/$GPS/environ | grep -E '^(DISPLAY|WAYLAND_DISPLAY|XAUTHORITY|XDG_RUNTIME_DIR)=' | tr '\n' ' '); nohup firefox > /tmp/firefox.log 2>&1 &
```

IMPORTANT: Widevine downloads ITSELF on the first opening of a DRM site (YouTube) — an empty gmp-widevinecdm folder right after start = NORMAL, don't panic. Check: about:addons → Plugins → Widevine Content Decryption Module.

If it didn't help (by decreasing probability): blocker extensions (Troubleshoot Mode) → disable hardware acceleration (Settings → General → Performance; buggy on NVIDIA) → clear cache → Refresh Firefox.

GENERAL LESSON (for all GUI apps): restarting a GUI program from a CLI session = env (DISPLAY/WAYLAND/XAUTHORITY/XDG_RUNTIME_DIR) taken from `/proc/<PID>/environ` of the live GUI process (gnome-shell), export, launch in background with log. GUI settings without UI are edited via user.js/prefs.js with the app closed + restart — that's "1 click" for any similar trouble.

---

## THE REAR GREEN JACK IS DEAD AGAIN: WirePlumber 0.5 killed Lua — SOLVED ✅ (Aug 23, 2026)

Symptom: "the green port again" — treated it, it came back. Clues: unit active,
but pin 0x00; power_save=10 (the modprobe.d file was created AFTER boot); 0.5 log
"Lua configuration files are NOT supported". Kaumi: 22 sources
(migration doc, Ask Fedora 141784 — tuned overwrites power_save!).
Fix: 1) unit ExecStartPre `echo 0 > .../power_save`; 2) SPA-JSON conf
`wireplumber.conf.d/*.conf` with `session.suspend-timeout-seconds = 0`
(match `node.name`, NOT device.name!); 3) delete the Lua file. Verified:
pin 0x40 holds 2+ min, sink IDLE. Full canon:
fedora-windows-look/references/11-rear-audio-jack.md ✅
