#!/bin/sh

#
# script by emily k 2016-07-19
# to detect office licensing type
# 

loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

if [ -f "/Library/Preferences/com.microsoft.office.licensing.plist" ] || [ -f "/Library/Preferences/com.microsoft.office.licensingV2.plist" ]; then
    license_type="Volume Licensed"
elif [ -f "/Users/$loggedInUser/Library/Group Containers/UBF8T346G9.Office/com.microsoft.Office365.plist" ] || [ -f "Users/$loggedInUser/Library/Application\ Support/Microsoft/Office/DRM/e0QyRjBFODBFLTM3NzYtNEFCOS1BMzVGLTc1Mjc2NzlCQUJDO" ]; then
    license_type="Office 365"
fi

echo "<result>$license_type</result>"
