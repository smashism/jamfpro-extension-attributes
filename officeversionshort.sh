#!/bin/bash

###
#
#            Name:  officeversionshort.sh
#     Description:  Checks for two of the core Office applications (Word or Outlook), and
#                   reports the short version number of those apps if detected. If not detected,
#                   reports nothing. Designed for use with AutoPkg Office testing policies.
#          Author:  Emily Kausalik
#         Created:  2018-01-18
#
###

if [ -f "/Applications/Microsoft Word.app/Contents/Info.plist" ] ; then
    VERSION=$( defaults read "/Applications/Microsoft Word.app/Contents/Info.plist" CFBundleShortVersionString )
elif [ -f "/Applications/Microsoft Outlook.app/Contents/Info.plist" ] ; then
    VERSION=$( defaults read "/Applications/Microsoft Outlook.app/Contents/Info.plist" CFBundleShortVersionString )
else
    VERSION=" "
fi

echo "<result>$VERSION</result>"
