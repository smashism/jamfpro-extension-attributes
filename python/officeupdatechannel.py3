#!/usr/local/bin/managed_python3
'''
Name:           officeupdatechannel.py3
Description:    Displays the update channel name for a Mac.
Note:           Roll your own organizational python3: https://github.com/macadmins/python
                Modeled on unearth: github.com/chilcote/unearth
Author:         github.com/smashism
Created:        2018-03-14
Updated:        2022-01-27
'''

import os
from CoreFoundation import CFPreferencesCopyAppValue
from SystemConfiguration import SCDynamicStoreCopyConsoleUser

factoid = 'channelname'

def fact():
    '''Returns the channel name for Office updates'''
    result = 'None'

    console_user = SCDynamicStoreCopyConsoleUser(None, None, None)[0]
    plist = '/Users/%s/Library/Preferences/com.microsoft.autoupdate2.plist' % console_user
    if os.path.exists(plist):
        result = CFPreferencesCopyAppValue('ChannelName', plist)

    return {factoid: result}

if __name__ == '__main__':
    print('<result>%s</result>' % fact()[factoid])
