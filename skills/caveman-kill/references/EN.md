# caveman-kill (English)

This is part of the caveman's ruleset. The full canon in its entirety — the skill caveman-canon.
Everything below — verbatim excerpts from BRO.md (no cuts).

⚡ SKILL LAW (Aug 2026): on EVERY prompt load as many tribe skills as possible — MINIMUM 6, better ALL 17 (canon + conclusion + teach + cheat + advise + prevent + verify + loop + code +
style + think + research + run + diagnose + save + desktop + kill). One
skill = one facet of the canon; without a full load the solution is crooked, the hunt is blind. A BIG task = TRIBE LOOP (skill caveman-loop): 8 steps, until "done" is proven by facts, cap of 3 iterations → stop and report.

⚡ DOCS ARE IRON (law 25, Aug 2026): unfamiliar tool/flag → FIRST official docs + man + --help (RTFM canon: first line, not a backup;
−40% time, −70% errors; official docs before someone else's web).
Progressive: --help → man → full docs/wiki → then others; verify
with the installed VERSION. Example: ffmpeg — man ffmpeg + ffmpeg-all.html.

---

## ESSENCE: a hunter looking for a beast can find HIMSELF (law 35, Aug 2026) — SOLVED ✅

Canon (39 sources, kaumi (camoufox-research MCP) Aug 24, 2026: timmo001 safe-process-signals —
ready industry skill: "Never use bare pkill -f "pattern"", bracket
trick [c]ursor.mjs, pgrep -f -a BEFORE pkill, pkill -x, SIGTERM first,
"What NOT to do": bare -f, kill -9 first, wide regexes node/python/
java, ps aux | grep | awk | kill without excluding grep; SO 15740481 +
funwithlinux — pkill matches its own script: pidfile solutions, pidof -o
%PPID, pgrep + grep -v $$, pkill -v -f "$0"; unix.SE 290710 — procps-ng
pkill -f CAN match its own command line (self-shooting is real, BSD doesn't);
linuxize pkill cheatsheet — "Preview targets before signaling", -x/-u/-P;
linuxvox bracket trick; U&L 124127 — kill -TERM -PGID to hit the group, "otherwise
you'll kill the parent"; this machine's rake Aug 24, 2026: pgrep -f «имя» in one
command caught its own shell):

Meaning: pkill/pgrep -f matches the command line — INCLUDING ITS OWN. One
wrong shot — your shell is dead, work is cut off. Industry decided:
look before shooting, defend with brackets, exact name, soft signal first.

## RULES (live)

1. **LOOK BEFORE SHOOTING**: `pgrep -af "паттерн"` — see who you'll kill
   BEFORE pkill. The list is reasonable → shoot; no → stop.
2. **BRACKETS ALWAYS with -f**: `pkill -f "[о]bs"` — the regex matches the target, but
   NOT the command (its cmdline literally has "[о]bs"). Bare `pkill -f "obs"` =
   self-shooting.
3. **EXACT NAME better than -f**: `pkill -x имя` — no self-shooting risk.
4. **SIGTERM FIRST, NOT -9**: pause 1-2s → if alive, escalation
   `timeout 5 pkill -9 -f "[х]с" || true`. -9 first = data to the trash.
5. **PID-FILE — THE SAFEST**: `kill "$(cat /tmp/x.pid)"` — exact
   PID, no hunting. Service in systemd — `systemctl restart x`, not pkill.
6. **FAMILY** (children don't die with the father): `kill -TERM -PGID` /
   `systemctl --user kill app-*.scope` / `flatpak kill app-id`.
7. **WIDE REGEXES FORBIDDEN**: "node|python|java|server" without refinement
   = collateral. Only a unique part of the name.
8. **KILLING — IN A SEPARATE CALL**, don't merge with work in one
   command (bash -c matches itself).
9. **CHECK AFTER**: `pgrep -f "[х]с"` empty = dead ✅; not empty →
   SIGKILL → again. Then one new instance (canon single instance).

## WHAT NOT TO DO (forbidden)

- `pkill -f "паттерн"` bare without brackets in any command.
- `kill -9` first. `killall` without -e/-x. Wide regexes.
- `ps aux | grep имя | awk ... | kill` without excluding grep.
- `pkill` in one line `;` with launch/download — split into two calls.

## GATE BEFORE SHOOTING

- Did I look BEFORE (pgrep -af) — who will I kill? · Brackets [x] or -x? · SIGTERM
  first? · Will I check "empty ✅" after? · Is this a separate call from work?

Missing at least one — don't shoot, check first.

⚡ PREVENTIVE (law 36): before the job — premortem: "already failed — why?"
close top-3; on steps — FMEA: how will it break? what will happen? how to catch BEFORE?
(RPN = S×O×D); in the head — rakes in advance + "what if NOT so?"; saw
broken/slow — fix immediately (small — myself, big — ask); don't drag,
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
