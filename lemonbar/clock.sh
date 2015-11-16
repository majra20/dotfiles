#!/bin/bash
#
# OS X styled, lemonbar based
# Sorbet, https://github.com/Sorebit 

bg="e0e0e0"
gre="707070"
blk="202020"

clock() {
	date +"%a %H:%M"
}

battery() {
	sta="$(acpi | awk '{print $3}')"
	bat="$(acpi | awk '{print $4}')"

	if [ $sta = "Full," ]; then 
		bat=${bat::-1}
	else
		bat=${bat::-2}
	fi

	if [ $bat -lt 10 ]; then
		printf "%%{F#f96559}\uf244%%{F#$blk}"
	elif [ $bat -le 25 ]; then
		printf "\uf243"
	elif [ $bat -le 50 ]; then
		printf "\uf242"
	elif [ $bat -le 75 ]; then
		printf "\uf241"
	else
		printf "\uf240"
	fi
}


while true; do
	battery="$(battery)"
	clock="$(clock)"
	run="$(printf "\uf036")"
	
	echo "%{B#00$bg}%{F#$blk}\
	%{l}%{A:bash battery & disown:}$battery   %{A}\
	%{c} $clock  \
	%{r}%{A:bash run & disown:}$run  %{A}"
	
	sleep 0.15
done |

lemonbar -g 160x32+1760+0 -F \#$fg -B \#00$bg -f "System San Francisco Display:size=13" -f "FontAwesome:size=15" | bash