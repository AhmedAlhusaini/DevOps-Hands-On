# 🧪 Lab: Package Management

## 📝 Task

> Practice installing and managing software:
> - Update your package list  
> - Search for a package called `tree` in the package manager  
> - Install the `tree` package  
> - Use the `tree` command to display your directory structure  
> - Check if the `tree` package is installed  

---

## ✅ Steps

1. Refresh your system’s package index.  
2. Search for the `tree` package by name.  
3. Install `tree` if it’s not already present.  
4. Run `tree` to visualize your current directory hierarchy.  
5. Verify the installation status of `tree`.  

---

## 💡 Bonus

- Use `apt-cache policy tree` to see available versions and candidate releases.  
- Try `apt install --download-only tree` to fetch the package without installing.  
- Explore holding a package at its current version: `sudo apt-mark hold tree`.  
- As a senior admin tip: enable `unattended-upgrades` to auto-update security patches.  

---

## 💻 Command(s)

```bash
ubuntu@UbuntUmachine:~$ sudo apt update 
ubuntu@UbuntUmachine:~$ apt --help
ubuntu@UbuntUmachine:~$ sudo apt search tree
ubuntu@UbuntUmachine:~$ which tree
/usr/bin/tree
ubuntu@UbuntUmachine:~$ tree 
ubuntu@UbuntUmachine:~$ tree  --version
.
├── Shopping_list.txt
├── hello.sh
├── my_projects
│   ├── Ahmed
│   │   └── nested
│   │       └── subnested
│   ├── backup
│   ├── documents
│   │   ├── intro.txt
│   │   └── readme.txt
│   ├── example.txt
│   └── scripts
├── new.sh
├── new.txt
├── newnew.sh
└── secret.txt

7 directories, 10 files

devops_ninja@Ahmed-Hossainy:~$ apt-cache policy tree
tree:
  Installed: 2.1.1-2ubuntu3
  Candidate: 2.1.1-2ubuntu3
  Version table:
 *** 2.1.1-2ubuntu3 500
        500 http://archive.ubuntu.com/ubuntu noble/universe amd64 Packages
        100 /var/lib/dpkg/status
devops_ninja@Ahmed-Hossainy:~$
