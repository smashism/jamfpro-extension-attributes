#!/usr/bin/python

'''
Inspired/based on chilcote's unearth
https://github.com/chilcote/unearth/blob/master/artifacts/filevault_status.py

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

Updated by:   Emily Kausalik
Last Update:  2018-02-01
'''

import subprocess

factoid = 'filevault_status'

def fact():
    '''Return the current FileVault status for the startup disk'''
    try:
        proc = subprocess.Popen(['/usr/bin/fdesetup', 'status'],
                                stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        result, _ = proc.communicate()

        '''If encryption or decryption is in progress, only show progress details'''
        if 'progress' in result:
            result = result.split('\n')[1]

    except (IOError, OSError):
        result = 'Unknown'

    return {factoid: result.strip()}

if __name__ == '__main__':
    print '<result>%s</result>' % fact()[factoid]
