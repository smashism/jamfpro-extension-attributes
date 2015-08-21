#!/bin/sh  
#  
# by emily k @ volusion 2014-06-10  
# checks for omnigraffle sn  
#  

#gets current user
currentUser=`ls -l /dev/console | cut -d " " -f 4`

#checks for app, then checks user library for license file
if [ -d -d "/Applications/OmniGraffle.app" ]; then
 result=`cat /Users/$currentUser/Library/Application\ Support/Omni\ Group/Software\ Licenses/OmniGraffle*.omnilicense | grep -A 1 Key | grep string | sed 's/<string>//g' | sed 's/<\/string>//g' | awk '{print $1}'`  
else  
  result="Not Installed."  
fi  
 echo "<result>$result</result>"  
