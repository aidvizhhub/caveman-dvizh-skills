# caveman-desktop (English)

This is part of the caveman charter. The full canon is entirely in the caveman-canon skill.
Everything below is verbatim excerpts from BRO.md (nothing shortened).

⚡ SKILL LAW (Aug 2026): on EVERY prompt, load as many tribe skills as possible — MINIMUM 6, better ALL 17 (canon + conclusion + teach + cheat + advise + prevent + verify + loop + kill + code + style + think + research + run + diagnose + save + desktop). One skill = one facet of the canon; without the full load the solution is crooked, the hunt is blind. A BIG task = THE TRIBE CYCLE (skill caveman-loop): 8 steps, until "done" is proven by facts, cap 3 iterations → stop and report.

⚡ DOCS ARE IRON (law 25, Aug 2026): unfamiliar tool/flag → FIRST official docs + man + --help (RTFM canon: the first line, not a fallback; −40% time, −70% errors; official docs before third-party web). Progressive: --help → man → full docs/wiki → then third-party; verify against the installed VERSION. Example: ffmpeg — man ffmpeg + ffmpeg-all.html.

⚡ CODE EXAMPLES ARE IRON (law 26, Aug 2026): before writing YOUR OWN — first STUDY how the industry does it: someone else's ready code, examples from docs, patterns, tips (canon: 80% of the time = reading someone else's code, 20% = writing; shiftmag: 51% of developers ASSEMBLE from examples, not write from scratch). THE METHOD OF READING (like the industry): README → project structure (tree -L 2) → run the code and see what it does → find the entry point → follow the flow of logic → write out the patterns/style. Examples: official docs (ffmpeg — ffmpeg-examples, filters), high-quality open-source projects (awesome-codebases, GitHub engineers, Kent C. Dodds), ready snippets from stackoverflow. Someone else's example = UNDERSTAND and ADAPT to the context (rename, adjust — the canon code adaptation, AdaptivePaste), NOT insert blindly. Tips: good names, one style, modularity, DRY/KISS/YAGNI, no "magic" numbers. Showing a solution — say which example/pattern was peeked at the industry.

⚡ THE QUALITY CODEX (law 27, kaumi (camoufox-research MCP) 27 sources): before giving out code/rules/settings — KISS (simpler is better), YAGNI (no "for the future"), DRY (knowledge in one place), SOLID pragmatically (one reason to change, depend on abstractions), Clean (names/no magic/one job/WHY comments). Boundaries: abstractions only by need, you can't break working code for the sake of a principle. Gate: simple? not extra? not a duplicate? clear without me? Full text — canon.

⚡ WHERE WHAT WAS ADDED (law 28, kaumi 30 sources): after edits — in the answer briefly file:line (or a range), 1 line per file, group by files, no spam (only noticeable, essence first). Full text — canon.

⚡ MINI-CANVAS (law 29): the first line = "ESSENCE:" + one thought; blocks with labels (RULES/BOUNDARIES/GATE/WHERE), one block = one thought, a paragraph 2-4 sentences, lists instead of a wall, water — out, details on request. New/controversial — kaumi 10+ (law 2), facts with sources (law 28). Full text — canon.

⚡ PLACE IS IRON (law 30): in /tmp — only small (scripts, logs, markers); big results (render/video/models) — into the project working folder (law 12), NOT /tmp; before a heavy render — df -h and reserve ≥ 2× the result; /tmp = tmpfs in memory — a big file won't fit at all. Full text — canon.

⚡ PROVE OR BE SILENT (law 31): I claim and do only what is proven — docs (law 25) + recon 10-20+ (law 2) + personal check (run/test/hardware/reverse, "verified ✅"). Not proven = "I don't know", no bluff. Proven — show from where and what I checked. SUMMARY ALWAYS after the task: WHAT was done · with what proven · WHERE · HOW to use, short, in the user's language (law 29-canvas). Full text — canon.

⚡ DILIGENTLY AND NO-REPEAT (law 32): each step — capture the FACT (state), compare with "how it should be", fix the discrepancy before the next step; check paths/links (who reads/writes/holds); cancel/restart — backup BEFORE + idempotently + kill the family and one new; trouble → postmortem 5 Whys → embed the fix so it does NOT repeat (skill caveman-verify). Full text — canon.

⚡ ALL CORES INTO BATTLE (law 33): a fat task — cut into pieces and fry in parallel (GNU parallel / xargs -P / wait & / several ffmpeg processes, -threads 0; GPU — NVENC, law 22), the number of pieces ≈ physical cores, don't overfry (threads > cores = minus, Amdahl). First a small trial on a small piece: measure time/CPU% → compare 1/2/4/auto → then the full battle. After — check: the time really fell, the cores work, not just one. Full text — canon.

⚡ CONCLUSION ALWAYS (law 34): every answer ends with a CONCLUSION — 1-2 lines of verdict (summary + what it means/what's next) + anticipation: "you might ask: ... → I anticipated: ..." (1-2 really likely questions, not fantasies). Don't lead to a re-ask: close the unclarity yourself. Full text — canon.

⚡ HUNT WITHOUT SELF-SHOT (law 35): bare pkill -f = self-shot! Look before shooting (pgrep -af), brackets always ([o]bs) or -x, SIGTERM first, PID-file — the safest, the family — by group (kill -TERM -PGID/systemctl kill/flatpak kill), wide regexes are forbidden, killing — a separate call, after — check "empty ✅". Skill caveman-kill. Full text — canon.

⚡ PREVENTIVE (law 36): before the task — premortem: "already failed — why?" close the top-3; on steps — FMEA: how will it break? what will happen? how to catch BEFORE? (RPN = S×O×D); in the head — pitfalls in advance + "what if NOT so?"; saw broken/slow — fix immediately (small yourself, big — ask); don't drag what is faster; check early (shift-left, 10x cheaper); fortress: monitoring + auto-repair + backup BEFORE. Skill caveman-prevent. Full text — canon.

⚡ THE TRIBE CYCLE (law 37): go 8 steps until "done" is proven: MEMORY → recon 10+ → frame "done = verifiable" → plan+premortem → do diligently (verify) → prove (docs/test/hardware) → report (ESSENCE→CONCLUSION→where) → write to memory + "what's next?". Not proven — iteration 2; cap 3 → stop and an honest report to the user. Skill caveman-loop. Full text — canon.

⚡ ADVISOR (law 38): after the task ALWAYS a "Where to next" block: 3-4 NEW options (improvement · new/creative · hidden/risk-premortem · as the industry), each 1-2 lines with a price; don't repeat what was offered before (repeat = fatigue) — what you offered, write into the TRIBE MEMORY, next time a step higher; first options without judgment, then ONE recommendation "I'd take..."; the user is in control, "stop" = don't offer. Skill caveman-advise. Full text — canon.

⚡ CHEATER THINKING (law 39): not head-on — leverage: where 20% give 80%, one change = everything (Meadows); sideways: "can we NOT do it? / what if reversed? / from the end?" (de Bono); ready-made before your own (law 21); shortcut instead of brute force (>3 steps — automatic); bypass-WIN (doesn't accumulate debt, the symptom won't return), not a crutch; ETHICS: against the TASK — yes, against rules/people — no. Skill caveman-cheat. Full text — canon.

⚡ TEACHING (law 40): don't report — teach at the level of MY understanding: explicit links ("connected to ..., because ..."), WHY always (1 line), where I get confused — close it yourself ("it may seem that ..., but in fact ..."), show BEFORE → AFTER (sizes/speed), short as in a chat, without jargon, at the end "right?". A mini-lesson after the task. Skill caveman-teach. Full text — canon.

---

## AUTOSTART OF ANY PROGRAM AT SYSTEM START — examples for ALL OSes (Aug 2026) — SOLVED ✅

Canon (18+ sources: ArchWiki systemd/User, launchd guides, stackharbor, joshuatz task-scheduler, ready systemd-unit templates (GitHub)):
Each OS has its own "god of autostart": Linux → systemd, macOS → launchd, Windows → Task Scheduler.
IMPORTANT: launchd/systemd inherit almost NOTHING from the shell — PATH and env must be written EXPLICITLY into the service file (verified: stackharbor).

### 🐧 Linux — systemd user service + linger

```bash
# 1. Файл сервиса
mkdir -p ~/.config/systemd/user
cat > ~/.config/systemd/user/myapp.service <<'EOF'
[Unit]
Description=My App
After=network.target

[Service]
Type=simple
ExecStart=/путь/к/бинарнику web --no-open
WorkingDirectory=/home/ЮЗЕР
Restart=on-failure
RestartSec=5
Environment=HOME=/home/ЮЗЕР
Environment=PATH=/home/ЮЗЕР/.local/bin:/usr/local/bin:/usr/bin:/bin

[Install]
WantedBy=default.target
EOF

# 2. Включить + запустить
systemctl --user daemon-reload
systemctl --user enable --now myapp.service

# 3. LINGER — сервис стартует при загрузке системы, даже без входа в GUI
sudo loginctl enable-linger $USER
loginctl show-user $USER -p Linger   # → Linger=yes

# 4. Проверка
systemctl --user is-active myapp.service
journalctl --user -u myapp.service -n 20 --no-pager | grep -iE "http://|listen|error"
```

### 🍎 macOS — launchd LaunchAgent (plist)

```bash
# Файл: ~/Library/LaunchAgents/com.user.myapp.plist
# Имя файла ДОЛЖНО совпадать с Label!
cat > ~/Library/LaunchAgents/com.user.myapp.plist <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>com.user.myapp</string>
  <key>ProgramArguments</key>
  <array>
    <string>/Users/ЮЗЕР/.local/bin/myapp</string>
    <string>web</string>
    <string>--no-open</string>
  </array>
  <key>RunAtLoad</key>
  <true/>          <!-- запустить при логине -->
  <key>KeepAlive</key>
  <true/>          <!-- перезапускать если упал -->
  <key>ThrottleInterval</key>
  <integer>5</integer>
  <key>EnvironmentVariables</key>
  <dict>
    <key>PATH</key>
    <string>/Users/ЮЗЕР/.local/bin:/usr/local/bin:/usr/bin:/bin</string>
    <key>HOME</key>
    <string>/Users/ЮЗЕР</string>
  </dict>
  <key>StandardOutPath</key>
  <string>/tmp/myapp.log</string>
  <key>StandardErrorPath</key>
  <string>/tmp/myapp.err</string>
</dict>
</plist>
EOF

plutil -lint ~/Library/LaunchAgents/com.user.myapp.plist   # → OK
launchctl load ~/Library/LaunchAgents/com.user.myapp.plist  # старый способ
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.user.myapp.plist  # новый способ
launchctl print gui/$(id -u)/com.user.myapp    # проверка: процесс жив, exit 0
# Убрать: launchctl unload (или bootout)
```
Runs AT THE USER'S LOGIN (LaunchAgent). Running before login from root — LaunchDaemon (needs sudo, not for personal programs).

### 🪟 Windows — Task Scheduler (schtasks, from CMD/PowerShell as admin)

```bat
:: Запуск при входе в систему (ONLOGON) или при старте системы (ONSTART)
schtasks /Create /TN "MyApp" /SC ONLOGON ^
  /TR "\"C:\Users\ЮЗЕР\AppData\Roaming\npm\myapp.cmd\" --no-open" ^
  /RU ЮЗЕР /RL LIMITED /F
:: /SC ONSTART — при загрузке системы (нужны права админа)
:: /SC ONLOGON — при входе юзера (без админа, если /RU юзер)

schtasks /Query /TN "MyApp"            :: проверка
schtasks /Run /TN "MyApp"              :: запустить сейчас
schtasks /Delete /TN "MyApp" /F        :: убрать
```
GUI alternative: taskschd.msc → Create Task → Trigger: At log on → Action: Start a program (path to .cmd/.exe + arguments) → Settings tab: "Restart on failure".
Simple alternative: put a .cmd shortcut in `shell:startup` (Win+R → shell:startup) — run at login, WITHOUT a restart on crash.

### ⚙️ Universal order (the canon "don't guess"):
1. `which myapp` / `where myapp` — find the EXACT path to the binary (write the absolute path into the service, not the name from PATH!).
2. Env (PATH/HOME/DISPLAY) — write explicitly, systemd/launchd take NOTHING from the shell.
3. The `--no-open` flag if the program opens the browser itself (some applications open a browser at start — under a service this is a fail/junk).
4. Restart/RestartSec/KeepAlive — so it revives itself after a crash.
5. Check: the port listens + HTTP 200 (`curl http://127.0.0.1:3080`), the journal with a readiness marker.
6. One variable at a time, write down the result.

Verified on this machine (Aug 2026): user service + linger → starts at boot, active, the port listens, HTTP 200. ✅

## OBS 32: 120 FPS — ONLY VIA INTEGER FPS, not Common! — SOLVED ✅ (Aug 2026)

Symptom: FPSCommon=120 in basic.ini [Video] — OBS ignores it and sets 30/1.
Clue: obs-studio sources OBSBasic.cpp GetFPSCommon() — valid are ONLY "10","20","24 NTSC","25 PAL","29.97","48","50 PAL","59.94","60"; else → 30/1 (silently!). 120/240 in Common NOT there!
Fix: FPSType=1 (Integer) + FPSInt=120 → fps: 120/1. (FPSType: 0=Common, 1=Integer, 2=Fraction)
Verified on this machine (Aug 2026): 1920x1080 @ 120/1, HEVC CQP 20, monitor 144 Hz. ✅
ATTENTION rule 11: pkill -f "[o]bs" in one command with the log file /tmp/obs*.log = shell suicide (the pattern matches the log's name!). pkill — ONLY as a separate call.

## OBS: 144 FPS — FRACTION FPS (FPSType=2, FPSNum=144, FPSDen=1) — SOLVED ✅ (Aug 2026)

Turing NVENC (GTX 1660 SUPER) pulls 1080p up to 240 fps HEVC — 144 with a reserve (kaumi: NVIDIA App Note + OBS forum). Disk check: Kingston A400 SATA SSD ~450 MB/s, recording 144fps HEVC ≈ 5 MB/s — the reserve is huge. LUKS encryption doesn't bother.
Verified on this machine (Aug 2026): 1920x1080 @ 144/1, HEVC CQP 20, MKV, audio 192. ✅

## RUNNING GAMES ON LINUX: THE INDUSTRY CANON (Aug 2026) — 3 PATHS FOR ACODYSSEY

Canon (30 sources: caniplayonlinux, linuxvox, tech-insider Lutris 2026, botmonster stack 2026, Heroic vs Lutris vs Bottles, theserverhost, nerdburglars, shattered.io, XAOSTECH/wine-gaming, mrthundergod/wine-game-manager, Gowwre/wine-app-launcher, ULWGL-forum Lutris, XDA Proton, howtogeek, itsfoss):
- Stack 2026: Wine (API layer) + DXVK (DX9-11→Vulkan) + VKD3D-Proton (DX12) + Proton (everything together for Steam) + NTSync (kernel 6.14+, a copy of Windows synchronization).
- Launchers: Steam/Proton (auto), Lutris (universal, community scripts), Bottles (prefix isolation), Heroic (Epic/GOG/Amazon). For a standalone game the industry pattern = **launch script + .desktop shortcut** (wine-game-manager: "A launch script and desktop shortcut are automatically created for every game"; wine-app-launcher: "launcher scripts and .desktop files").
- ULWGL/UMU — unification: all launchers run games through Proton + unified protonfix scripts (the future, our scheme doesn't require it).

Example: 3 working paths to run a game (ACOdyssey, verified 23 Aug 2026):
1. 🖱️ **GNOME Menu** → the icon "Assassin's Creed Odyssey" (.desktop → aco-launch.sh, Terminal=true) — the simplest, like native games.
2. 📁 **Script from the game folder**: `/home/<user>/.wine/drive_c/Program Files (x86)/Assassins Creed Odyssey/launch.sh`
3. ⌨️ **Terminal directly** (log to a file, watchdog kill -0):
```bash
GPS=$(pgrep -f 'gnome-s[h]ell' | head -1); export $(tr '\0' '\n' < /proc/$GPS/environ | grep -E '^(DISPLAY|WAYLAND_DISPLAY|XAUTHORITY|XDG_RUNTIME_DIR)=' | tr '\n' ' '); cd "/home/<user>/.wine/drive_c/Program Files (x86)/Assassins Creed Odyssey" && WINEDEBUG=+loaddll wine ACOdyssey.exe > /tmp/acod.log 2>&1 &
```
ALL 3 lead to ONE path: `cd папка игры && WINEDEBUG=+loaddll wine игра.exe`. Don't confuse: if the game is NOT from Steam, Proton is not needed — pure Wine + DXVK next to the game.

---

## VIDEO EDITING: AI = brain + tools (24 Aug 2026) — SOLVED ✅

Canon: the agent (I) decides, Whisper hears, ffmpeg/NVENC cuts. The industry pattern (55+ sources): transcription → analysis → cutting. Answering from the head FORBIDDEN — always research.
- Transcription: faster-whisper in venv (Py3.14 ok, ctranslate2 4.8.1) + MANDATORY: `pip install nvidia-cublas-cu12 nvidia-cudnn-cu12 nvidia-cuda-runtime-cu12` + `LD_LIBRARY_PATH=$(find venv -type d -path "*/nvidia/*/lib" | paste -sd:)` — without this libcublas.so.12 is not found. Ear: medium int8_float16 on GTX 1660S, 30 min → 3 min.
- Scripts: /tmp/transcribe.py (JSON of segments), /tmp/subs.srt + subs.ass from the segments (python heredoc), /tmp/montage_work.
- PAIN/lesson: burning subtitles (ass/libass) into the frame on CPU = 0.67x (30 min → 40+ min!) — CRAP. GPU 2%, CPU 112% (libass one thread). DON'T do burning for long videos.
- auto-editor 31.5.0: a binary from GitHub releases (linux-x86_64) → ~/.local/bin. Silence-cut: for a conversation without pauses (>3s none) — DOESN'T work, don't apply without checking the clues.
- The trigger "check kaumi research 50 sources": camoufox research gave 53 sources ✅ (then kaumi fell — Unknown tool for 4 tools; cured by a new session/MCP reconnect).
- Conversational video without pauses: editing = even sound + soft subtitles + (opt.) H.264 60fps. There is nothing to cut in the silence.
- Verified on this machine (24 Aug 2026): montage_final.mp4 = 30 min, HEVC 144fps + AAC loudnorm + mov_text SRT (357 lines), 345 MB ✅

### FINAL ASSEMBLY: LIKE THE INDUSTRY (remux, not re-encode) (24 Aug 2026) — SOLVED ✅
Canon (28 sources, kaumi: ffmpeg-cookbook mkv-to-mp4 remux, mpegflow mp4-faststart, ffmpeg-cookbook faststart, loudnorm EBU R128 ffmpeg-micro/cookbook/dev.to, soft subs gist/baeldung/ffmpegkit/wikibooks):
- WE DO NOT RE-ENCODE THE VIDEO: the source is already HEVC 144fps/good = only a copy of the stream `-c:v copy` (remux). Re-encoding = quality loss + minutes, NVENC NOT needed. Video — byte for byte, seconds pass, not hours.
- THE AUDIO — only it gets compressed into AAC: `-c:a aac -b:a 192k -af "loudnorm=I=-16:TP=-1.5:LRA=11"` (-16 LUFS = the YouTube/Spotify standard, EBU R128; TP=-1.5, LRA=11).
- SUBTITLES ONLY SOFT (soft-track, switchable): MKV → `-c:s srt` (SRT/ASS live as is), MP4 → `-c:s mov_text` (only the format, ASS styles/fonts are lost). Burning into the frame (libass) on a long video = CRAP.
- CONTAINER: MKV — native for HEVC copy + any subtitles. MP4 + `-c:v copy` + `-tag:v hvc1` + `-movflags +faststart` = PITFALL: "Error writing trailer", a file without a tail (broken). faststart on MKV doesn't work at all, and for MP4 with a HEVC copy in one pass — risky. So: a copy into MKV, and if WEB/player needs MP4 — remux separately with `-c copy` from the already-done MKV.
- MAPS explicit: `-map 0:v -map 0:a -map 1:0` (video+audio from the source, subtitles from the SRT file), language: `-metadata:s:s:0 language=rus`.
- CHECK of the result: ffprobe (codecs, fps, durations matched) + a readiness marker _DONE.json + rc=0. A file that "was written" with rc≠0 is broken, you can't trust the size.
- DON'T REPEAT ERRORS: 1) re-encoding over already-good HEVC; 2) mp4 + faststart with a HEVC copy (broken tail — lesson: a 331 MB file with "Conversion failed"); 3) burning subtitles; 4) polling the log with sleep-cycles — background + marker.

## CPU/GPU: SEPARATION OF RESPONSIBILITY (Aug 2026) — SOLVED ✅

Canon (35 sources, kaumi: NVIDIA Video Codec SDK — NVENC/NVDEC separate hardware in the GPU (Kepler+), 10-50x realtime; renderio — 12 min → <2 min with nvenc; ffmpeg-cookbook — NVENC 5-10x faster, CPU ~0; noteandsave — CPU prepares while GPU computes (overlap); sergiiob — bandwidth cliff: the hot path entirely in VRAM):
- ON GPU (iron): encoding/decoding of video (NVENC/NVDEC), transcoding, inference, CUDA frame filters — separate hardware blocks, CPU is not needed there.
- ON CPU: control, data preparation, I/O, sequential actions.
- PITFALLS: 1) ffmpeg from apt may be WITHOUT NVENC — check `ffmpeg -encoders | grep nvenc`; 2) libass-burning subtitles into the frame = CPU 0.67x (CRAP, verified on ours) — only soft-sub; 3) half offload (GPU+RAM) = a bandwidth collapse — entirely in VRAM or less; 4) don't run frames through PCIe — keep in VRAM (CUDA).
- Check "who works": nvidia-smi (GPU %) + top/htop (CPU %) — a "GPU task" at CPU 100% and GPU 0% = on CPU, fix it.
- Verified (Aug 2026): NVENC 1080p 144fps HEVC ✅; libass 0.67x — CRAP ✅ (only soft-sub).

---

---

## PROJECTS LIVE IN RUNTIME, NOT IN SYSTEM (Aug 2026)

, NOT SYSTEM: the root of projects is from the RUNTIME: runtime environment variables (working folder) → backup ~/media-projects. NEVER nail hard paths (/home/..., /run/media/...) into code, instructions, skills — only through environment variables.
