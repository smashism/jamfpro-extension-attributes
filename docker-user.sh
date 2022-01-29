#!/bin/bash

###
#
#            Name:  docker-user.sh
#     Description:  Detect logged-in Docker Desktop user.
#           Notes:  Roll your own organizational python3: https://github.com/macadmins/python
#                   Running a command as another user: https://scriptingosx.com/2020/08/running-a-command-as-another-user/
#          Author:  github.com/smashism
#         Created:  2022-01-29
#
###

currentUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )
uid=$(id -u "$currentUser")
dockerDesktopCLI="/usr/local/bin/docker-credential-desktop"
managedPy3="/usr/local/bin/managed_python3"

runAsUser() {
    launchctl asuser "$uid" sudo -u "$currentUser" "$@"
}

if [ -f ${dockerDesktopCLI} ] ; then
    result=$( runAsUser ${dockerDesktopCLI} list | ${managedPy3} -c 'import sys, json; print(json.load(sys.stdin)["https://index.docker.io/v1/"])' )
else
    result=" "
fi

echo "<result>$result</result>"
