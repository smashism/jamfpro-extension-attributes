#!/bin/sh

###
#
#            Name:  status_UserType.sh
#     Description:  Detects if a user account is Network or Mobile. The results can then be used
#                   to scope a policy to convert accounts to mobile accounts automatically.
#            Note:  Results for local accounts is currently unknown.
# Original Author:  Justin Workman (justinworkman on Jamf Nation)
#         Created:  2013-05-31
#     Modified By:  github.com/smashism
#   Last Modified:  2022-01-29
#
###

liu=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )
la=$(ls /Users | grep $liu)
if [ "$liu" = "$la" ]; then
echo "<result>Mobile</result>"
else
echo "<result>Network</result>"
fi
