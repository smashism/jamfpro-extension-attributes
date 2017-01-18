#!/bin/bash

###
#
#            Name:  appstore_appleid.sh
#     Description:  This script is an Extension Attribute (EA) for the Casper Suite/Jamf Pro
#                   Server. It checks com.apple.commerce.plist for the associated Apple ID
#                   and prints it out for display on the computer record in the JSS.
#            Note:  This is a replacement for com.apple.storeagent.plist which no longer
#                   exists on Sierra (10.12.x).
#          Author:  Emily Kausalik (drkausalik@gmail.com)
#         Created:  2017-01-18
#   Last Modified:  2017-01-18
#
###

# Get currently logged-in user.
LOGGED_IN_USER=$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')

# Read com.apple.commerce.plist
APPLE_ID=$(/usr/libexec/PlistBuddy -c "Print :PrimaryAccount:0:1:identifier" /Users/$LOGGED_IN_USER/Library/Preferences/com.apple.commerce.plist)

if [ "$APPLE_ID" ]; then
      echo "<result>$APPLE_ID</result>"
else
      echo "<result>Not available.</result>"
fi
