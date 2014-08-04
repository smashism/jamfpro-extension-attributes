#!/bin/sh  
#  
# by emily k @ volusion 2014-06-10  
# checks for omnigraffle sn  
#  
if [ -d "/Library/Application Support/Omni Group/Software Licenses/" ]; then  
  result=`cat /Library/Application\ Support/Omni\ Group/Software\ Licenses/OmniGraffle*.omnilicense | grep -A 1 Key | grep string | sed 's/<string>//g' | sed 's/<\/string>//g' | awk '{print $1}'`  
else  
  result="Not Installed."  
fi  
 echo "<result>$result</result>"  
