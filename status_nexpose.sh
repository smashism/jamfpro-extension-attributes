#!/bin/bash

# Check to see if the Nexpose agent is installed.

if [ -d "/opt/rapid7/ir_agent/" ] ; then 
    RESULT="Agent present."
else
    RESULT="No agent."
fi

echo "<result>$RESULT</result>"
