#!/bin/bash
#
# NoMAD_LastPasswordExpireDate
# Checks NoMAD plist for LastPasswordExpireDate (AD password expiration)
# By github.com/smashism
# Last modified 2016-11-30
# Provided as-is with no support or warranty

loggedInUser=$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')

LastPasswordExpireDate=$(defaults read "/Users/$loggedInUser/Library/Preferences/com.trusourcelabs.nomad.plist" LastPasswordExpireDate)

if [ "$LastPasswordExpireDate" ]; then
      echo "<result>$LastPasswordExpireDate</result>"
else
      echo "<result>NoMAD not installed.</result>"
fi
