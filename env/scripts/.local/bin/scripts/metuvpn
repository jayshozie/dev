#!/usr/bin/env bash

SES=`via-cli session info | grep -c "active"`
CON=`ifconfig -a | grep -c "via_vpn: flags=4305"`

if [[ SES -eq 0 ]]; then
	via-cli session start
fi

if [[ CON -eq 0 ]]; then
    via-cli vpn connect --username e267561@metu.edu.tr --userpass ***REMOVED***
elif [[ CON -eq 1 ]]; then
    via-cli vpn disconnect
fi
