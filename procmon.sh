#!/bin/bash
# Author Ippsec // https://youtu.be/K9DKULxSBK4?t=1890
# save to a file and "chmod +X"
# usage: ./procmon.sh

# loop by line
IFS=$’\n\

old_process=$(ps -eo command)

while true; do 
    new_process=$(ps -eo command)
    diff <(echo “$old_process”) <(echo “$new_process”) | grep [\<\>]
    sleep 1
    old_process=$new_process
done
