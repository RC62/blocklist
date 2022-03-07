#!/bin/bash

# This script for use on PiHole RPI

# Compile adlist files
hostlist-compiler -c configuration.json -o output.txt
sleep 1

# Cleanup IPs
sed -i ''"s/127.0.0.1//g" output.txt
sleep 1

sed -i ''"s/0.0.0.0//g" output.txt
sleep 1

# Cleanup comments - replace "!" with "#"
sed -i ''"s/\!/\#/g" output.txt
sleep 1

# Remove all empty lines

sed '/^$/d' output.txt > robs_compiled_adlist.txt
sleep 1


#Update Github project

git add *
sleep 1

git commit -m "update script"
sleep 1

git push
sleep 1
