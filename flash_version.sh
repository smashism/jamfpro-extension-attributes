#!/bin/sh

#
# script by emily k @volusion 2014-06-10
# to detect version of flash installed on OS X
# 

if [ -f "/Library/Internet Plug-Ins/Flash Player.plugin/Contents/version.plist" ] ; then
    VERSION=$( defaults read "/Library/Internet Plug-Ins/Flash Player.plugin/Contents/version.plist" CFBundleVersion )
else
    VERSION="Not installed."
fi

echo "<result>$VERSION</result>"
