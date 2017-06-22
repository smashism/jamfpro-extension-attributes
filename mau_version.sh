#!/bin/sh

###
#
#            Name:  appstore_appleid.sh
#     Description:  Extentsion attribute that checks for the presence of the Microsoft
#                   Auto-Update app and reports the version. If the app is not installed,
#                   "Not installed." is reported.
#          Author:  Emily Kausalik (drkausalik@gmail.com)
#         Created:  2016-10-13
#
###

if [ -f "/Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app/Contents/Info.plist" ] ; then
    VERSION=$( defaults read "/Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app/Contents/Info.plist" CFBundleVersion )
else
    VERSION="Not installed."
fi

echo "<result>$VERSION</result>"
