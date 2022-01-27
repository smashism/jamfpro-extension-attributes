#!/usr/local/bin/managed_python3

'''
Name:           outlook_last_opened.py3
Description:    Define a file/application in path, then use mdls to
                see when that thing was last used.
Note:           Roll your own organizational python3: https://github.com/macadmins/python
                Modeled on unearth: github.com/chilcote/unearth
Author:         github.com/smashism
Created:        2018-02-02
Updated:        2022-01-27
'''

import subprocess
import os.path

data = 'last_opened'
app_path = "/Applications/Microsoft Outlook.app/Contents/MacOS/Microsoft Outlook"

def fact():
    '''Returns last date item was used.'''

    # Check for Outlook 2016 first.
    if os.path.exists(app_path):
        proc = subprocess.Popen(['mdls', '-name', 'kMDItemLastUsedDate', app_path], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        out,err = proc.communicate()
        result = out.decode('UTF-8')

        result = " ".join(result.strip().split()[2:4])

    # If neither are installed, say so.
    else:
        result = 'Outlook not installed.'

    return {data: result.strip()}

if __name__ == '__main__':
    print('<result>%s</result>' % fact()[data])
