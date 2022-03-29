#!/bin/bash

# This script for use on PiHole RPI

cd /home/pi/blocklist/

# Sync Local Files to Git

git fetch
sleep 5

git pull
sleep 5

# Compile adlist files
hostlist-compiler -c configuration.json -o output.txt
sleep 5

# Cleanup IPs
sed -i ''"s/127.0.0.1 //g" output.txt
sleep 5

sed -i ''"s/0.0.0.0 //g" output.txt
sleep 5

# Cleanup comments - replace "!" with "#"
sed -i ''"s/\!/\#/g" output.txt
sleep 5

# Remove all IP lines
# sed -e '/s/^([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)$//g' output.txt
# sleep 5

# Remove all empty lines
sed '/^$/d' output.txt > robs_compiled_adlist.txt
sleep 5

# Update Github project
cd /home/pi/blocklist/
git add .
sleep 3

git commit -a -m "script" 
sleep 3

git push

sleep 3

exit
