#!/bin/bash
#
# Sorbet - (no copyrights whatsoever) 2015
# A quick bar overlap for shutting down and logging out

white=f0f0f0
active=c3ac82

font=-gohu-gohuicon-medium-r-normal--11-80-100-100-c-60-iso8859-1

while true; do
	echo -e "%{c}%{A:poweroff:}   Quit%{A} %{A:reboot:}  Restart%{A} %{A:killall close:}  Cancel   %{A}"
	sleep 0.25
done |
lemonbar -d -g 188x20+1092+0 -B \#FF$active -F \#FF$white -f $font | bash
