#!/bin/bash
# Lab 17: Network File Transfer Script

# 1. Download a sample file using wget
#    Replace the URL below with any valid file link
wget https://gisoverflow.com -O ~/sample.txt

# 2. Fetch only HTTP headers of a website using curl
curl -I https://gisoverflow.com

# 3. Create a simple text file
echo "This is a test file for network transfer." > ~/testfile.txt

# 4. Move the text file between directories
#    Create a destination directory if it doesn't exist
mkdir -p ~/transfer_dest
#    Move the file into that directory
mv ~/testfile.txt ~/transfer_dest/

# 5. Check file sizes before and after operations
#    Size of the downloaded file
stat -c 'Size of sample.txt: %s bytes' ~/sample.txt
#    Size of the moved file
stat -c 'Size of transfer_dest/testfile.txt: %s bytes' ~/transfer_dest/testfile.txt

# Bonus: Use rsync for file transfer verification
#    Create a backup directory and sync with progress display
mkdir -p ~/transfer_backup
rsync -av --progress ~/transfer_dest/ ~/transfer_backup/

###Key takeaway: file size is purely a function of how many bytes of data the file contains. Different content ⇒ different size. Moving or copying (on the same disk) doesn’t alter that.
