#!/usr/local/bin/managed_python3

# Roll your own organizational python3: https://github.com/macadmins/python

import plistlib
import subprocess

data = subprocess.check_output(['/usr/sbin/system_profiler', 'SPSoftwareDataType', '-xml', '-detailLevel', 'mini'])
plist = plistlib.loads(data)
uptime_string = plist[0]['_items'][0]['uptime']
time_list = uptime_string.split('up ')[1].split(':')
time_stamp = '{} days {} hours {} minutes {} seconds'.format(*time_list)

print(("<result>{}</result>".format(time_stamp)))
