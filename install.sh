#!/bin/bash
#
# MD5 of files
# a2207b352bfb5d7c3377f3877f553de8  EfiUpdaterApp2.efi
# 8c7eefa9ec6c85654cb166b45afb7ca0  MP41_0081_07B_LOCKED.fd
#
# Steps:
#
# 1. Boot into Recovery mode and disable System Integrity Protection (SIP) by command
#
#    csrutil disable
#
# 2. Reboot again into MacOS
#
# 3. Run the folowing
#
sudo /usr/sbin/bless -mount / -firmware EfiUpdaterApp2.efi -payload MP41_0081_07B_LOCKED.fd -options "-x efi-apple-payload0-data" --verbose
#
# 4. Power off, press and hold power button until the power led flash rapidly
#
# 5. Release power botton, it should make some some
#
# 6. A bigger than usual Apple logo should show up and firmware will be updated
#
# 7. If The Apple logo show up only for a second and follow by a reboot, check existing firmware. If it's "MP41.0081.B08", it won't work.
#

