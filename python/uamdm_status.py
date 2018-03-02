#!/usr/bin/python

import subprocess
from distutils.version import LooseVersion

factoid = 'mdm_enrollment_status'
min_os_version = LooseVersion('10.13.4')


def fact():
    '''Returns status of MDM enrollment'''
    result = 'None.'
    try:
        cmd = ['/usr/bin/sw_vers', '-productVersion']
        osproductversion = subprocess.check_output(cmd, close_fds=True)
        os_version = LooseVersion(osproductversion.strip())
        if os_version >= min_os_version:
            proc = subprocess.Popen(
                ['/usr/bin/profiles', 'status', '-type', 'enrollment'],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE
                )
            stdout, _ = proc.communicate()
            if stdout:
                for line in stdout.splitlines():
                    if 'MDM enrollment:' in line:
                        result = line.split(':')[-1].strip()
                    if 'Enrolled via DEP:' in line:
                        result = 'DEP enrolled.'
            else:
                result = 'Unknown.'
        else:
            result = 'Not applicable.'
    except (IOError, OSError):
        pass
    return {factoid: result}


if __name__ == '__main__':
    print '<result>%s</result>' % fact()[factoid]
