#!/usr/bin/env bash

pkill -x waybar
setsid uwsm app -- waybar >/dev/null 2>&1 &

sleep 0.2
swaync-client -R -rs
