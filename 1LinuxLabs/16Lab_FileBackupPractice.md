# 🧪 Lab: File Backup Practice

## 📝 Task

> Create a backup strategy for your files:
> - Create a backup directory in your home folder  
> - Copy all files from your `projects` directory to the backup directory  
> - Create a compressed archive of your important files  
> - Practice restoring files from your backup  

---

## ✅ Steps

1. Create `~/backup` directory.  
2. Copy everything under `~/projects` into `~/backup/projects`.  
3. Create a compressed archive (`.tar.gz`) of `~/backup` or selected important files.  
4. Simulate data loss by moving or deleting an original file.  
5. Restore from the archive back to the original location.  

---

## 💡 Bonus

- Use `rsync -a` instead of `cp` for incremental backups.  
- Automate with a timestamped archive name:  

---

## 💻 Command(s)

  ```bash
  
devops_ninja@Ahmed-Hossainy:/home$ ls
devops_ninja  error.txt  Hard-Soft-Link
devops_ninja@Ahmed-Hossainy:/home$ cd devops_ninja/
devops_ninja@Ahmed-Hossainy:~$ ls
ahmed  ForExtract  my_projects  projecs.tar.gz  script.sh  system_info.sh
devops_ninja@Ahmed-Hossainy:~$ mkdir Backup
devops_ninja@Ahmed-Hossainy:~$ cp -r my_projects Backup
devops_ninja@Ahmed-Hossainy:~$ tree
.
├── ahmed
│   └── ahmedd.txt
├── Backup
│   └── my_projects
│       ├── file1different.txt
│       ├── file2different.txt
│       ├── file3different.txt
│       ├── file4different.txt
│       └── file5different.txt
├── ForExtract
│   └── my_projects
│       ├── file1different.txt
│       ├── file2different.txt
│       ├── file3different.txt
│       ├── file4different.txt
│       └── file5different.txt
├── my_projects
│   ├── file1different.txt
│   ├── file2different.txt
│   ├── file3different.txt
│   ├── file4different.txt
│   └── file5different.txt
├── projecs.tar.gz
├── script.sh
└── system_info.sh

7 directories, 19 files
devops_ninja@Ahmed-Hossainy:~$ tar -czvf archive.tar.gz my_projects
my_projects/
my_projects/file4different.txt
my_projects/file3different.txt
my_projects/file5different.txt
my_projects/file2different.txt
my_projects/file1different.txt
devops_ninja@Ahmed-Hossainy:~$ ls
ahmed  archive.tar.gz  Backup  ForExtract  my_projects  projecs.tar.gz  script.sh  system_info.sh
devops_ninja@Ahmed-Hossainy:~$ rmdir my_projects/
rmdir: failed to remove 'my_projects/': Directory not empty
devops_ninja@Ahmed-Hossainy:~$ rmdir -rf my_projects/
rmdir: invalid option -- 'r'
Try 'rmdir --help' for more information.
devops_ninja@Ahmed-Hossainy:~$ rm -r my_projects/
devops_ninja@Ahmed-Hossainy:~$ ls
ahmed  archive.tar.gz  Backup  ForExtract  projecs.tar.gz  script.sh  system_info.sh
devops_ninja@Ahmed-Hossainy:~$ tar -xvf archive.tar.gz .
tar: .: Not found in archive
tar: Exiting with failure status due to previous errors
devops_ninja@Ahmed-Hossainy:~$ tar -xvf archive.tar.gz
my_projects/
my_projects/file4different.txt
my_projects/file3different.txt
my_projects/file5different.txt
my_projects/file2different.txt
my_projects/file1different.txt
devops_ninja@Ahmed-Hossainy:~$ ls
ahmed  archive.tar.gz  Backup  ForExtract  my_projects  projecs.tar.gz  script.sh  system_info.sh
devops_ninja@Ahmed-Hossainy:~$
