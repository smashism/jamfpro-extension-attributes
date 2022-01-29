#!/bin/sh
 #
 # script by emily kw 2014-07-29
 # to detect if the Awesome Screenshot Extension is installed on Google Chrome
 # updated 2022-01-29 
 #
 currentUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )

 if [ -d "/Users/$currentUser/Library/Application Support/Google/Chrome/Default/Extensions/alelhddbbhepgpmgidjdcjakblofbmce" ] ; then
      STATUS="Awesome Screenshot Installed."
 else
      STATUS="Not installed."
 fi
 echo "<result>$STATUS</result>"
