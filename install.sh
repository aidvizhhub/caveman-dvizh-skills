#!/usr/bin/env bash
# Caveman Skill Set — установка 17 скиллов в любой skills-совместимый харнес.
# Использование: ./install.sh [all|claude|opencode|codex|gemini|agents] [--path DIR] [--remote] [--dry-run]
# Команды: install (по умолчанию), status, uninstall, help
set -euo pipefail

REPO="https://github.com/aidvizhhub/caveman-dvizh-skills.git"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/caveman-dvizh-skills"

declare -A TARGETS=(
  [claude]="${HOME}/.claude/skills"
  [opencode]="${XDG_CONFIG_HOME:-$HOME/.config}/opencode/skills"
  [codex]="${HOME}/.codex/skills"
  [gemini]="${HOME}/.gemini/skills"
  [agents]="${HOME}/.agents/skills"
)

HARNESS="${1:-all}"
[ "${1:-}" == "status" ] || [ "${1:-}" == "uninstall" ] || [ "${1:-}" == "help" ] \
  || [ "${1:-}" == "-h" ] || [ "${1:-}" == "--help" ] || shift || true
MODE=install
PATH_OVERRIDE=""
REMOTE=0
DRY_RUN=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    status) MODE=status ;;
    uninstall) MODE=uninstall ;;
    help|-h|--help) MODE=help ;;
    --remote) REMOTE=1 ;;
    --dry-run) DRY_RUN=1 ;;
    --path) shift; PATH_OVERRIDE="${1:-}" ;;
    --path=*) PATH_OVERRIDE="${1#--path=}" ;;
    *) HARNESS="$1" ;;
  esac
  shift
done

colors() {
  G=$'\033[1;32m'; R=$'\033[1;31m'; Y=$'\033[1;33m'; B=$'\033[1;34m'; X=$'\033[0m'
}
colors

resolve_src() {
  if [ "$REMOTE" = 1 ]; then
    git clone --depth 1 "$REPO" "$CACHE_DIR" 2>/dev/null || true
    echo "$CACHE_DIR"
  else
    echo "$SCRIPT_DIR"
  fi
}

installed_count() {
  local dir="$1" n=0
  for d in "$dir"/caveman-*; do [ -d "$d" ] && n=$((n+1)); done
  echo "$n"
}

list_harnesses() {
  [[ "$HARNESS" == "all" ]] && echo "claude opencode codex gemini agents" || echo "$HARNESS"
}

cmd_install() {
  local src; src="$(resolve_src)"
  [[ -d "$src/skills" ]] || { echo "${R}❌ Не найдено skills/ в $src${X}"; exit 1; }
  for h in $(list_harnesses); do
    local target="${PATH_OVERRIDE:-${TARGETS[$h]:-}}"
    [ -z "$target" ] && { echo "${R}❌ Неизвестный харнес: $h${X}"; exit 1; }
    echo "${B}→ $h → $target${X}"
    [ "$DRY_RUN" = 1 ] && continue
    mkdir -p "$target"
    for d in "$src"/skills/*/; do
      cp -r "$d" "$target/"
    done
    echo "${G}✅ $h: установлено $(installed_count "$target") скиллов${X}"
  done
  echo "${B}Проверка: ./install.sh status${X}"
}

cmd_status() {
  for h in $(list_harnesses); do
    local target="${PATH_OVERRIDE:-${TARGETS[$h]:-}}"
    [ -z "$target" ] && continue
    local n; n="$(installed_count "$target")"
    if [ "$n" -gt 0 ]; then echo "${G}✅ $h: $n скиллов → $target${X}"; else echo "${Y}○  $h: нет → $target${X}"; fi
  done
}

cmd_uninstall() {
  for h in $(list_harnesses); do
    local target="${PATH_OVERRIDE:-${TARGETS[$h]:-}}"
    [ -z "$target" ] && continue
    if [ "$DRY_RUN" = 1 ]; then echo "${B}· убрал бы $target${X}"; continue; fi
    for d in "$target"/caveman-*; do
      [[ -d "$d" ]] && rm -rf "$d"
    done
    echo "${G}✅ $h: скиллы убраны из $target${X}"
  done
}

case "$MODE" in
  install) cmd_install ;;
  status) cmd_status ;;
  uninstall) cmd_uninstall ;;
  help|*)
    echo "Caveman Skill Set — установщик скиллов"
    echo "  ./install.sh [all|claude|opencode|codex|gemini|agents]   установить"
    echo "  ./install.sh all --remote                                скачать репо и установить"
    echo "  ./install.sh status                                      что уже встало"
    echo "  ./install.sh uninstall all                               убрать все"
    echo "  ./install.sh opencode --path /tmp/test                   установить в свою папку"
    ;;
esac
