#!/usr/bin/env bash

# strip everything but the number (returns <number> unread articles by default)
raw_output=$(newsboat -x print-unread 2>/dev/null | grep -o '[0-9]*' | head -n1)

# if newsboat fails or returns empty, default to 0
curr_unread=${raw_output:-0}

state_file="/tmp/waybar-rss-state"

if [[ -f "$state_file" ]]; then
    prev_unread=$(cat "$state_file")
else
    prev_unread=0
fi

if [[ "$curr_unread" -gt "$prev_unread" ]]; then
    notify-send --urgency=low --app-name='󰑫 RSS Feeds' \
        "󰑫 RSS Feeds" "You have $curr_unread unread articles."
fi

echo "$curr_unread" > "$state_file"

if [[ "$curr_unread" -gt 0 ]]; then
    css_class="unread"
    tooltip="You have $curr_unread unread articles."
else
    css_class="read"
    tooltip="All caught up."
fi

printf '{"text": "%s", "class": "%s", "tooltip": "%s"}\n' \
    "$curr_unread" "$css_class" "$tooltip"
