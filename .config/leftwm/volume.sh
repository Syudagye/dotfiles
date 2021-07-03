#!/bin/bash

MAX=100
vol=$(pulseaudio-ctl full-status)
newvol=$((${vol:0:3} + $1))

[ $newvol -le $MAX ] && pulseaudio-ctl set $newvol

vol=$(pulseaudio-ctl full-status)
vol=${vol:0:3}

# Dunst notification
dunstify -a "changeVolume" -u low -i audio-volume-high -h int:value:"$vol" "Volume: $vol%" -r "69420"
