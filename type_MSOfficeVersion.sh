#!/bin/bash

###
#
#            Name:  version_MSOffice.sh
#     Description:  Checks for presense of different Word apps (one for Office 2011,
#                   the other 2016) and reports version string. Results can be used
#                   to create smart group based on app version/type.
#          Author:  github.com/smashism
#         Created:  2016-12-20
#   Last Modified:  2016-12-20
#
###

if [ -d "/Applications/Microsoft Word.app" ] && [ -d "/Applications/Microsoft Office 2011/Microsoft Word.app" ]; then
 echo "<result>Both 2011 & 2016 Installed: $(defaults read /Applications/Microsoft\ Office\ 2011/Microsoft\ Word.app/Contents/Info.plist CFBundleVersion) & $(defaults read /Applications/Microsoft\ Word.app/Contents/Info.plist CFBundleVersion)</result>"
elif [ -d "/Applications/Microsoft Word.app" ]; then
 echo "<result>Office 2016: $(defaults read /Applications/Microsoft\ Word.app/Contents/Info.plist CFBundleVersion)</result>"
elif [ -d "/Applications/Microsoft Office 2011/Microsoft Word.app" ]; then
 echo "<result>Office 2011: $(defaults read /Applications/Microsoft\ Office\ 2011/Microsoft\ Word.app/Contents/Info.plist CFBundleVersion)</result>"
else
 echo "<result>Not installed.</result>"
fi
