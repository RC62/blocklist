#!/bin/bash

# This script for use on PiHole RPI

cd /home/pi/blocklist/

# Compile adlist files
hostlist-compiler -c configuration.json -o output.txt
sleep 2

# Cleanup IPs
sed -i ''"s/127.0.0.1//g" output.txt
sleep 2

sed -i ''"s/0.0.0.0//g" output.txt
sleep 2

# Cleanup comments - replace "!" with "#"
sed -i ''"s/\!/\#/g" output.txt
sleep 2

# Remove all empty lines

sed '/^$/d' output.txt > robs_compiled_adlist.txt
sleep 2


#Update Github project

git add .
git commit -m "update script" 
git push

