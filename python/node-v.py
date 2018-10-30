#!/usr/bin/python

'''
Name:           node-v.py
Description:    Check for existence of NodeJS, and get the node_version
                number if detected.
Note:           Thanks to @chilcote for unearth and #python-beginners
                for helping me learn how to do teh pythonz.
Author:         Emily Kausalik (emilykausalik@gmail.com)
Created:        2018-10-30
'''

import os
import subprocess

factoid = 'node_version'


def fact():
    '''Returns nodejs version'''
    result = 'Not installed'

    node = '/usr/local/bin/node'
    if os.path.exists(node):
        proc = subprocess.Popen(
                ['node', '-v'],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE
                )

        result, _ = proc.communicate()

        # Note: This next line takes off the v on the front of the version number.
        #       If you want the result to include the v (e.g., v10.0.0), remove line 38.
        #       Otherwise, the [1:] returns everything starting with the second character
        #       (after the v, so just the digits.)

        result = result[1:]

    return {factoid: result}


if __name__ == '__main__':
    print '<result>%s</result>' % fact()[factoid]
