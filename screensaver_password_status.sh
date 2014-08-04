#!/bin/bash

#
# script by emily k @ volusion 2014-06-10
# check for user’s screensaver login screen preferences
#

currentUser=`ls -l /dev/console | cut -d " " -f 4`

status=`defaults read "/Users/$currentUser/Library/Preferences/com.apple.screensaver.plist" askForPassword`

if [ "$status" == "0" ]; then
    result="False"
elif [ "$status" == "1" ]; then
    result="True"
else
    result="Not set."
fi    

echo "<result>$result</result>"
