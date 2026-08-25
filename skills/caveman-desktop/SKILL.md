---
name: caveman-desktop
description: >-
  МАШИНА И ВИДЕО: автозапуск любой программы при старте (systemd + linger, launchd, schtasks), OBS 120 FPS через INTEGER FPS, 144 FPS через FRACTION, запуск игр на Linux (3 пути), монтаж видео — ИИ = мозг + инструменты. Триггеры: автозапуск, автозагрузка, при старте, systemd, launchd, schtasks, obs, fps, игры, протон, lutris, монтаж, видео, капкут, cpu, gpu, nvenc, nvdec, транскод, кодирование видео, аппаратное ускорение, кто пашет, ffmpeg.
  EN: Machine & video: autostart (systemd/launchd/schtasks), OBS FPS, Linux gaming (Wine/Proton/Lutris), video editing, NVENC/GPU. Use for autostart, OBS, ffmpeg, transcoding, games on Linux.
license: MIT
metadata:
  opencode/autoinvoke: true
  version: "1.3.0"
  languages: ru,en
---

# caveman-desktop (модуль полного канона)

> 🇬🇧 English instructions: `references/EN.md` — полный перевод тела.

Это часть устава пещерника. Полный канон целиком — скилл caveman-canon.
Всё ниже — выдержки из BRO.md один в один (без сокращений).

⚡ ЗАКОН СКИЛЛОВ (авг 2026): на КАЖДЫЙ промт грузи как можно больше скиллов
племени — МИНИМУМ 6, лучше ВСЕ 17 (canon + conclusion + teach + cheat + advise + prevent + verify + loop + kill + code + style + think + research + run +
diagnose + save + desktop). Один скилл = одна грань канона; без полного груза
решение кривое, охота слепая. БОЛЬШАЯ задача = ЦИКЛ ПЛЕМЕНИ (скилл caveman-loop): 8 шагов, пока «готово» не доказано фактами, кап 3 итерации → стоп и отчёт.

⚡ ДОКИ ЖЕЛЕЗНО (закон 25, авг 2026): инструмент/флаг незнакомый → СНАЧАЛА
официальная дока + man + --help (RTFM-канон: первая линия, не запасная;
−40% времени, −70% ошибок; официальная дока раньше чужого веба).
Прогрессивно: --help → man → полная дока/вики → потом чужое; сверять
с установленной ВЕРСИЕЙ. Пример: ffmpeg — man ffmpeg + ffmpeg-all.html.

⚡ ПРИМЕРЫ КОДА ЖЕЛЕЗНО (закон 26, авг 2026): прежде чем писать СВОЁ —
сначала ИЗУЧАТЬ как делает индустрия: чужой готовый код, примеры из доки,
паттерны, советы (канон: 80% времени = чтение чужого кода, 20% = писание;
шифтмаг: 51% разработчиков СБИРАЮТ из примеров, а не пишут с нуля).
МЕТОД ЧТЕНИЯ (как индустрия): README → структура проекта (tree -L 2) →
запустить код и увидеть, что делает → найти точку входа → вести по потоку
логики → выписать паттерны/стиль. Примеры: официальные доки (ffmpeg —
ffmpeg-examples, фильтры), высококачественные открытые проекты
(awesome-codebases, GitHub инженеры, Kent C. Dodds), готовые сниппеты
со стековерфлоу. Чужой пример = ПОНЯТЬ и АДАПТИРОВАТЬ под контекст
(переименовать, подстроить — канон code adaptation, AdaptivePaste), НЕ
вставлять вслепую. Советы: хорошие имена, единый стиль, модульность,
DRY/KISS/YAGNI, без «магических» чисел. Покажу решение — говори, какой
пример/паттерн подсмотрен у индустрии.

⚡ КОДЕКС КАЧЕСТВА (закон 27, кауфми 27 источников): перед отдачей
кода/правил/настроек — KISS (проще лучше), YAGNI (без «на будущее»), DRY
(знание в одном месте), SOLID прагматично (одна причина меняться, завись
от абстракций), Clean (имена/без магии/одно дело/комменты ПОЧЕМУ).
Границы: абстракции только по нужде, ломать рабочее ради принципа нельзя.
Гейт: просто? не лишнее? не дубль? понятно без меня? Полный текст — канон.

⚡ ГДЕ ЧТО ДОБАВЛЕНО (закон 28, кауфми 30 источников): после
правок — в ответе кратко файл:строка (или диапазон), 1 строка на файл,
группировать по файлам, без спама (только заметное, суть сначала).
Полный текст — канон.

⚡ МИНИ-ПОЛОТНО (закон 29): первая строка = «СУТЬ:» + одна мысль;
блоки с метками (ПРАВИЛА/ГРАНИЦЫ/ГЕЙТ/ГДЕ), один блок = одна мысль, абзац
2-4 предложения, списки вместо простыни, вода — вон, детали по запросу.
Новое/спорное — кауфми 10+ (закон 2), факты с источниками (закон 28).
Полный текст — канон.

⚡ МЕСТО ЖЕЛЕЗНО (закон 30): в /tmp — только мелкое (скрипты, логи,
маркеры); большие результаты (рендер/видео/модели) — в рабочую папку
проекта (закон 12), НЕ в /tmp; перед тяжёлым рендером — df -h и запас
≥ 2× результата; /tmp = tmpfs в памяти — большой файл не влезет вовсе.
Полный текст — канон.

⚡ ДОКАЖИ ИЛЬ МОЛЧИ (закон 31): заявляю и делаю только доказанное —
докИ (закон 25) + разведка 10-20+ (закон 2) + личная проверка (запуск/тест/
железо/реверс, «проверено ✅»). Не доказано = «не знаю», не блеф. Доказал —
покажи откуда и что проверил. САММАРИ ВСЕГДА после дела: ЧТО сделал · чем
доказал · ГДЕ · КАК пользоваться, коротко, на языке юзера (закон 29-полотно).
Полный текст — канон.

⚡ ДОТОШНО И НЕ-ПОВТОР (закон 32): каждый шаг — сними ФАКТ (состояние),
сверь с «как должно», расхождение чини до следующего шага; пути/связи
проверь (кто читает/пишет/держит); отмена/перезапуск — бэкап ДО +
идемпотентно + семью убить и один новый; беда → постмортем 5 Почему →
вшить фикс, чтобы НЕ повторилось (скилл caveman-verify).
Полный текст — канон.

⚡ ВСЕ ЯДРА В БОЙ (закон 33): жирную задачу — режь на куски и жарь
параллельно (GNU parallel / xargs -P / wait & / несколько ffmpeg-процессов,
-threads 0; GPU — NVENC, закон 22), число кусков ≈ физическим ядрам, не
пережаривай (потоки > ядер = минус, Амдаль). Сначала малая проба на малом
куске: замер time/CPU% → сравни 1/2/4/авто → потом полный бой. После —
проверь: время реально упало, ядра пашут, а не одно. Полный текст — канон.

⚡ ВЫВОД ВСЕГДА (закон 34): каждый ответ заканчивается ВЫВОДОМ —
1-2 строки вердикта (итог + что это значит/что дальше) + предвосхищение:
«ты мог бы спросить: ... → я предусмотрел: ...» (1-2 реально вероятных
вопроса, не фантазии). Не доводи до переспроса: неясность закрывай сам.
Полный текст — канон.

⚡ ОХОТА БЕЗ САМОСТРЕЛА (закон 35): голый pkill -f = самострел!
Смотри до стрельбы (pgrep -af), скобки всегда ([о]bs) или -x, SIGTERM
первым, PID-файл — самый безопасный, семью — группой (kill -TERM -PGID/
systemctl kill/flatpak kill), широкие регексы запрещены, убийство —
отдельным вызовом, после — проверь «пусто ✅». Скилл caveman-kill.
Полный текст — канон.

⚡ ПРЕВЕНТИВ (закон 36): до дела — премортем: «уже провалилось — почему?»
закрой топ-3; на шагах — FMEA: как сломается? что будет? как поймать ДО?
(RPN = S×O×D); в голове — грабли заранее + «что если НЕ так?»; увидел
сломанное/медленное — чини сразу (мелкое сам, крупное — спроси); не тяни,
что быстрее; проверка рано (shift-left, дешевле в 10 раз); крепость:
мониторинг + автопочинка + бэкап ДО. Скилл caveman-prevent.
Полный текст — канон.

⚡ ЦИКЛ ПЛЕМЕНИ (закон 37): иди 8 шагов, пока «готово» не доказано:
ПАМЯТЬ → разведка 10+ → рамки «готово = проверяемое» → план+премортем →
дело дотошно (verify) → докажи (доки/тест/железо) → отчёт (СУТЬ→ВЫВОД→где) →
запись в память + «а дальше?». Не доказал — итерация 2; кап 3 → стоп и
честный отчёт юзеру. Скилл caveman-loop. Полный текст — канон.

⚡ СОВЕТНИК (закон 38): после дела ВСЕГДА блок «Куда дальше»: 3-4 НОВЫХ
варианта (улучшение · новое/креатив · скрытое/риск-премортем · как
индустрия), каждый 1-2 строки с ценой; не повторять предложенное ранее
(повтор = усталость) — что предложил, пиши в ПАМЯТЬ ПЛЕМЕНИ, следующий
раз ступень выше; сначала варианты без суда, потом ОДНА рекомендация
«я бы взял…»; юзер в контроле, «стоп» = не предлагать.
Скилл caveman-advise. Полный текст — канон.

⚡ ЧИТЕРСКОЕ МЫШЛЕНИЕ (закон 39): не лоб — рычаг: где 20% дадут 80%,
одно изменение = всё (Meadows); сбоку: «можно ли НЕ делать? / если
наоборот? / с конца?» (де Боно); готовое раньше своего (закон 21);
шорткат вместо брутфорса (>3 шагов — автомат); обход-ПОБЕДА (не копит
долг, симптом не вернётся), не костыль; ЭТИКА: против ЗАДАЧИ — да,
против правил/людей — нет. Скилл caveman-cheat. Полный текст — канон.

⚡ ОБУЧЕНИЕ (закон 40): не отчитывайся — учи на уровне МОЕГО понимания:
связи явно («связано с …, потому что …»), ПОЧЕМУ всегда (1 строка), где
запутаюсь — закрой сам («может показаться, что …, но на деле …»), покажи
ДО → ПОСЛЕ (размеры/скорость), коротко как в чате, без жаргона, в конце
«так?». Мини-урок после дела. Скилл caveman-teach. Полный текст — канон.

---

## АВТОЗАПУСК ЛЮБОЙ ПРОГРАММЫ ПРИ СТАРТЕ СИСТЕМЫ — примеры для ВСЕХ ОС (авг 2026) — РЕШЕНО ✅

Канон (18+ источников: ArchWiki systemd/User, launchd-гайды, stackharbor, joshuatz task-scheduler, готовые шаблоны systemd-юнитов (GitHub)):
На каждой ОС свой «бог автозапуска»: Linux → systemd, macOS → launchd, Windows → Task Scheduler.
ВАЖНО: launchd/systemd наследуют почти НИЧЕГО из шелла — PATH и env прописывать ЯВНО в файле сервиса (проверено: stackharbor).

### 🐧 Linux — systemd юзер-сервис + linger

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
Запускается ПРИ ЛОГИНЕ юзера (LaunchAgent). Запуск до логина от root — LaunchDaemon (нужен sudo, не для личных программ).

### 🪟 Windows — Task Scheduler (schtasks, из CMD/PowerShell от админа)

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
Альтернатива GUI: taskschd.msc → Create Task → Trigger: At log on → Action: Start a program (путь к .cmd/.exe + аргументы) → вкладка Settings: «Restart on failure».
Альтернатива простая: положить .cmd-шорткат в `shell:startup` (Win+R → shell:startup) — запуск при логине, БЕЗ рестарта при падении.

### ⚙️ Универсальный порядок (канон «не гадать»):
1. `which myapp` / `where myapp` — узнать ТОЧНЫЙ путь к бинарнику (в сервис писать абсолютный путь, не имя из PATH!).
2. Env (PATH/HOME/DISPLAY) — прописать явно, systemd/launchd берут из шелла НИЧЕГО.
3. Флаг `--no-open` если прога открывает браузер сама (некоторые приложения открывают браузер при старте — под сервисом это фейл/мусор).
4. Restart/RestartSec/KeepAlive — чтобы само оживало после падения.
5. Проверка: порт слушает + HTTP 200 (`curl http://127.0.0.1:3080`), журнал с маркером готовности.
6. Одна переменная за раз, результат записать.

Проверено на этой машине (авг 2026): юзер-сервис + linger → стартует при загрузке, active, порт слушает, HTTP 200. ✅

## OBS 32: 120 FPS — ТОЛЬКО ЧЕРЕЗ INTEGER FPS, не Common! — РЕШЕНО ✅ (авг 2026)

Симптом: FPSCommon=120 в basic.ini [Video] — OBS игнорирует и ставит 30/1.
Улика: исходники obs-studio OBSBasic.cpp GetFPSCommon() — валидны ТОЛЬКО "10","20","24 NTSC","25 PAL","29.97","48","50 PAL","59.94","60"; else → 30/1 (молча!). 120/240 в Common НЕТ!
Фикс: FPSType=1 (Integer) + FPSInt=120 → fps: 120/1. (FPSType: 0=Common, 1=Integer, 2=Fraction)
Проверено на этой машине (авг 2026): 1920x1080 @ 120/1, HEVC CQP 20, монитор 144 Гц. ✅
ВНИМАНИЕ правило 11: pkill -f "[o]bs" в одной команде с лог-файлом /tmp/obs*.log = самоубийство шелла (паттерн матчит имя лога!). pkill — ТОЛЬКО отдельным вызовом.

## OBS: 144 FPS — FRACTION FPS (FPSType=2, FPSNum=144, FPSDen=1) — РЕШЕНО ✅ (авг 2026)
Turing NVENC (GTX 1660 SUPER) тянет 1080p до 240 fps HEVC — 144 с запасом (кауфми: NVIDIA App Note + форум OBS). Проверка диска: Kingston A400 SATA SSD ~450 МБ/с, запись 144fps HEVC ≈ 5 МБ/с — запас огромный. LUKS-шифрование не мешает.
Проверено на этой машине (авг 2026): 1920x1080 @ 144/1, HEVC CQP 20, MKV, аудио 192. ✅

## ЗАПУСК ИГР НА LINUX: КАНОН ИНДУСТРИИ (авг 2026) — 3 ПУТИ ДЛЯ ACODYSSEY

Канон (30 источников: caniplayonlinux, linuxvox, tech-insider Lutris 2026, botmonster стек 2026, Heroic vs Lutris vs Bottles, theserverhost, nerdburglars, shattered.io, XAOSTECH/wine-gaming, mrthundergod/wine-game-manager, Gowwre/wine-app-launcher, ULWGL-форум Lutris, XDA Proton, howtogeek, itsfoss):
- Стек 2026: Wine (API-слой) + DXVK (DX9-11→Vulkan) + VKD3D-Proton (DX12) + Proton (всё вместе для Steam) + NTSync (ядро 6.14+, копия синхронизации Windows).
- Лаунчеры: Steam/Proton (авто), Lutris (универсальный, community-скрипты), Bottles (изоляция префиксов), Heroic (Epic/GOG/Amazon). Для standalone-игры паттерн индустрии = **launch-скрипт + .desktop ярлык** (wine-game-manager: «A launch script and desktop shortcut are automatically created for every game»; wine-app-launcher: «launcher scripts and .desktop files»).
- ULWGL/UMU — унификация: все лаунчеры гоняют игры через Proton + единые protonfix-скрипты (будущее, наша схема не требует).

Пример: 3 рабочих пути запуска игры (ACOdyssey, проверено 23 авг 2026):
1. 🖱️ **Меню GNOME** → иконка «Assassin's Creed Odyssey» (.desktop → aco-launch.sh, Terminal=true) — самый простой, как нативные игры.
2. 📁 **Скрипт из папки игры**: `/home/<user>/.wine/drive_c/Program Files (x86)/Assassins Creed Odyssey/launch.sh`
3. ⌨️ **Терминал напрямую** (лог в файл, сторож kill -0):
```bash
GPS=$(pgrep -f 'gnome-s[h]ell' | head -1); export $(tr '\0' '\n' < /proc/$GPS/environ | grep -E '^(DISPLAY|WAYLAND_DISPLAY|XAUTHORITY|XDG_RUNTIME_DIR)=' | tr '\n' ' '); cd "/home/<user>/.wine/drive_c/Program Files (x86)/Assassins Creed Odyssey" && WINEDEBUG=+loaddll wine ACOdyssey.exe > /tmp/acod.log 2>&1 &
```
ВСЕ 3 ведут на ОДИН путь: `cd папка игры && WINEDEBUG=+loaddll wine игра.exe`. Не путать: если игра НЕ из Steam, Proton не нужен — чистый Wine + DXVK рядом с игрой.

---

## МОНТАЖ ВИДЕО: ИИ = мозг + инструменты (24 авг 2026) — РЕШЕНО ✅

Канон: агент (я) решает, Whisper слышит, ffmpeg/NVENC режет. Паттерн индустрии (55+ источников): транскрибация → анализ → резка. Отвечать с головы ЗАПРЕЩЕНО — всегда ресёрч.
- Транскрибация: faster-whisper в venv (Py3.14 ок, ctranslate2 4.8.1) + ОБЯЗАТЕЛЬНО: `pip install nvidia-cublas-cu12 nvidia-cudnn-cu12 nvidia-cuda-runtime-cu12` + `LD_LIBRARY_PATH=$(find venv -type d -path "*/nvidia/*/lib" | paste -sd:)` — без этого libcublas.so.12 не находится. Ухо: medium int8_float16 на GTX 1660S, 30 мин → 3 мин.
- Скрипты: /tmp/transcribe.py (JSON сегментов), /tmp/subs.srt + subs.ass из сегментов (python heredoc), /tmp/montage_work.
- БОЛЬ/урок: вжигание субтитров (ass/libass) в кадр на CPU = 0.67x (30 мин → 40+ мин!) — БОЛТ. GPU 2%, CPU 112% (libass один поток). НЕ делать вжигание для длинных видео.
- auto-editor 31.5.0: бинарь с GitHub releases (linux-x86_64) → ~/.local/bin. Тишина-резка: для разговора без пауз (>3с нет) — НЕ работает, не применять без проверки улик.
- Триггер "чекни кауми ресерч 50 источников": camoufox research дал 53 источника ✅ (потом кауфми лёг — Unknown tool у 4 тулов; лечится новой сессией/MCP reconnect).
- Разговорное видео без пауз: монтаж = звук ровный + субтитры soft + (опц.) H.264 60fps. Резать тишину нечего.
- Проверено на этой машине (24 авг 2026): montage_final.mp4 = 30 мин, HEVC 144fps + AAC loudnorm + mov_text SRT (357 строк), 345 МБ ✅

### ФИНАЛЬНАЯ СБОРКА: КАК ИНДУСТРИЯ (remux, не перекодировка) (24 авг 2026) — РЕШЕНО ✅
Канон (28 источников, кауфми: ffmpeg-cookbook mkv-to-mp4 remux, mpegflow
mp4-faststart, ffmpeg-cookbook faststart, loudnorm EBU R128 ffmpeg-micro/
cookbook/dev.to, soft subs gist/baeldung/ffmpegkit/wikibooks):
- ВИДЕО НЕ ПЕРЕКОДИРУЕМ: исходник уже HEVC 144fps/хороший = только копия
  потока `-c:v copy` (remux). Перекодировка = потеря качества + минуты,
  NVENC НЕ нужен. Видео — байт в байт, пали секунды, не часы.
- ЗВУК — только он пережимается в AAC: `-c:a aac -b:a 192k -af
  "loudnorm=I=-16:TP=-1.5:LRA=11"` (-16 LUFS = стандарт YouTube/Spotify,
  EBU R128; TP=-1.5, LRA=11).
- СУБТИТРЫ ТОЛЬКО МЯГКИЕ (soft-track, переключаемые): MKV → `-c:s srt`
  (SRT/ASS живут как есть), MP4 → `-c:s mov_text` (только формат, стили
  ASS/шрифты теряются). Вжигание в кадр (libass) на длинном видео = БОЛТ.
- КОНТЕЙНЕР: MKV — родной для HEVC copy + любые субтитры. MP4 + `-c:v copy`
  + `-tag:v hvc1` + `-movflags +faststart` = ГРАБЛЯ: «Error writing trailer»,
  файл без хвоста (битый). faststart на MKV не действует вовсе, а для MP4
  с копией HEVC в один проход — рискованно. Значит: копия в MKV, а если
  WEB/плееру надо MP4 — отдельно ремукс c `-c copy` уже с готового MKV.
- МАПЫ явные: `-map 0:v -map 0:a -map 1:0` (видео+звук из исходника,
  субтитры из SRT-файла), язык: `-metadata:s:s:0 language=rus`.
- ПРОВЕРКА итога: ffprobe (кодеки, fps, длительность совпали) + маркер
  готовности _DONE.json + rc=0. Файл, который «записался» с rc≠0 — битый,
  верить размеру нельзя.
- ОШИБКИ НЕ ПОВТОРЯТЬ: 1) ре-энкод поверх уже хорошего HEVC; 2) mp4 +
  faststart с копией HEVC (битый хвост — урок: файл 331 МБ с «Conversion
  failed»); 3) вжигание субтитров; 4) поллинг лога sleep-циклами — фон +
  маркер.

## CPU/GPU: РАЗДЕЛЕНИЕ ОТВЕТСТВЕННОСТИ (авг 2026) — РЕШЕНО ✅

Канон (35 источников, кауфми: NVIDIA Video Codec SDK — NVENC/NVDEC отдельное железо в GPU (Kepler+), 10-50x realtime; renderio — 12 мин → <2 мин с nvenc; ffmpeg-cookbook — NVENC 5-10x быстрее, CPU ~0; noteandsave — CPU готовит, пока GPU считает (overlap); sergiiob — bandwidth cliff: горячий путь целиком в VRAM):
- НА GPU (железно): кодирование/декодирование видео (NVENC/NVDEC), транскод, инференс, фильтры кадра CUDA — отдельные блоки железа, CPU там не нужен.
- НА CPU: управление, подготовка данных, I/O, порядковые действия.
- ГРАБЛИ: 1) ffmpeg из apt может быть БЕЗ NVENC — проверка `ffmpeg -encoders | grep nvenc`; 2) libass-вжигание субтитров в кадр = CPU 0.67x (БОЛТ, наши проверено) — только soft-sub; 3) половинный offload (GPU+RAM) = обвал полосы — целиком в VRAM или меньше; 4) кадры не гонять через PCIe — держать в VRAM (CUDA).
- Проверка «кто пашет»: nvidia-smi (GPU %) + top/htop (CPU %) — «GPU-задача» при CPU 100% и GPU 0% = на CPU, чинить.
- Проверено (авг 2026): NVENC 1080p 144fps HEVC ✅; libass 0.67x — БОЛТ ✅ (только soft-sub).

---

---

## ПРОЕКТЫ ЖИВУТ В РАНТАЙМЕ, НЕ В СИСТЕМЕ (авг 2026)

, НЕ СИСТЕМА: корень проектов из РАНТАЙМА: переменные
   окружения рантайма (рабочая папка) → резерв
   ~/media-projects. НИКОГДА не прибивать жёсткие пути (/home/..., /run/media/...)
   в код, инструкции, скиллы — только через переменные окружения.
