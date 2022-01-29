#!/bin/bash
#
# NoMAD_LastPasswordExpireDate
# Checks NoMAD plist for LastPasswordExpireDate (AD password expiration)
# By github.com/smashism
# Last modified 2022-01-29
# Provided as-is with no support or warranty

loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )

LastPasswordExpireDate=$(defaults read "/Users/$loggedInUser/Library/Preferences/com.trusourcelabs.nomad.plist" LastPasswordExpireDate)

if [ "$LastPasswordExpireDate" ]; then
      echo "<result>$LastPasswordExpireDate</result>"
else
      echo "<result>NoMAD not installed.</result>"
fi
