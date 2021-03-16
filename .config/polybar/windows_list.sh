#!/bin/bash

# contains icons associated with the class name if a window (format: "CLASS ICON")
icons=(
	"xfce4-terminal "
	"termite "
	"code ﬏"
	"code-oss ﬏"
	"discord ﭮ"
	"Navigator "
	"libreoffice "
	"qbittorrent "
	"Steam "
)

while [ true ];
do
	IFS=$'\n'
	winlist=($(wmctrl -l))
	wslist=($(wmctrl -d))
	out=""
	wins=()

	for ws in ${wslist[@]}
	do
		if [[ ${ws:3:2} == "* " ]];
	       	then
			for win in ${winlist[@]} 
			do
				if [[ ${win:12:1} == ${ws:0:1} ]]; 
				then
					wins=(${wins[@]} $win)
				fi
			done
		fi
	done
	
	if [[ ${#wins[@]} == 0 ]];
	then
		echo ""
		continue
	fi

	for win in ${wins[@]}
	do
		unparsed_classname=$(xprop -id ${win:0:10} WM_CLASS)
		quotepos=($(echo $unparsed_classname | grep -aob '"' | grep -oE '[0-9]+'))
		length=$((${quotepos[1]} - ${quotepos[0]} - 1))
		classname=${unparsed_classname:$((${quotepos[0]} + 1)):$length}
	
		ic=""
	
		for icon in ${icons[@]}
		do
			if [[ $classname == ${icon:0:-2} ]];
			then
				ic=${icon: -1}
			fi
		done

		if [[ $ic == "" ]];
		then
			ic="类"
		fi

		if [[ ${#wins[@]} -gt 5 ]];
		then
			out="$out %{T4}$ic%{T-}	  "
		else
			unparsed_name=$(xprop -id ${win:0:10} WM_NAME)
			quotepos=($(echo $unparsed_name | grep -aob '"' | grep -oE '[0-9]+'))
			length=$((${quotepos[1]} - ${quotepos[0]} - 1))
			name=${unparsed_name:$((${quotepos[0]} + 1)):$length}

			out="$out %{T4}$ic%{T-}	 $name	 "
		fi
	done

	echo ${out:0:-2}
done
