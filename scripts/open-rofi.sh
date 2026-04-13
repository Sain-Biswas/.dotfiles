#!/usr/bin/env bash

# =============================================================================
# Script: open-rofi.sh
# =============================================================================
#
# Description:
#   A modular wrapper utility to launch Rofi interfaces under Wayland
#   using `uwsm-app`.
#
# Features:
#   - Application launcher (drun)
#   - Emoji picker
#   - Window switcher
#   - Debug mode support
#   - Dependency validation
#
# Usage:
#   ./open-rofi.sh <command> [--debug]
#
# Commands:
#   app        Launch application launcher
#   emoji      Open emoji selector
#   window     Show window switcher
#   help       Display help message
#
# Options:
#   --debug    Enable verbose debugging output
#
# Exit Codes:
#   0   Success
#   1   General error
#   2   Missing dependency
#
# =============================================================================


# -----------------------------------------------------------------------------
# Strict Mode
# -----------------------------------------------------------------------------
set -euo pipefail


# -----------------------------------------------------------------------------
# Global Variables
# -----------------------------------------------------------------------------
DEBUG=false
ROFI_LAUNCHER_THEME="$HOME/.dotfiles/.config/rofi/launcher.rasi"
ROFI_EMOJI_THEME="$HOME/.dotfiles/.config/rofi/emoji-selector.rasi"


# -----------------------------------------------------------------------------
# Logging Utilities
# -----------------------------------------------------------------------------
log() {
    echo "[INFO] $*"
}

debug() {
    if [[ "$DEBUG" == true ]]; then
        echo "[DEBUG] $*"
    fi
}

error() {
    echo "[ERROR] $*" >&2
}


# -----------------------------------------------------------------------------
# Dependency Check
# -----------------------------------------------------------------------------
check_dependencies() {
    local deps=("rofi" "uwsm-app")

    for cmd in "${deps[@]}"; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            error "Required dependency '$cmd' is not installed."
            exit 2
        fi
    done

    debug "All dependencies are satisfied."
}


# -----------------------------------------------------------------------------
# Help Message
# -----------------------------------------------------------------------------
show_help() {
    cat <<EOF
Usage: $0 <command> [--debug]

Commands:
  app        Launch application launcher (drun)
  emoji      Open emoji selector
  window     Show window switcher
  help       Display this help message

Options:
  --debug    Enable debug output
EOF
}


# -----------------------------------------------------------------------------
# Rofi Launchers
# -----------------------------------------------------------------------------
launch_app() {
    debug "Launching application launcher"
    uwsm-app -- rofi \
        -show drun \
        -display-drun "Applications" \
        -run-command "uwsm-app -- {cmd}" \
        -theme "$ROFI_LAUNCHER_THEME" \
        -theme-str "entry { placeholder: 'Search applications…'; }"
}

launch_emoji() {
    debug "Launching emoji picker"
    uwsm-app -- rofi \
        -emoji-format "{emoji}" \
        -show emoji \
        -modi emoji \
        -display-emoji "Emoji" \
        -theme "$ROFI_EMOJI_THEME" \
        -theme-str "entry { placeholder: 'Search emojis by keyword…'; }"
}

launch_window() {
    debug "Launching window switcher"
    uwsm-app -- rofi \
        -show window \
        -display-window "Windows" \
        -theme "$ROFI_LAUNCHER_THEME" \
        -theme-str "entry { placeholder: 'Search open windows…'; }"
}


# -----------------------------------------------------------------------------
# Argument Parsing
# -----------------------------------------------------------------------------
parse_args() {
    if [[ $# -lt 1 ]]; then
        error "No command provided."
        show_help
        exit 1
    fi

    COMMAND="$1"
    shift

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --debug)
                DEBUG=true
                ;;
            *)
                error "Unknown option: $1"
                exit 1
                ;;
        esac
        shift
    done
}


# -----------------------------------------------------------------------------
# Main Dispatcher
# -----------------------------------------------------------------------------
main() {
    parse_args "$@"
    check_dependencies

    debug "Command: $COMMAND"

    case "$COMMAND" in
        app)
            launch_app
            ;;
        emoji)
            launch_emoji
            ;;
        window)
            launch_window
            ;;
        help)
            show_help
            ;;
        *)
            error "Unknown command: $COMMAND"
            show_help
            exit 1
            ;;
    esac
}


# -----------------------------------------------------------------------------
# Entry Point
# -----------------------------------------------------------------------------
main "$@"
