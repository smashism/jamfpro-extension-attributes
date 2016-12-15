#!/bin/bash

###
#
#            Name:  type_TouchBar.sh
#     Description:  Check for presense of Touch Bar Agent to see if a machine has 
#                   a Touch Bar or not. Results can then be used to create a smart 
#                   group based on status.
#          Author:  Emily Kausalik (drkausalik@gmail.com)
#         Created:  2016-12-15
#   Last Modified:  2016-12-15
#
###

# Get currently logged-in user

if pgrep "TouchBarAgent"; then
    echo "<result>Touch Bar Mac.</result>"
else
    echo "<result>Old boring non-Touch Bar Mac.</result>"
fi
