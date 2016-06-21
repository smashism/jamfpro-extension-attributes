#!/usr/bin/python
import plistlib
import sys

wifi = plistlib.readPlist('/Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist')
sys.stdout.write ('<result>')
for k, details in wifi['KnownNetworks'].items():
    SSID     = details['SSID'].data
    security = details['SecurityType']
    print SSID, '-', security
sys.stdout.write ('</result>')
