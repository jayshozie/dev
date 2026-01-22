#!/usr/bin/env bash

#######################################
#           B U L L E T T Y           #
#######################################

# CONFIGURATION
# Bulletty stores feeds in XDG_DATA_HOME/bulletty/categories
DATADIR="${XDG_DATA_HOME:-$HOME/.local/share}/bulletty/categories"
STATE_FILE="/tmp/rss-state"

if [[ -d "$DATADIR" ]]; then
    curr_unread=$(grep -r "seen = false" "$DATADIR" 2>/dev/null | wc -l)
else
    curr_unread=0
fi

if [[ -f "$STATE_FILE" ]]; then
    prev_unread=$(cat "$STATE_FILE")
else
    prev_unread=0
fi

if [[ "$curr_unread" -gt "$prev_unread" ]]; then
    notify-send --urgency=normal --app-name='RSS Feeds' --icon='󰑫' \
        '󰑫 RSS Feeds' "You have $curr_unread unread articles."
fi

echo "$curr_unread" > "$STATE_FILE"

if [[ "$curr_unread" -gt 0 ]]; then
    css_class="unread"
    tooltip="You have $curr_unread unread articles."
else
    css_class="read"
    tooltip="All caught up."
fi

printf '{"text": "%s", "class": "%s", "tooltip": "%s"}\n' \
    "$curr_unread" "$css_class" "$tooltip"



#######################################
#           N E W S B O A T           #
#######################################

# # strip everything but the number (returns <number> unread articles by default)
# raw_output=$(newsboat -x print-unread 2>/dev/null | grep -o '[0-9]*' | head -n1)
# 
# # if newsboat fails or returns empty, default to 0
# curr_unread=${raw_output:-0}
# 
# state_file="/tmp/rss-state"
# 
# if [[ -f "$state_file" ]]; then
#     prev_unread=$(cat "$state_file")
# else
#     prev_unread=0
# fi
# 
# if [[ "$curr_unread" -gt "$prev_unread" ]]; then
#     notify-send --urgency=normal --app-name='RSS Feeds' --icon='󰑫' \
#         '󰑫 RSS Feeds' "You have $curr_unread unread articles."
# fi
# 
# echo "$curr_unread" > "$state_file"
# 
# if [[ "$curr_unread" -gt 0 ]]; then
#     css_class="unread"
#     tooltip="You have $curr_unread unread articles."
# else
#     css_class="read"
#     tooltip="All caught up."
# fi
# 
# printf '{"text": "%s", "class": "%s", "tooltip": "%s"}\n' \
#     "$curr_unread" "$css_class" "$tooltip"
