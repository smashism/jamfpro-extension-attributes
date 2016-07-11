#!/usr/bin/python
import plistlib
import sys

# mostly by frogor
# outputs list of all saved SSIDs with security type
# meant for JSS reporting
# published by smashism 2016-07-11

wifi = plistlib.readPlist('/Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist')
sys.stdout.write ('<result>')
for k, details in wifi['KnownNetworks'].items():
    SSID     = details['SSID'].data
    security = details['SecurityType']
    print SSID, '-', security
sys.stdout.write ('</result>')
