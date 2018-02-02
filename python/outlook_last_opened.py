#!/usr/bin/python

'''
Name:           outlook_last_opened.py
Description:    Define a file/application in path, then use mdls to
                see when that thing was last used.
Note:           Thanks to @chilcote for unearth and #python-beginners
                for helping me learn how to do teh pythonz.
Author:         Emily Kausalik (hellomodtitan@gmail.com)
Created:        2018-02-02
'''

import subprocess
import os.path

data = 'last_opened'

def fact():
    '''Returns last date item was used.'''

    # Check for Outlook 2016 first.
    if os.path.exists("/Applications/Microsoft Outlook.app/Contents/MacOS/Outlook"):
        proc = subprocess.Popen(['mdls', '-name', 'kMDItemLastUsedDate', '/Applications/Microsoft Outlook.app/Contents/MacOS/Outlook'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        out,err = proc.communicate()

        result = " ".join(out.strip().split()[2:4])

    # Check for Outlook 2011 if 2016 isn't installed.
    elif os.path.exists("/Applications/Microsoft Office.app/Microsoft Outlook.app/Contents/MacOS/Outlook"):
        proc = subprocess.Popen(['mdls', '-name', 'kMDItemLastUsedDate', '/Applications/Microsoft Office.app/Microsoft Outlook.app/Contents/MacOS/Outlook'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        out,err = proc.communicate()

        result = " ".join(out.strip().split()[2:4])

    # If neither are installed, say so.
    else:
        result = 'Outlook not installed.'

    return {data: result.strip()}

if __name__ == '__main__':
    print '<result>%s</result>' % fact()[data]
