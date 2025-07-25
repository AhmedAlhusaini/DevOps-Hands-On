# 🧪 Lab: Creating Files and Directories

## 📝 Task

> Create a project directory structure to organize your work:
> - Create a directory called `my_projects`  
> - Navigate into `my_projects`  
> - Create subdirectories `documents`, `scripts`, and `backup`  
> - Create an empty file `readme.txt` inside `documents`  
> - Display the tree view of your new structure  

---

## ✅ Steps

1. Make the main project directory.  
2. Change into that directory.  
3. Create the three subdirectories.  
4. Create the empty file in the `documents` folder.  
5. Show the directory tree to confirm your structure.  

---

## 💡 Bonus

- Use `mkdir -p` to create multiple nested dirs in one command.   
- Try `touch -t YYYYMMDDHHMM documents/readme.txt` to timestamp the file.  
- If `tree` isn’t installed, use `find . -maxdepth 2 -print` or `ls -R`.  
- As a senior admin tip: add a `.gitkeep` in `backup/` so it’s tracked by Git even when empty.  

---

## 💻 Command(s)

```bash

ubuntu@UbuntUmachine:~$ mkdir my_projects
ubuntu@UbuntUmachine:~$ ls
my_projects
ubuntu@UbuntUmachine:~$ cd my_projects/
ubuntu@UbuntUmachine:~/my_projects$ touch documents scripts backup
ubuntu@UbuntUmachine:~/my_projects$ touch documents/readme.txt
touch: cannot touch 'documents/readme.txt': Not a directory
ubuntu@UbuntUmachine:~/my_projects$ cd .. && touch documents/readme.txt
touch: cannot touch 'documents/readme.txt': No such file or directory
ubuntu@UbuntUmachine:~$ ls
my_projects
ubuntu@UbuntUmachine:~$ cd my_projects
ubuntu@UbuntUmachine:~/my_projects$ ls
backup  documents  scripts
ubuntu@UbuntUmachine:~/my_projects$ file documents
documents: empty
ubuntu@UbuntUmachine:~/my_projects$ rm *
ubuntu@UbuntUmachine:~/my_projects$ mkdir documents scripts backup
ubuntu@UbuntUmachine:~/my_projects$ ls
backup  documents  scripts
ubuntu@UbuntUmachine:~/my_projects$ touch documents/readme.txt
ubuntu@UbuntUmachine:~/my_projects$ tree
.
├── backup
├── documents
│   └── readme.txt
└── scripts

4 directories, 1 file


ubuntu@UbuntUmachine:~/my_projects$ mkdir -p Ahmed/nested/subnested
ubuntu@UbuntUmachine:~/my_projects$ tree
.
├── Ahmed
│   └── nested
│       └── subnested
├── backup
├── documents
│   └── readme.txt
└── scripts

7 directories, 1 file
ubuntu@UbuntUmachine:~/my_projects$ touch -t YYMMDDHH Ahmed/timestampFile.txt
touch: invalid date format ‘YYMMDDHH’
ubuntu@UbuntUmachine:~/my_projects$ touch -t YYYYMMDDHH Ahmed/timestampFile.txt
touch: invalid date format ‘YYYYMMDDHH’
ubuntu@UbuntUmachine:~/my_projects$ touch --help
ubuntu@UbuntUmachine:~/my_projects$ touch -t YYYYMMDDhhmm Ahmed/timestampFile.txt
touch: invalid date format ‘YYYYMMDDhhmm’
ubuntu@UbuntUmachine:~/my_projects$ touch -t 202507201545 example.txt
ubuntu@UbuntUmachine:~/my_projects$ tree
.
├── Ahmed
│   └── nested
│       └── subnested
├── backup
├── documents
│   └── readme.txt
├── example.txt
└── scripts

7 directories, 2 files
ubuntu@UbuntUmachine:~/my_projects$ cat example.txt
ubuntu@UbuntUmachine:~/my_projects$ ll
total 24
drwxrwxr-x 6 ubuntu ubuntu 4096 Jul 24 14:11 ./
drwxr-x--- 7 ubuntu ubuntu 4096 Jul 24 13:55 ../
drwxrwxr-x 3 ubuntu ubuntu 4096 Jul 24 14:07 Ahmed/
drwxrwxr-x 2 ubuntu ubuntu 4096 Jul 24 13:58 backup/
drwxrwxr-x 2 ubuntu ubuntu 4096 Jul 24 13:59 documents/
-rw-rw-r-- 1 ubuntu ubuntu    0 Jul 20 15:45 example.txt
drwxrwxr-x 2 ubuntu ubuntu 4096 Jul 24 13:58 scripts/
ubuntu@UbuntUmachine:~/my_projects$ ls -l example.txt
-rw-rw-r-- 1 ubuntu ubuntu 0 Jul 20 15:45 example.txt
ubuntu@UbuntUmachine:~/my_projects$ ls -l --full-time example.txt
# -rw-r--r-- 1 you you 0 2025-07-20 15:45:00.000000000 +0200 example.txt
-rw-rw-r-- 1 ubuntu ubuntu 0 2025-07-20 15:45:00.000000000 +0000 example.txt
ubuntu@UbuntUmachine:~/my_projects$ date -r example.txt
Sun Jul 20 15:45:00 UTC 2025

