#!/bin/sh

#
# script by emily k 2016-06-07
# to detect if homebrew is on a machine
# 

if [ -d "/usr/local/Library/Homebrew/" ] ; then
    PRESENT="Homebrew present."
else
    PRESENT="Not present."
fi

echo "<result>$PRESENT</result>"
