#!/bin/bash

login_time=$(who | awk 'NR==1 {print $3 " " $4}')

login_sec=$(date -d "$login_time" +%s)
midnight_sec=$(date -d "today 00:00" +%s)
now=$(date +%s)

# choose the later time
if [ "$login_sec" -gt "$midnight_sec" ]; then
    start_time=$login_sec
else
    start_time=$midnight_sec
fi

diff=$((now - start_time))

hours=$((diff / 3600))
minutes=$(((diff % 3600) / 60))

printf "%dh %02dm\n" "$hours" "$minutes"
