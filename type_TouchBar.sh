#!/bin/bash

###
#
#            Name:  type_TouchBar.sh
#     Description:  Check for presense of Control Strip preferences to see if a 
#                   machine has a Touch Bar or not. Results can then be used to create 
#                   a smart group based on type.
#          Author:  Emily Kausalik (drkausalik@gmail.com)
#         Created:  2016-12-15
#   Last Modified:  2016-12-15
#
###

# Get currently logged-in user

current_user=$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')

if [ -f "/Users/$current_user/Library/Preferences/com.apple.touchbar.agent.plist" ] ; then
    touchbar="Touch Bar present."
else
    touchbar="No super sweet Touch Bar."
fi

echo "<result>$touchbar</result>"
