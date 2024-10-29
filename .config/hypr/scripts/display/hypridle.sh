#!/bin/bash
# This is for custom version of waybar idle_inhibitor which activates / deactivates hypridle instead

PROCESS="hypridle"

if pgrep -x "$PROCESS" >/dev/null; then
    pkill "$PROCESS"
else
    "$PROCESS"
fi
