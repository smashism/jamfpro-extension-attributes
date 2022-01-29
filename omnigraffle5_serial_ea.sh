#!/bin/sh
#
# by emily k 2014-06-10
# checks for omnigraffle 5 sn
# updated 2022-01-29

#gets current user
currentUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )

#checks for app, then checks user library for license file
if [ -d "/Applications/OmniGraffle Professional 5.app" ]; then
 result=`cat /Users/$currentUser/Library/Application\ Support/Omni\ Group/Software\ Licenses/OmniGraffle-*.omnilicense | grep -A 1 Key | grep string | sed 's/<string>//g' | sed 's/<\/string>//g' | awk '{print $1}'`
else
  result="Not Installed."
fi
 echo "<result>$result</result>"
