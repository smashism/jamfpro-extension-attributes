#!/bin/sh

###
#
#            Name:  version_centrify.sh
#     Description:  This script is an Extension Attribute (EA) for the Casper Suite/Jamf Pro
#                   Server. It checks the version of Centrify installed on a machine via the
#                   MacDiagnosticTool.app and reports it. If not installed, emojis (that are tested
#                   to load in a JSS version 9.98 or higher in Chrome. Not tested on Windows or in
#                   Safari. We're not animals.
#          Author:  github.com/smashism
#         Created:  2017-06-23
#
###

if [ -f "/Library/Application Support/Centrify/MacDiagnosticTool.app/Contents/Info.plist" ] ; then
    VERSION=$( defaults read "/Library/Application Support/Centrify/MacDiagnosticTool.app/Contents/Info.plist" CFBundleShortVersionString )
else
    VERSION=" ❌✌️ "
fi

echo "<result>$VERSION</result>"
