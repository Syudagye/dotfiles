#!/bin/sh

while [[ true ]];
do
	vol=$(pulseaudio-ctl full-status)
	if [[ ${vol:0:3} -gt 100 ]];
	then
		pulseaudio-ctl set 100
	fi
done
