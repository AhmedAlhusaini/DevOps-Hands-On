#!/usr/bin/bash
# 1. Create a backup directory
mkdir -p ~/backup

# 2. Copy projects into the backup folder
cp -r ~/projects ~/backup/

# 3. Create a compressed archive of the backup directory
tar czvf ~/backup.tar.gz -C ~ backup

# 4. Simulate data loss (e.g., remove one file)
rm ~/projects/file1.txt

# 5. Restore files from the archive
tar xzvf ~/backup.tar.gz -C ~


# Bonus Lab A: Incremental Backups with rsync

# 1. Prepare a source folder
mkdir -p ~/demo_src
echo "Hello" > ~/demo_src/file1.txt
echo "World" > ~/demo_src/file2.txt

# 2. Create an initial backup
mkdir -p ~/demo_backup
rsync -a ~/demo_src/ ~/demo_backup/

# 3. Modify the source folder
echo "!" >> ~/demo_src/file1.txt
echo "New file" > ~/demo_src/file3.txt

# 4. Run rsync again to sync only changes
rsync -a --delete ~/demo_src/ ~/demo_backup/

# 5. Verify backup contents
ls ~/demo_backup
cat ~/demo_backup/file1.txt

# ------------------------------------------------------------
# Bonus Lab B: Timestamped Archives

# 1. Prepare a folder to archive
mkdir -p ~/demo_archive
echo "Archive me" > ~/demo_archive/item.txt

# 2. Create a dated archive of the folder
tar czvf backup-$(date +%Y%m%d).tar.gz -C ~ demo_archive

# 3. List generated archive files
ls backup-*.tar.gz

# 4. Inspect archive contents without extracting
tar tzvf backup-$(date +%Y%m%d).tar.gz

# 5. Extract the archive to test restoration
mkdir -p ~/demo_restore
tar xzvf backup-$(date +%Y%m%d).tar.gz -C ~/demo_restore	

# 6. Verify extracted files
ls ~/demo_restore/demo_archive
