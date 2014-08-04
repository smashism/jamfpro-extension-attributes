#!/bin/sh  
 #  
 # script by emily k @volusion 2014-07-29  
 # to detect if the Awesome Screenshot Extension is installed on Google Chrome  
 #   
 currentUser=`ls -l /dev/console | cut -d " " -f 4`  
 if [ -d "/Users/$currentUser/Library/Application Support/Google/Chrome/Default/Extensions/alelhddbbhepgpmgidjdcjakblofbmce" ] ; then  
      STATUS="Awesome Screenshot Installed."  
 else  
      STATUS="Not installed."  
 fi  
 echo "<result>$STATUS</result>"  
