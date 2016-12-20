#!/bin/bash

###
#
#            Name:  version_MSOffice.sh
#     Description:  Checks for presense of different Word apps (one for Office 2011,
#                   the other 2016) and reports version string. Results can be used 
#                   to create smart group based on app version/type.
#          Author:  Emily Kausalik (drkausalik@gmail.com)
#         Created:  2016-12-20
#   Last Modified:  2016-12-20
#
###

# Get current user.
# loggedInUser=$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')

if [ -d "/Applications/Microsoft Word.app" ]; then
 echo "<result>Office 2016: $(defaults read /Applications/Microsoft\ Word.app/Contents/Info.plist CFBundleVersion)</result>"
elif [-d "Applications/Microsoft Office 2011/Microsoft Word.app" ]; then
 echo "<result>Office 2011: $(defaults read /Applications/Microsoft\ Office\ 2011/Microsoft\ Word.app/Contents/Info.plist CFBundleVersion)</result>"
else
echo "<result>Not installed.</result>"
fi
