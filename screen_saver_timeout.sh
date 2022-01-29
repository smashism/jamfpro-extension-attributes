#!/bin/bash

#  screensavertimeout.sh
#
#  Created by github.com/smashism on 4 March 2015.
#  Gets UUID and active user to determin idleTime set in ByHost com.apple.screensaver preference
#  echoes results in minutes
#  meant for monitoring setting and using to scope policies if needed
#  designed for reporting as EA in Casper Suite v 9
#  last updated 2022-01-29

# get username
currentUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )

# get UUID
userUUID=`system_profiler SPHardwareDataType | awk '/UUID/ { print $3; }'`

# get idleTime
timeout=`defaults read "/Users/$currentUser/Library/Preferences/ByHost/com.apple.screensaver.$userUUID.plist" idleTime`

result=`expr $timeout / 60`

echo "<result>$result minutes</result>"

exit 0
