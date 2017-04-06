#!/bin/bash

# Check to see if the SentinelOne agent is installed.
# If the agent is installed, report the agent
# version.

if [ -f "/usr/local/bin/sentinelctl" ] ; then 
    RESULT=$( /usr/bin/sudo /usr/local/bin/sentinelctl version | awk '{print $2 $3}' )
else
    RESULT="Not installed."
fi

echo "<result>$RESULT</result>"
