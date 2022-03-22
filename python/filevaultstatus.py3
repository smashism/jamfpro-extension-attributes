#!/usr/local/bin/managed_python3

'''
Name:           filevaultstatus.py3
Description:    Checks for the number of available updates on a Mac.
Note:           Roll your own organizational python3: https://github.com/macadmins/python
                Modeled on unearth: github.com/chilcote/unearth
Author:         github.com/smashism
Created:        2018-02-01
Updated:        2022-01-27

Notes:
- Supports HFS & APFS filesystems
- Supports 10.8 and above
- Does not support 10.7 and below

If encrypted, the result is displayed without quotes:
"FileVault is On."

If encrypting, the result is displayed without quotes:
"Encryption in progress:"
How much has been encrypted of of the total
amount of space is also displayed.

If decrypting, the result is displayed without quotes:
"Decryption in progress:"
How much has been decrypted of of the total
amount of space is also displayed

If not encrypted, the result is displayed without quotes:
"FileVault is Off."
'''

import subprocess

factoid = 'filevault_status'

def fact():
    '''Return the current FileVault status for the startup disk'''
    try:
        proc = subprocess.Popen(['/usr/bin/fdesetup', 'status'],
                                stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        result, _ = proc.communicate()
        result = result.decode('UTF-8')

        '''If encryption or decryption is in progress, only show progress details'''
        if 'progress' in result:
            result = result.split('\n')[1]

        '''Check for Filevault status on newer versions of macOS,
        ignore line about deferral for cleaner EA results'''
        if 'Deferred' in result:
            result = result.split('\n')[0]

    except (IOError, OSError):
        result = 'Unknown'

    return {factoid: result.strip()}

if __name__ == '__main__':
    print(('<result>%s</result>' % fact()[factoid]))
