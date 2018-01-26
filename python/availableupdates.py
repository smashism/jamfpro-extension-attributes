#!/usr/bin/python
'''
Name:           availableupdates.py
Description:    Checks for the number of available updates on a Mac,
                now in tasty Python.
Note:           Thanks to @chilcote for unearth.
Author:         Emily Kausalik (hellomodtitan@gmail.com)
Created:        2018-01-26
'''

import os
from CoreFoundation import CFPreferencesCopyAppValue

number = 'numberofupdates'

def data():
    '''Returns the number of updates available'''
    result = 'None'

    plist = '/Library/Preferences/com.apple.SoftwareUpdate.plist'
    if os.path.exists(plist):
        result = CFPreferencesCopyAppValue('LastUpdatesAvailable', plist)

    return {number: result}

if __name__ == '__main__':
    print '<result>%s</result>' % data()[number]
