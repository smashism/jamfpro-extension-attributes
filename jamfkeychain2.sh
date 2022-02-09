#!/bin/sh

###
#
#            Name:  jamfkeychain2.sh
#     Description:  Detect if the new JAMF.keychain is in place on a Mac.
#          Author:  github.com/smashism
#         Created:  2022-02-03
#
###

if [ -f "/Library/Application Support/JAMF/JAMF.keychain" ] ; then
    result="Found"
else
    result="Not found"
fi

echo "<result>$result</result>"
