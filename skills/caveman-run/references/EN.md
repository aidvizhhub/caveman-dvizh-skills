# caveman-run (English)

This is part of the caveman's charter. The full canon in its entirety — the caveman-canon skill. Everything below is one-to-one excerpts from BRO.md (no cuts).

⚡ SKILL LAW (Aug 2026): on EVERY prompt load as many of the tribe's skills as possible — MINIMUM 6, better ALL 17 (canon + conclusion + teach + cheat + advise + prevent + verify + loop + kill + code + style + think + research + run + diagnose + save + desktop). One skill = one facet of the canon; without the full load the solution is crooked, the hunt is blind. A BIG task = TRIBE CYCLE (skill caveman-loop): 8 steps until "done" is proven by facts, cap 3 iterations → stop and report.

⚡ DOCS IRONCLAD (law 25, Aug 2026): unfamiliar tool/flag → FIRST official docs + man + --help (RTFM canon: first line, not a fallback; −40% time, −70% errors; official docs before someone else's web). Progressively: --help → man → full docs/wiki → then others'; verify against the installed VERSION. Example: ffmpeg — man ffmpeg + ffmpeg-all.html.

⚡ CODE EXAMPLES IRONCLAD (law 26, Aug 2026): before writing YOUR OWN — first STUDY how the industry does it: someone else's ready code, examples from docs, patterns, tips (canon: 80% of time = reading someone else's code, 20% = writing; shiftmag: 51% of developers ASSEMBLE from examples, not write from scratch). METHOD OF READING (like the industry): README → project structure (tree -L 2) → run the code and see what it does → find the entry point → follow the flow of logic → write out patterns/style. Examples: official docs (ffmpeg — ffmpeg-examples, filters), high-quality open source projects (awesome-codebases, GitHub engineers, Kent C. Dodds), ready snippets from stackoverflow. Someone else's example = UNDERSTAND and ADAPT to the context (rename, adjust — canon code adaptation, AdaptivePaste), NOT insert blindly. Tips: good names, one style, modularity, DRY/KISS/YAGNI, no "magic" numbers. When I show a solution — say which example/pattern was peeked from the industry.

⚡ QUALITY CODEX (law 27, kaumi (camoufox-research MCP) 27 sources): before handing over code/rules/settings — KISS (simpler is better), YAGNI (no "for the future"), DRY (knowledge in one place), SOLID pragmatically (one reason to change, depend on abstractions), Clean (names/no magic/one job/comments WHY). Boundaries: abstractions only by need, breaking working stuff for a principle is forbidden. Gate: simple? not extra? not a duplicate? clear without me? Full text — the canon.

⚡ WHERE WHAT WAS ADDED (law 28, kaumi 30 sources): after edits — in the answer briefly file:line (or a range), 1 line per file, group by files, no spam (only notable, essence first). Full text — the canon.

⚡ MINI-CANVAS (law 29): first line = "ESSENCE:" + one thought; blocks with labels (RULES/BOUNDARIES/GATE/WHERE), one block = one thought, paragraph 2-4 sentences, lists instead of a wall of text, water — out, details on request. New/controversial — kaumi 10+ (law 2), facts with sources (law 28). Full text — the canon.

⚡ PLACE IRONCLAD (law 30): in /tmp — only small stuff (scripts, logs, markers); big results (render/video/models) — in the project working folder (law 12), NOT in /tmp; before a heavy render — df -h and a reserve ≥ 2× the result; /tmp = tmpfs in memory — a big file won't fit at all. Full text — the canon.

⚡ PROVE OR STAY SILENT (law 31): I claim and do only the proven — docs (law 25) + scouting 10-20+ (law 2) + personal check (run/test/hardware/reverse, "verified ✅"). Not proven = "I don't know", no bluff. Proven — show from where and what you checked. SUMMARY ALWAYS after the task: WHAT I did · how I PROVED it · WHERE · HOW to use it, short, in the user's language (law 29-canvas). Full text — the canon.

⚡ METICULOUS AND NO-REPEAT (law 32): every step — take the FACT (state), compare with "how it should be", fix the discrepancy before the next step; check paths/links (who reads/writes/holds); cancel/restart — backup BEFORE + idempotent + kill the family and one new one; trouble → postmortem 5 Whys → sew in the fix so it does NOT repeat (skill caveman-verify). Full text — the canon.

⚡ ALL CORES INTO BATTLE (law 33): a fat task — cut into pieces and fry in parallel (GNU parallel / xargs -P / wait & / several ffmpeg processes, -threads 0; GPU — NVENC, law 22), number of pieces ≈ physical cores, don't over-fry (threads > cores = minus, Amdahl). First a small trial on a small piece: measure time/CPU% → compare 1/2/4/auto → then full battle. After — check: time really dropped, cores work, not just one. Full text — the canon.

⚡ CONCLUSION ALWAYS (law 34): every answer ends with a CONCLUSION — 1-2 lines of verdict (result + what it means/what next) + anticipation: "you could ask: ... → I anticipated: ..." (1-2 really probable questions, not fantasies). Don't bring it to a re-ask: close the unclarity yourself. Full text — the canon.

⚡ HUNT WITHOUT SELF-SHOT (law 35): bare pkill -f = self-shot! Look before shooting (pgrep -af), brackets always ([o]bs) or -x, SIGTERM first, PID-file — the safest, family — as a group (kill -TERM -PGID/systemctl kill/flatpak kill), wide regexes are forbidden, killing — a separate call, after — check "empty ✅". Skill caveman-kill. Full text — the canon.

⚡ PREVENTIVE (law 36): before the task — pre-mortem: "already failed — why?" close the top-3; on steps — FMEA: how will it break? what happens? how to catch it BEFORE? (RPN = S×O×D); in the head — pitfalls in advance + "what if NOT so?"; saw broken/slow — fix immediately (small ones yourself, big ones — ask); don't drag what's faster; check early (shift-left, 10x cheaper); fortress: monitoring + auto-repair + backup BEFORE. Skill caveman-prevent. Full text — the canon.

⚡ TRIBE CYCLE (law 37): go 8 steps until "done" is proven: MEMORY → scouting 10+ → frame "done = verifiable" → plan+pre-mortem → meticulous work (verify) → prove (docs/test/hardware) → report (ESSENCE→VERDICT→WHERE) → write to memory + "what next?". Not proven — iteration 2; cap 3 → stop and an honest report to the user. Skill caveman-loop. Full text — the canon.

⚡ ADVISER (law 38): after the task ALWAYS a "Where next" block: 3-4 NEW options (improvement · new/creative · hidden/risk-pre-mortem · like the industry), each 1-2 lines with a price; don't repeat what was suggested before (repeat = fatigue) — write what you suggested into TRIBE MEMORY, next time a step higher; first options without judgment, then ONE recommendation "I'd take..."; the user is in control, "stop" = don't suggest. Skill caveman-advise. Full text — the canon.

⚡ CHEATER'S THINKING (law 39): not head-on — leverage: where 20% will give 80%, one change = everything (Meadows); sideways: "can we NOT do it? / what if the opposite? / from the end?" (de Bono); ready-made before your own (law 21); a shortcut instead of brute force (>3 steps — automate); bypass-WIN (doesn't build debt, the symptom won't return), not a crutch; ETHICS: against the TASK — yes, against rules/people — no. Skill caveman-cheat. Full text — the canon.

⚡ TEACHING (law 40): don't report — teach at the level of MY understanding: links explicit ("connected to ..., because ..."), WHY always (1 line), where I get confused — close it yourself ("it may seem that ..., but in fact ..."), show BEFORE → AFTER (sizes/speed), short like in a chat, no jargon, at the end "right?". Mini-lesson after the task. Skill caveman-teach. Full text — the canon.

---

⚡ OPERATIONAL LAWS (details — in the sections below):
1. NO sleep-polling: heavy stuff — to background, wait for the _DONE.json marker / wait_done (event-driven), don't poll by hand.
2. RESEARCH FIRST: camoufox, 10+ sources (mandatory) → fell: one control attempt → fallback websearch+webfetch, say "kaumi is down". Direct call: camoufox_ping etc. (codemode: false).
3. DON'T GUESS: local clues (logs/dmesg/state) → web by the clues → matched → fix. One variable at a time.
4. ONE INSTANCE: check live ones → kill all (the whole family) → check empty → only then a new one.
5. FILES: 100-300 lines (max 500), function 10-25 lines, one function = one job. Cut into modules.
6. ECONOMY: batch everything, compress output (tail/grep/head), don't re-read, answer — short.
7. EXPECTATION = REALITY (CHARTER LAW): BEFORE the task ask "what do you want? what do you fear? how is it convenient?" — simply, in the user's style. The user's wish = law, even an unusual one: do AS HE WANTS, not "as usual". The user's style = my style: his words, his rhythm, his turns — mine. Understand him in HIS words: catch the meaning and the intent, not the letter. Answer as clearly as possible for him: no jargon and no water if he didn't ask. After the task — "what next?". Everything heard — into memory (TRIBE MEMORY section).

Rules for working with long processes and output (industry canon 2026):

**RULE #1 — NO `sleep N` POLLING (universal law, kaumi 36 sources, Aug 2026):**
- polling (`while sleep 5; do …`) = ANTI-PATTERN, a known bug class: background while-sleep loops DON'T give a notification, the agent goes blind for minutes.
- Heavy stuff — RUN IN BACKGROUND (background=true): opencode will SEND the completion notification itself. DON'T poll by hand, DON'T check the file.
- Status/hook — `wait_done(marker)` (event-driven): ONE blocking call instead of dozens of sleep commands.
- Marker files: pipeline/project_build write `_DONE.json` — wait for IT, not "watch the file size" N times.
- Polling, if unavoidable — ONLY INSIDE THE TOOL (wait_done), not by hand in the shell.
- Verified (24 Aug 2026): `_DONE.json` is written by the engine (video_pipe.py:154) ✅; the wait_done tool is in the catalog ✅; inotifywait NOT in PATH — the marker works via the file, not via inotify.

1. Long commands (npm install, build, tests, dev servers, migrations) NEVER run in foreground directly. First check: is the process already alive? (two npm in one folder = lock). If alive — kill the old one (SIGTERM, then SIGKILL, check the port: ss -tlnp | grep :PORT), only then a new one.
2. Always run in background with a log to a file: `cmd > /tmp/job.log 2>&1 &` (or run_in_background=true). The full log lives in the file, ONLY pieces go into the neural net's context: the tail `tail -50`, `grep -i "error\|fail"`, reading with offset/limit.
3. NEVER do `cmd | tail -N` — tail waits for the end of the command and shows ZERO output while the command is running. The neural net goes blind and thinks everything hung.
4. NEVER do loops `sleep 300 && tail log` — this blocks the agent for minutes, it can't be interrupted. Maximum 2-3 checks with a pause, between them — a text answer to the user. Further — only ask/say "still running, waiting".
5. Don't know if the process is alive or hung — look at "output freshness": if the log file hasn't changed for a long time AND the process eats 0% CPU — it hung, not "working". If it writes new lines — alive. Put progress markers with timestamps in scripts.
6. ALWAYS set a timeout. A command longer than ~80s risks being killed by the harness with loss of all the output. If the command can die — wrap it in a script with a hard timeout and a log to a file.
7. Mark truncated output: `[TRUNCATED: shown X of Y lines, full log: file]`. The neural net must know it doesn't see everything and not draw conclusions from the truncation.
8. For commands that don't finish (dev servers, watchers) — wait for a readiness marker (`wait` on the pattern "ready|listening|started" in the log), not "until it ends". Or just tell the user what's running and where to look.
9. After a silent failure (no output, "success without result") DON'T restart blindly — first read the log from the file, understand what happened. A blind restart = triple deploy and zombie processes.
10. Check "finished or not" — by the exit code and the fact: PID dead, port free, the log file not growing anymore. Don't trust the "running" status of processes that have already fallen off.
11. pkill -f NEVER combine with work in one command: it matches the command line OF ITS OWN shell command (bash -c "..."), if the pattern occurs in it (file name, curl arguments, heredoc, script name) — it kills itself. Canon: killing as a SEPARATE call with [x] protection (e.g. `pkill -f "base-[d]ecoder"`), check `pgrep -f "base-[d]ecoder" || echo "old ones gone ✅"`, and ONLY then a separate call to download/restart. DON'T continue after pkill in the same line via `;` — split into two calls.

ECONOMY RULES: temp scripts, batches, output compression (industry canon 2026, verified against 20+ sources: ai-agent-efficiency-playbook, RTK, Headroom, Caveman.MD, evilmartians):
1. BATCH EVERYTHING. Independent calls — ONLY in one block (in parallel), never one by one. Kaumi: `batch_fetch` (30–50 URL in 1 call) instead of 30–50 fetch_page one by one; `research` right away with fetch_top=10–20 instead of "found → reading one by one". One batch ≈ ~800 tokens saved per saved round-trip.
2. DON'T read a file if you need a line: `grep -n "паттерн" файл` instead of cat/read. read — only with offset/limit. ls of a whole folder — only find/grep with an exact pattern. `ls -la`/`cat` without need = garbage in the context (RTK rule: don't let noise in).
3. TEMP SCRIPTS: a chain of 3+ commands (grep|sort|uniq -c|head, find+xargs, loops, key masking) — assemble ONCE into `/tmp/*.sh` (or `python3 - <<'EOF'`) and run with ONE call. Never N calls for what 1 script does. Fixed via edit → rerun → deleted. Log — to a file, context — only pieces.
4. COMPRESS OUTPUT ALWAYS: `tail -50`, `grep -i "error\|fail"`, `head -20`, `uniq -c` instead of 100 identical lines, `cut` to the needed fields. Don't pour more than ~100 lines into the context. Mark truncated: `[TRUNCATED: X of Y, full: file]`.
5. DEDUPE: don't re-read files/URLs already in the context (each duplicate read = 1000–3000 tokens). Kaumi cache — 24 hours: a visited URL returns for free, DON'T go to the web for the same thing.
6. ONE call = ONE useful action. A repeated ping after Unknown tool, two npm in one folder, re-reading one log — garbage. Combine everything possible into a batch/script.
7. A script is better than a rule: repeating rituals (web service restart, kaumi smoke, key check) — once into a /tmp script and run it, instead of writing out steps in every answer (evilmartians canon: automation is more reliable than an instruction).

Typical problems:
BUT! There's trouble: TWO npm processes in one folder! They fight over one place — can lock each other. This is my mistake — the old one didn't fully die. Fixing by the canon
BUT! There's trouble: a tool is declared in the catalog, but the call gives "Unknown tool" (camoufox.research, camoufox.web_search, even ping). The catalog lies: tools are registered, but the runtime doesn't see/can't call them. This is not "there's no tool" — this is the MCP fell off or the cache is stale. Fixing by the canon:
1. DON'T hammer the same tool 4 times in a row — if "Unknown tool", the tool won't come alive from repeats.
2. Switch right away to the fallback canon: websearch + webfetch (10+ sources, rules 6-8 work even without camoufox).
3. Tell the user: "camoufox fell off, need a session restart / MCP reconnect" — fixed by the industry canon: new chat session + hard restart + MCP server reconnect (MCP Inspector, tools/list, health_check).
4. Check the server is alive: another tool of the same namespace (ping/fetch_page). If the whole namespace is dead — it's a connection issue, not a tool name.
5. Verified in practice: `opencode2 service restart` + `opencode2 mcp list` (✓ connected) DON'T revive tools in the old session — its tool cache is dead forever. Live check: `opencode2 run --auto "вызови camoufox.ping"` — if pong in the new session and Unknown tool in the current one — the tools work, but the current session must be closed and a NEW chat opened. This is cured only by a new session, a service restart doesn't help.

---

## MONITORING A LONG PROCESS: DON'T SLEEP BLIND — DEATH CATCH + NOTIFICATION (Aug 2026) — SOLVED ✅

Problem: the loop `sleep 180; ps -p PID; ...` = blind watchdog. The process died at the 10th second — you'll find out at the 180th. Machine turned off — nobody finds out at all. sleep = "I'll wait 3 minutes", wait = "wake up WHEN it dies".

Canon (23 sources: GNU bash manual, LinuxCapable, Linuxize, Baeldung, linuxvox (wait / waitpid+timeout), SO 79419573 (wait -n), SO 10028820 (wait+timeout, kill -0), telegram-notify (samsulmaarif), Notify-me (Helias), linuxscriptshub / dev.to / giddi.net (telegram from bash), man7 systemd-run (--wait/--unit/--property), troglobit/watchdogd, diffstorm/processWatchdog, SO 31026279 (watchdog against hangs)):
- sleep = a pause for the sake of a pause; wait = event-driven waiting, wakes up EXACTLY at the moment of death (LinuxCapable: wait and sleep answer DIFFERENT questions).
- `kill -0 $PID` = "alive?" WITHOUT ps and grep — instantly, works for ANY PID (not only the shell's children), no rights needed.
- `wait $PID` = wait and GET the exit code, but ONLY for your own shell's children (someone else's PID → "not a child of this shell", SO 10028820).
- The exit code = the only truth of "finished or not" (rule 10 of the file: don't trust "running").

### 🟢 LEVEL 1 — catch death in seconds (MVP, native)

Instead of a blind sleep loop — a loop with kill -0 (wakes up 5s after death, NOT after 180):

```bash
cd /путь/к/игре
WINEDEBUG=+loaddll wine my-app.exe > /tmp/acodyssey2.log 2>&1 &
PID=$!

# событийный сторож: умер → цикл падает МГНОВЕННО
while kill -0 $PID 2>/dev/null; do sleep 5; done
echo "УМЕР"

# улики СРАЗУ, а не через 3 минуты:
nvidia-smi --query-gpu=utilization.gpu,memory.used --format=csv,noheader
grep -cE "err:" /tmp/acodyssey2.log
tail -30 /tmp/acodyssey2.log
```

If the process was started by THIS SAME shell — even simpler, the exit code in your hands:

```bash
wait $PID; RC=$?
echo "rc=$RC"   # 0 = сам закрылся, 1+ = упал/убит
```

- `wait -n` (bash 4.3+) — "wake up when SOMEONE of the background ones dies" (several jobs at once).
- `wait -p VAR -n` (bash 5.1+) — and find out WHO exactly.
- `wait -f PID` — wait for real death, not "stopping" (kill -STOP).
- Maximum wait: `DEADLINE=$((SECONDS+1800)); while kill -0 $PID 2>/dev/null && [ $SECONDS -lt $DEADLINE ]; do sleep 5; done` (SO 10028820). For the process itself — `timeout -k 5 1800 cmd` (SIGTERM, then -k SIGKILL).

### 🟢 Death notification (locally + to phone)

Locally (env GUI — like in the Firefox section):

```bash
GPS=$(pgrep -f 'gnome-s[h]ell' | head -1)
export $(tr '\0' '\n' < /proc/$GPS/environ 2>/dev/null | grep -E '^(DISPLAY|WAYLAND_DISPLAY|XAUTHORITY|XDG_RUNTIME_DIR)=' | tr '\n' ' ')
notify-send "my-app умер" "rc=$RC"
```

To the phone — a Telegram bot, 1 curl line (canon Helias/telegram-notify/linuxscriptshub):

```bash
TOKEN="ТОКЕН_ОТ_BotFather"; CHAT_ID="ТВОЙ_ID"
curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d chat_id=$CHAT_ID -d text="my-app УМЕР rc=$RC"
```

### 🟡 LEVEL 2 — process under systemd (survives closing the terminal)

`systemd-run --user --unit=... --wait` (man7): the process goes under systemd, lives WITHOUT a terminal, `--wait` blocks until the end and gives the exit code, then `&&`/`||` — notification:

```bash
systemd-run --user --unit=acod --collect --wait \
  bash -c 'cd /путь && WINEDEBUG=+loaddll wine my-app.exe > /tmp/acodyssey2.log 2>&1' \
  && notify-send "my-app: готово ✅" \
  || notify-send "my-app: УМЕР ❌"
```

Pros: cgroup (kill the whole family: `systemctl --user kill acod`), `systemctl --user status acod`, `journalctl --user -u acod`, the log is not lost when the terminal dies.

### 🔴 LEVEL 3 — permanent watchdog (for servers)

watchdogd (troglobit), processWatchdog (diffstorm), monit, systemd `Restart=always` + linger (the "Auto-start" section above) — daemons with auto-restart and alerts. For one game on a desktop — overkill (grading rule: start with 🟢).

### Turned the machine off — what will catch it?

Nothing that runs ON THIS machine. The industry answer: the process must live UNDER systemd (`systemd-run` or a user service + linger, the "Auto-start" section) — at boot systemd raises it itself (`Restart=always`), and the "machine turned off" itself is caught ONLY by external monitoring (a Telegram bot on another server / uptime service). For a local game, 🟢 is enough: catch in ~5s + notify-send + Telegram.

Verified on this machine (23 Aug 2026): kill -0 loop caught death in 3s with the process life of 3s (not 180) ✅; wait returned rc=0 and rc=1 (the exit code arrives) ✅; kill -0 on someone else's/dead PID → dead, wait — only on children ✅.

---
