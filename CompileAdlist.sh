#!/bin/bash

# This script for use on PiHole RPI

cd /home/pi/blocklist/

# Sync Local Files to Git

git fetch
sleep 1

git pull
sleep 1

# Compile adlist files
hostlist-compiler -c configuration.json -o output.txt
sleep 30

# Cleanup IPs
sed -i ''"s/127.0.0.1//g" output.txt
sleep 3

sed -i ''"s/0.0.0.0//g" output.txt
sleep 3

# Cleanup comments - replace "!" with "#"
sed -i ''"s/\!/\#/g" output.txt
sleep 3

# Remove all empty lines
sed '/^$/d' output.txt > output2.txt

# Remove all IP lines
sed '/^([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)$/d' output2.txt > robs_compiled_adlist.txt
sleep 3


# Update Github project
cd /home/pi/blocklist/
git add .
sleep 3

git commit -a -m "script" 
sleep 3

git push

