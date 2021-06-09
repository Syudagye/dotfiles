#!/bin/sh

MAX=100
vol=$(pulseaudio-ctl full-status)
newvol=$((${vol:0:3} + $1))

[ $newvol -le $MAX ] && pulseaudio-ctl set $newvol
