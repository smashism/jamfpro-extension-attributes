#!/bin/sh
#
# by jhbush jamfnation and macadmins slack #jamfnation
# added 2015-08-20
# updated 2022-01-29
#

currentUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )
if [ -d "/Applications/OmniGraffle.app" ]; then
 result=`cat /Users/$currentUser/Library/Containers/com.omnigroup.OmniGraffle6/Data/Library/Application\ Support/Omni\ Group/Software\ Licenses/OmniGraffle*.omnilicense | grep -A 1 Key | grep string | sed 's/<string>//g' | sed 's/<\/string>//g' | awk '{print $1}'`
echo "<result>$result</result>"
else
echo "<result>Not Installed</result>"
fi
