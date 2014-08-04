#!/bin/sh  
#  
# by emily k @ volusion 2014-06-10  
# checks for vmware fusion sn  
#  
if [ -d "/Library/Preferences/VMware Fusion/" ] ; then  
  result=`cat /Library/Preferences/VMware\ Fusion/license* | grep Serial | awk '{print $3}' | sed 's/"//g'`  
else  
  result="Not installed."  
fi  
  echo "<result>$result</result>"  
