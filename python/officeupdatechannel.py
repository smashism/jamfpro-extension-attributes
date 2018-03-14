#!/usr/bin/python
'''
Name:           officeupdatechannel.py
Description:    Displays the update channel name for a Mac.
Note:           Thanks to @chilcote for unearth.
Author:         Emily Kausalik
Created:        2018-03-14
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
    print '<result>%s</result>' % fact()[factoid]
