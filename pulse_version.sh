#!/bin/bash

################################
# Check Junos Pulse version
################################

if [ -d /Applications/Junos\ Pulse.app ]; then
	
VERSION=`grep -o "DisplayVer.*" /Applications/Junos\ Pulse.app/Contents/Resources/JunosPulseVersion.ini | cut -d'=' -f2`
RESULT=$(echo "${VERSION[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' ')
	
	echo "<result>$RESULT</result>"
	
else

	echo "<result>Not Installed</result>"
	
fi
