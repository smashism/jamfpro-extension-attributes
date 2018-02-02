#!/usr/bin/python

'''
Name:           last_opened.py
Description:    Define a file/application in path, then use mdls to
                see when that thing was last used.
Note:           Thanks to @chilcote for unearth and #python-beginners
                for helping me learn how to do teh pythonz.
Author:         Emily Kausalik (hellomodtitan@gmail.com)
Created:        2018-02-02
'''


import subprocess

path = "/Applications/Atom.app/Contents/MacOS/Atom"
proc = subprocess.Popen(['mdls', '-name', 'kMDItemLastUsedDate', path], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
out,err = proc.communicate()

result = " ".join(out.strip().split()[2:4])

print '<result>%s</result>' % (result)
