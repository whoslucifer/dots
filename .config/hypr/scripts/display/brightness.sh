#!/bin/bash
# Script for Monitor backlights (if supported) using brightnessctl

notification_timeout=1000
step=3  # INCREASE/DECREASE BY THIS VALUE

# Get brightness
get_backlight() {
	brightnessctl -m | cut -d, -f4 | sed 's/%//'
}

# Notify
notify_user() {
	notify-send -e -h string:x-canonical-private-synchronous:brightness_notif -h int:value:$current -u low -i "$icon" " "
}

# Change brightness
change_backlight() {
	local current_brightness
	current_brightness=$(get_backlight)

	# Calculate new brightness
	if [[ "$1" == "+${step}%" ]]; then
		new_brightness=$((current_brightness + step))
	elif [[ "$1" == "${step}%-" ]]; then
		new_brightness=$((current_brightness - step))
	fi

	# Ensure new brightness is within valid range
	if (( new_brightness < 1 )); then
		new_brightness=1
	elif (( new_brightness > 100 )); then
		new_brightness=100
	fi

	brightnessctl set "${new_brightness}%"
	get_icon
	current=$new_brightness
	notify_user
}

# Execute accordingly
case "$1" in
	"--get")
		get_backlight
		;;
	"--inc")
		change_backlight "+${step}%"
		;;
	"--dec")
		change_backlight "${step}%-"
		;;
	*)
		get_backlight
		;;
esac
