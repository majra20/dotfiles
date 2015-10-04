#!/bin/bash

bg="445866"
bg2="3c4f5b"
fg="eeeeee"

font=-gohu-gohufont-medium-r-normal--11-80-100-100-c-60-iso8859-1

desktop() {
	current="$(wmctrl -d | grep -n -o "*" | cut -c 1)"

	echo "- - - -" | sed s/-/*/$current
}

clock() {
	date +"%B %d, %H:%M"
}

music() {
#	mpc="$(mpc)"
#	current="$(echo "$mpc" | head -n 1)"
	current="Teebs - Piano Months"
	echo "$current" 
}

while true; do
	desktop="$(desktop)"
	clock="$(clock)"
	music="$(music)"
	
	echo "%{B#$bg2}   $desktop   %{B#$bg}%{c}   $clock   %{r}%{B#$bg2}   $music  %{B#$bg}"
	sleep 0.15
done |

lemonbar -g 1280x24+0+0 -F \#FF$fg -B \#FF$bg -f $font
