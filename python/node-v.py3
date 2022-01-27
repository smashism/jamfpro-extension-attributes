#!/usr/local/bin/managed_python3

'''
Name:           node-v.py3
Description:    Check for existence of NodeJS, and get the node_version
                number if detected.
Note:           Roll your own organizational python3: https://github.com/macadmins/python
                Modeled on unearth: github.com/chilcote/unearth
Author:         github.com/smashism
Created:        2018-10-30
Updated:        2022-01-27
'''

import os
import subprocess

factoid = 'node_version'


def fact():
    '''Returns nodejs version'''
    result = 'Not installed'

    node = '/usr/local/bin/node'
    brew_node = '/opt/homebrew/bin/node'
    if os.path.exists(node):
        proc = subprocess.Popen(
                ['node', '-v'],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE
                )

        result, _ = proc.communicate()
        result = result.decode('UTF-8')

        # Note: This next line takes off the v on the front of the version number.
        #       If you want the result to include the v (e.g., v10.0.0), remove line 38.
        #       Otherwise, the [1:] returns everything starting with the second character
        #       (after the v, so just the digits.)

        result = result[1:]

    if os.path.exists(brew_node):
        proc = subprocess.Popen(
                ['node', '-v'],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE
                )

        result, _ = proc.communicate()
        result = result.decode('UTF-8')

        # Note: This next line takes off the v on the front of the version number.
        #       If you want the result to include the v (e.g., v10.0.0), remove line 38.
        #       Otherwise, the [1:] returns everything starting with the second character
        #       (after the v, so just the digits.) [:-1] gets rid of the trailing
        #       line break.

        result = result[1:][:-1]

    return {factoid: result}


if __name__ == '__main__':
    print('<result>%s</result>' % fact()[factoid])
