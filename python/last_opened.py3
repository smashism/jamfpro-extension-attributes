#!/usr/local/bin/managed_python3

'''
Name:           last_opened.py3
Note:           Roll your own organizational python3: https://github.com/macadmins/python
                Modeled on unearth: github.com/chilcote/unearth
Author:         github.com/smashism
Created:        2018-02-02
Updated:        2022-01-27
'''


import subprocess

path = "/Applications/Atom.app/Contents/MacOS/Atom"
proc = subprocess.Popen(['mdls', '-name', 'kMDItemLastUsedDate', path], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
out,err = proc.communicate()
out = out.decode('UTF-8')

result = " ".join(out.strip().split()[2:4])

print('<result>%s</result>' % (result))
