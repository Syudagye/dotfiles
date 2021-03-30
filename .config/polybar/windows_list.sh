#!/bin/sh

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
	winlist=($(wmctrl -l 2>/dev/null))
	[ $? -ne 0 ] && continue	# Check exit code
	wslist=($(wmctrl -d))
	out=""

	for ws in ${wslist[@]}
	do
		[ ${ws:3:2} == "* " ] && index=${ws:0:1} && break 
	done

	for win in ${winlist[@]}
	do
		[ ${win:12:1} -ne $index ] && continue

		unparsed_classname=$(xprop -id ${win:0:10} WM_CLASS)
		quotepos=($(echo $unparsed_classname | grep -aob '"' | grep -oE '[0-9]+'))
		length=$((${quotepos[1]} - ${quotepos[0]} - 1))
		classname=${unparsed_classname:$((${quotepos[0]} + 1)):$length}
	
		ic=""

		for icon in ${icons[@]}
		do
			[ $classname == ${icon:0:-2} ] && ic=${icon: -1} 
		done

		[ ${#ic} -eq 0 ] && ic="类"
		
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
	
	[ ${#out} -ne 0 ] && echo ${out:0:-2} || echo ""
done
