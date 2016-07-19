#!/bin/sh

#
# by smashism 2016-07-19
# to detect office licensing type
# 

if [ -f "/Library/Preferences/com.microsoft.office.licensing.plist" ] ; then
    license_type="Volume Licensed"
else
    license_type="Office 365"
fi

echo "<result>$license_type</result>"
