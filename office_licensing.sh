#!/bin/sh

#
# script by emily k 2016-07-19
# to detect office licensing type
# updated 2022-01-29
#

loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )
if [ -f "/Library/Preferences/com.microsoft.office.licensing.plist" ] || [ -f "/Library/Preferences/com.microsoft.office.licensingV2.plist" ]; then
    license_type="Volume Licensed"
elif [ -f "/Users/$loggedInUser/Library/Group Containers/UBF8T346G9.Office/com.microsoft.Office365.plist" ] || [ -f "Users/$loggedInUser/Library/Application\ Support/Microsoft/Office/DRM/e0QyRjBFODBFLTM3NzYtNEFCOS1BMzVGLTc1Mjc2NzlCQUJDO" ]; then
    license_type="Office 365"
fi

echo "<result>$license_type</result>"
