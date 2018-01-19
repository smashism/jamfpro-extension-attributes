#!/bin/bash

###
#
#            Name:  officeversionshort.sh
#     Description:  Checks for two of the core Office applications (Word or Outlook), and
#                   reports the short version number of those apps if detected. If not detected,
#                   reports nothing. Designed for use with AutoPkg Office testing policies.
#          Author:  Emily Kausalik
#         Created:  2018-01-18
#         Updated:  2018-01-19
#            Note:  Changed output to match formatting from macadmins.software/versions.xml
#
###

if [ -f "/Applications/Microsoft Word.app/Contents/Info.plist" ] ; then
    echo "<result>$( defaults read "/Applications/Microsoft Word.app/Contents/Info.plist" CFBundleShortVersionString ).0</result>"
elif [ -f "/Applications/Microsoft Outlook.app/Contents/Info.plist" ] ; then
    echo "<result>$( defaults read "/Applications/Microsoft Outlook.app/Contents/Info.plist" CFBundleShortVersionString ).0</result>"
else
    echo "<result> </result>"
fi
