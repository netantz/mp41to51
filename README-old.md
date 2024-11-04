# mp41to51

# !!! Important: Use at your own risk !!!

This does not work for MP41 Refurbished mode running firmware: MP41.0081.B08

Instructions for manually updating Mac Pro 4,1 firmware to Mac Pro 5,1 firmware.

Tested on 2 units of MP4,1, single processor model with FW: MP41.0081.B07 running MacOS El Capitan 10.11

- md5 of files

```
a2207b352bfb5d7c3377f3877f553de8  EfiUpdaterApp2.efi
8c7eefa9ec6c85654cb166b45afb7ca0  MP41_0081_07B_LOCKED.fd
```

- Boot into Recovery mode and disable System Integrity Protection (SIP) by command

```csrutil disable```

- Reboot again into MacOS

- Create a folder to store patched MP41 UpdaterApp and MP51 firmware (renamed to MP41)

```
UPDATE_DIR="/System/Library/CoreServices/Firmware Updates/MacProEFIUpdate15"
sudo mkdir "$UPDATE_DIR"
```

NOTE: Not sure if this folder can be anywhere. If so, there is no need to copy the following two files around.

```
# Patched MP41 UpdaterApp that accept MP51's Firmware
FW_UPDATER="EfiUpdaterApp2.efi"

# This is original MP5.1 Firmware from Apple but renamed to fool MP41's UpdaterApp
# MP51 FW version: MP51.007F.B03, original file name: MP51_007F_03B_LOCKED.fd
FW_NAME="MP41_0081_07B_LOCKED.fd"

# Copy both files to $UPDATE_DIR
cp "$FW_UPDATER" "$UPDATE_DIR"
cp "$FW_NAME" "$UPDATE_DIR"
```

- Install the MP41UpdaterApp
```
sudo /usr/sbin/bless -mount / -firmware "$UPDATE_DIR/$FW_UPDATER" -payload "$UPDATE_DIR/$FW_NAME" -options "-x efi-apple-payload0-data" --verbose
```

- You should see no error from **bless** commnad. If you see error, most likely **csrutil disable** step is not done properly.

- Reboot and hold power button until the power LED is flashing. Release button and MacPro should beep and show screen updating firmware.

- When finished, Mac Pro will reboot automatically.




