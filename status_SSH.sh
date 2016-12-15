#!/bin/bash

###
#
#            Name:  status_SSH.sh
#     Description:  Uses systemsetup to check SSH status, will report one of two results:
#                   - Remote Login: On
#                   - Remote Login: Off
#                   Results can then be used to create a smart group based on status.
#            Note:  This is designed to be an EA for Jamf Pro.
#          Author:  Emily Kausalik
#         Created:  2016-12-15
#   Last Modified:  2016-12-15
#
###

ssh_status=$(/usr/sbin/systemsetup -getremotelogin)
echo "<result>$ssh_status</result>"
