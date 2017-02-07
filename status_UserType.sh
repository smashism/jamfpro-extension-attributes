#!/bin/sh

###
#
#            Name:  status_UserType.sh
#     Description:  Detects if a user account is Network or Mobile. The results can then be used
#                   to scope a policy to convert accounts to mobile accounts automatically.
#            Note:  Results for local accounts is currently unknown.
# Original Author:  Justin Workman (justinworkman on Jamf Nation)
#         Created:  2013-05-31
#     Modified By:  Emily Kausalik
#   Last Modified:  2017-02-07 
#
###

liu=$( python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");' )
la=$(ls /Users | grep $liu)
if [ "$liu" = "$la" ]; then
echo "<result>Mobile</result>"
else
echo "<result>Network</result>"
fi
