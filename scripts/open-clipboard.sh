#!/usr/bin/env bash

# open-clipboard.sh
# ------------------
# Clipboard picker with icons + previews using cliphist + rofi.
# Designed for Wayland (Hyprland) + swaync.
#

set -euo pipefail

# ----------------------------
# Configuration
# ----------------------------
ROFI_PROMPT="Clipboard"
ROFI_LINES=15
ROFI_WIDTH="50%"
MAX_PREVIEW_LEN=80

NOTIFY_APP_NAME="clipboard_rofi_script"
ICON_ERROR="dialog-error"

# Icon mapping (freedesktop names)
ICON_TEXT="text-x-generic"
ICON_URL="network-workgroup"
ICON_IMAGE="image-x-generic"
ICON_COMMAND="utilities-terminal"
ICON_DEFAULT="edit-paste"

# ----------------------------
# Notification Helper
# ----------------------------
notify() {
    local urgency="$1"
    local title="$2"
    local message="$3"
    local icon="${4:-dialog-information}"

    if command -v notify-send >/dev/null 2>&1; then
        notify-send -u "$urgency" -a "$NOTIFY_APP_NAME" -i "$icon" "$title" "$message"
    else
        echo "[$title] $message" >&2
    fi
}

# ----------------------------
# Dependency Checks
# ----------------------------
require_command() {
    local cmd="$1"
    command -v "$cmd" >/dev/null 2>&1 || {
        notify "critical" "Missing Dependency" "Command '$cmd' not found." "$ICON_ERROR"
        exit 1
    }
}

require_command "cliphist"
require_command "rofi"
require_command "wl-copy"

# ----------------------------
# Helpers
# ----------------------------

truncate() {
    local str="$1"
    local max_len="$2"

    if (( ${#str} > max_len )); then
        echo "${str:0:max_len}…"
    else
        echo "$str"
    fi
}

detect_icon() {
    local entry="$1"

    if [[ "$entry" =~ ^https?:// ]]; then
        echo "$ICON_URL"
    elif [[ "$entry" =~ ^data:image ]]; then
        echo "$ICON_IMAGE"
    elif [[ "$entry" =~ ^(sudo|apt|dnf|pacman|git|cd|ls|rm|cp|mv) ]]; then
        echo "$ICON_COMMAND"
    elif [[ "$entry" =~ [[:print:]] ]]; then
        echo "$ICON_TEXT"
    else
        echo "$ICON_DEFAULT"
    fi
}

format_entries() {
    cliphist list | while IFS= read -r line; do
        # Decode a short preview safely
        preview=$(cliphist decode "$line" 2>/dev/null | head -n1 || true)
        preview=$(truncate "$preview" "$MAX_PREVIEW_LEN")

        icon=$(detect_icon "$preview")

        # rofi format: "text\0icon\x1ficon-name"
        printf "%s\0icon\x1f%s\n" "$preview" "$icon"
    done
}

# ----------------------------
# Main Logic
# ----------------------------
main() {
    local selected index

    # Build menu with icons
    selected=$(format_entries | rofi \
        -dmenu \
        -p "$ROFI_PROMPT" \
        -l "$ROFI_LINES" \
        -show-icons \
        -width "$ROFI_WIDTH")

    [[ -z "${selected}" ]] && exit 0

    # Match back to original entry
    index=$(cliphist list | nl -w1 -s' ' | while read -r i line; do
        preview=$(cliphist decode "$line" 2>/dev/null | head -n1 || true)
        preview=$(truncate "$preview" "$MAX_PREVIEW_LEN")

        if [[ "$preview" == "$selected" ]]; then
            echo "$i"
            break
        fi
    done)

    [[ -z "$index" ]] && {
        notify "critical" "Clipboard Error" "Failed to resolve selection." "$ICON_ERROR"
        exit 2
    }

    # Extract actual entry by index
    entry=$(cliphist list | sed -n "${index}p")

    if ! cliphist decode "$entry" | wl-copy; then
        notify "critical" "Clipboard Error" "Failed to copy selection." "$ICON_ERROR"
        exit 2
    fi
}

# ----------------------------
# Entry Point
# ----------------------------
main "$@"
