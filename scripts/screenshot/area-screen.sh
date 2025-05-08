#!/bin/env bash

mkdir -p ~/Pictures/Screenshots
grim -g "$(slurp -d)" ~/Pictures/Screenshots/screenshot-$(date +'%Y-%m-%d-%H%M%S').png
