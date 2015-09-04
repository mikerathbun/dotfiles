#!/bin/bash
clear
printf "This is information.\n"

printf "Hello, $USER.\n\n"

printf "Today's date is `date`, this week `date +"%V"`.\n\n"

printf "Connected users:\n"
w | cut -d " " -f 1 - | grep -v USER | sort -u
printf "\n"

printf "This is `uname -s` running on a `uname -m` processor.\n\n"

printf "Uptime is:\n"
uptime
printf "\n"

printf "End***"

