#!/bin/sh

#
# script by emily k @volusion 2014-06-10
# to detect version of java installed on OS X
# 

if [ -f "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Enabled.plist" ] ; then
    VERSION=$( defaults read "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Enabled.plist" CFBundleVersion )
else
    VERSION="Not installed."
fi

echo "<result>$VERSION</result>"
