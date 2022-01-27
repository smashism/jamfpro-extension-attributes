#!/usr/local/bin/managed_python3
'''
Name:           availableupdates.py3
Description:    Checks for the number of available updates on a Mac.
Note:           Roll your own organizational python3: https://github.com/macadmins/python
                Modeled on unearth: github.com/chilcote/unearth
Author:         github.com/smashism
Created:        2018-01-26
Updated:        2022-01-27
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
    print('<result>%s</result>' % data()[number])
