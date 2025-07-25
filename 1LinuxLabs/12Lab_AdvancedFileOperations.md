# 🧪 Lab: Advanced File Operations

## 📝 Task

> Work with file searching and manipulation:
> - Create 5 text files with different names in your projects directory  
> - Find all `.txt` files in your home directory and subdirectories  
> - Create a compressed archive of your projects directory  
> - Extract the archive to a new location  
> - Compare the original and extracted directories  

---

## ✅ Steps

1. Navigate to your `projects` directory and create five `.txt` files.  
2. Use `find` to locate all `.txt` files under your home folder.  
3. Compress the entire `projects` directory into a single archive (e.g., `.tar.gz`).  
4. Extract that archive into a new directory.  
5. Use a directory comparison tool to verify the contents match.  

---

## 💡 Bonus

- Study Well
- Study Well 
- Study Well 


```bash 
devops_ninja@Ahmed-Hossainy:/home$ ls
devops_ninja  error.txt  Hard-Soft-Link
devops_ninja@Ahmed-Hossainy:/home$ cd devops_ninja/
devops_ninja@Ahmed-Hossainy:~$ ls
ahmed  index.html  index.html.1  index.html.2  script.sh  webpage.html
devops_ninja@Ahmed-Hossainy:~$ mkdir my_projects
devops_ninja@Ahmed-Hossainy:~$ touch my_projects/file{1..5}different.txt
devops_ninja@Ahmed-Hossainy:~$ tree
.
├── ahmed
│   └── ahmedd.txt
├── index.html
├── index.html.1
├── index.html.2
├── my_projects
│   ├── file1different.txt
│   ├── file2different.txt
│   ├── file3different.txt
│   ├── file4different.txt
│   └── file5different.txt
├── script.sh
└── webpage.html

3 directories, 11 files

devops_ninja@Ahmed-Hossainy:~$ man find
devops_ninja@Ahmed-Hossainy:~$ find -name *.txt /home/
find: paths must precede expression: `/home/'
find: possible unquoted pattern after predicate `-name'?
devops_ninja@Ahmed-Hossainy:~$ find -name '*.txt' /home/
find: paths must precede expression: `/home/'
find: possible unquoted pattern after predicate `-name'?
devops_ninja@Ahmed-Hossainy:~$ find ~ -type f -name "*.txt"
/home/devops_ninja/ahmed/ahmedd.txt
/home/devops_ninja/my_projects/file4different.txt
/home/devops_ninja/my_projects/file3different.txt
/home/devops_ninja/my_projects/file5different.txt
/home/devops_ninja/my_projects/file2different.txt
/home/devops_ninja/my_projects/file1different.txt


devops_ninja@Ahmed-Hossainy:~$ ls
ahmed  index.html  index.html.1  index.html.2  my_projects  script.sh  webpage.html
devops_ninja@Ahmed-Hossainy:~$ tar -czvf projecs.tar.gz my_projects
my_projects/
my_projects/file4different.txt
my_projects/file3different.txt
my_projects/file5different.txt
my_projects/file2different.txt
my_projects/file1different.txt


devops_ninja@Ahmed-Hossainy:~$ mkdir ForExtract
devops_ninja@Ahmed-Hossainy:~$ ls
ahmed  ForExtract  index.html  index.html.1  index.html.2  my_projects  projecs.tar.gz  script.sh  webpage.html
devops_ninja@Ahmed-Hossainy:~$ tar -xf projecs.tar.gz /ForExtract
tar: /ForExtract: Not found in archive
tar: Exiting with failure status due to previous errors
devops_ninja@Ahmed-Hossainy:~$ tar -xf projecs.tar.gz -C ForExtract
devops_ninja@Ahmed-Hossainy:~$ tree
.
├── ahmed
│   └── ahmedd.txt
├── ForExtract
│   └── my_projects
│       ├── file1different.txt
│       ├── file2different.txt
│       ├── file3different.txt
│       ├── file4different.txt
│       └── file5different.txt
├── index.html
├── index.html.1
├── index.html.2
├── my_projects
│   ├── file1different.txt
│   ├── file2different.txt
│   ├── file3different.txt
│   ├── file4different.txt
│   └── file5different.txt
├── projecs.tar.gz
├── script.sh
└── webpage.html

5 directories, 17 files

devops_ninja@Ahmed-Hossainy:~$ diff -r ./my_projects/ ./ForExtract/
Only in ./my_projects/: file1different.txt
Only in ./my_projects/: file2different.txt
Only in ./my_projects/: file3different.txt
Only in ./my_projects/: file4different.txt
Only in ./my_projects/: file5different.txt
Only in ./ForExtract/: my_projects
devops_ninja@Ahmed-Hossainy:~$ diff -r ./my_projects/ ./ForExtract/my_projects/
devops_ninja@Ahmed-Hossainy:~$



