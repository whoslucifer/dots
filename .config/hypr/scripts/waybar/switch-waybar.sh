#!/bin/bash
# Script for waybar styles

set -euo pipefail
IFS=$'\n\t'

# Define directories
waybar_styles="$HOME/.config/waybar/styles"
waybar_style="$HOME/.config/waybar/style.css"
SCRIPTSDIR="$HOME/.config/hypr/scripts/waybar"

# Function to apply selected style
apply_style() {
    ln -sf "$waybar_styles/$1.css" "$waybar_style"
    "${SCRIPTSDIR}/refresh.sh" &
}

# Main function
main() {
    cd "$waybar_styles" || exit 1

    # Set the DOT_SHOW option to show hidden files
    export DOT_SHOW=true

    choice=$(yad --width 1200 --height 800 --file --add-preview --large-preview --title='Choose waybar style' --file-filter="*.css" --file-filter-mask="*.css")

    # Reset the DOT_SHOW option
    unset DOT_SHOW

    if [[ -z "$choice" ]]; then
        echo "No option selected. Exiting."
        exit 0
    fi

    apply_style "$(basename "$choice" .css)"
}

main
