#!/bin/bash

currentUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )
uid=$(id -u "$currentUser")
appName=" " # including .app (e.g., "Self Service.app")

runAsUser() {
    launchctl asuser "$uid" sudo -u "$currentUser" "$@"
}

if [ -d "/Applications/$appName" ] ; then
    result=$( runAsUser mdls -name kMDItemLastUsedDate "/Applications/$appName" | awk '{ print $3 }')
else
    result=" "
fi

echo "<result>$result</result>"
