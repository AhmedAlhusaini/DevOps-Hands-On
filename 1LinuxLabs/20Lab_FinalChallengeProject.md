# 🧪 Lab: Final Challenge Project

## 📝 Task

> Combine multiple skills in a comprehensive task:
> - Create a directory structure for a web project  
> - Write a simple HTML file using `nano`  
> - Set appropriate permissions for web files  
> - Create a backup script that archives your project  
> - Document the process in a `README.md` file  
> - Test all functionality you’ve implemented  

---

## ✅ Steps

1. **Set up directory hierarchy**  
   - Run `mkdir -p ~/web_project/{html,css,js,backup,scripts}` to create folders.  

2. **Create your HTML entrypoint**  
   - Open `html/index.html` in `nano`:  
     ```bash
     nano ~/web_project/html/index.html
     ```  
   - Add a minimal HTML5 template linking to `css/style.css` and `js/app.js`.  

3. **Adjust file permissions**  
   - Apply read-only for static files:  
     ```bash
     chmod -R 644 ~/web_project/html
     ```  
   - Ensure scripts and assets are executable/readable:  
     ```bash
     chmod -R 755 ~/web_project/css ~/web_project/js
     ```  

4. **Develop the backup script**  
   - Open `scripts/backup.sh` in `nano` and add a shebang plus logic to:  
     - Create `backup/` if missing  
     - Generate a timestamped archive of the project  
     - Echo the archive path on success  
   - Make it runnable:  
     ```bash
     chmod +x ~/web_project/scripts/backup.sh
     ```  

5. **Write project documentation**  
   - Open `README.md` in `nano`:  
     ```bash
     nano ~/web_project/README.md
     ```  
   - Outline: overview, directory layout, setup steps, backup instructions, and testing procedures.  

6. **Verify functionality**  
   - Run the backup script:  
     ```bash
     ~/web_project/scripts/backup.sh
     ```  
   - Confirm an archive appears under `backup/`.  
   - View your HTML file:  
     ```bash
     cat ~/web_project/html/index.html
     ```  
   - List directory permissions to ensure they match your `chmod` settings.  

---

## 💡 Bonus

- Automate nightly backups via a `cron` entry.  
- Prune archives older than 7 days in your script.  
- Study Well 
- Study Well 
- Study Well 
- Study Well 

---

## 💻 Command(s)

```bash


[devops_ninja@Ahmed-Hossainy ~]$ ls
ahmed  archive.tar.gz  Backup  demo_backup  demo_src  logscript.sh  my_projects  script.sh  system_info.sh
[devops_ninja@Ahmed-Hossainy ~]$ mkdir -p ~/web_project/{html,css,js,backup,scripts}
[devops_ninja@Ahmed-Hossainy ~]$ tree
.
├── ahmed
│   └── ahmedd.txt
├── archive.tar.gz
├── Backup
│   └── my_projects
│       ├── file1different.txt
│       ├── file2different.txt
│       ├── file3different.txt
│       ├── file4different.txt
│       └── file5different.txt
├── demo_backup
│   ├── file1.txt
│   ├── file2.txt
│   └── file3.txt
├── demo_src
│   ├── file1.txt
│   ├── file2.txt
│   └── file3.txt
├── logscript.sh
├── my_projects
│   ├── file1different.txt
│   ├── file2different.txt
│   ├── file3different.txt
│   ├── file4different.txt
│   └── file5different.txt
├── script.sh
├── system_info.sh
└── web_project
    ├── backup
    ├── css
    ├── html
    ├── js
    └── scripts

13 directories, 21 files
[devops_ninja@Ahmed-Hossainy ~]$ nano ~/web_project/html/index.html
[devops_ninja@Ahmed-Hossainy ~]$ cat ~/web_project/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello Linux</title>
</head>
<body style="font-family: Arial; text-align: center; margin-top: 50px;">
    <h1>Hello Linux</h1>
    <h2>Ahmed Alhusainy</h2>
    <p>DEPI DevOps Student</p>
</body>
</html>
[devops_ninja@Ahmed-Hossainy ~]$ nano ~/web_project/html/index.html
[devops_ninja@Ahmed-Hossainy ~]$ nano ~/web_project/html/index.html
[devops_ninja@Ahmed-Hossainy ~]$ cat ~/web_project/html/index.html

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Graduation Project</title>
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>
  <h1>Hello Linux -Welcome to My Project Portfolio</h1>
    <h1>Hello Linux</h1>
    <h2>Ahmed Alhusainy</h2>
    <p>DEPI DevOps Student</p>
  <script src="../js/app.js"></script>
</body>
</html>
[devops_ninja@Ahmed-Hossainy ~]$ chmod -R 644 ~/web_project/html
chmod -R 755 ~/web_project/css ~/web_project/js
chmod: cannot access '/home/devops_ninja/web_project/html/index.html': Permission denied
[devops_ninja@Ahmed-Hossainy ~]$ sudo chmod -R 755 ~/web_project/css ~/web_project/js
[sudo] password for devops_ninja:
[devops_ninja@Ahmed-Hossainy ~]$ sudo chmod -R 644 ~/web_project/html
sudo chmod -R 755 ~/web_project/css ~/web_project/js
[devops_ninja@Ahmed-Hossainy ~]$
[devops_ninja@Ahmed-Hossainy ~]$ lm
  688 .      18977 archive.tar.gz  49296 .bash_logout    814 .config      49274 .landscape  12467 logscript.sh   1234 .profile                    1672 system_info.sh  47447 .Xauthority
24577 ..      1684 Backup          49304 .bashrc        1899 demo_backup  11558 .lesshst    49316 .motd_shown   14645 script.sh                   3866 .viminfo
49339 ahmed  49319 .bash_history   49306 .cache         1655 demo_src     49354 .local       3623 my_projects   49323 .sudo_as_admin_successful  10836 web_project
[devops_ninja@Ahmed-Hossainy ~]$ tree
.
├── ahmed
│   └── ahmedd.txt
├── archive.tar.gz
├── Backup
│   └── my_projects
│       ├── file1different.txt
│       ├── file2different.txt
│       ├── file3different.txt
│       ├── file4different.txt
│       └── file5different.txt
├── demo_backup
│   ├── file1.txt
│   ├── file2.txt
│   └── file3.txt
├── demo_src
│   ├── file1.txt
│   ├── file2.txt
│   └── file3.txt
├── logscript.sh
├── my_projects
│   ├── file1different.txt
│   ├── file2different.txt
│   ├── file3different.txt
│   ├── file4different.txt
│   └── file5different.txt
├── script.sh
├── system_info.sh
└── web_project
    ├── backup
    ├── css
    ├── html
    ├── js
    └── scripts

13 directories, 21 files
[devops_ninja@Ahmed-Hossainy ~]$ cd web_project/html/
-bash: cd: web_project/html/: Permission denied
[devops_ninja@Ahmed-Hossainy ~]$ sudo cd web_project/html/
sudo: cd: command not found
sudo: "cd" is a shell built-in command, it cannot be run directly.
sudo: the -s option may be used to run a privileged shell.
sudo: the -D option may be used to run a command in a specific directory.
[devops_ninja@Ahmed-Hossainy ~]$ sudo chmod -R 744 ~/web_project/html
[devops_ninja@Ahmed-Hossainy ~]$ sudo cd web_project/html/
sudo: cd: command not found
sudo: "cd" is a shell built-in command, it cannot be run directly.
sudo: the -s option may be used to run a privileged shell.
sudo: the -D option may be used to run a command in a specific directory.
[devops_ninja@Ahmed-Hossainy ~]$ cd web_project/
[devops_ninja@Ahmed-Hossainy web_project]$ ;s
-bash: syntax error near unexpected token `;'
[devops_ninja@Ahmed-Hossainy web_project]$ ls
backup  css  html  js  scripts
[devops_ninja@Ahmed-Hossainy web_project]$ cd html/
[devops_ninja@Ahmed-Hossainy html]$ ls
index.html
[devops_ninja@Ahmed-Hossainy html]$ cd ~
[devops_ninja@Ahmed-Hossainy ~]$ ls
ahmed  archive.tar.gz  Backup  demo_backup  demo_src  logscript.sh  my_projects  script.sh  system_info.sh  web_project
[devops_ninja@Ahmed-Hossainy ~]$ cd web_project/
[devops_ninja@Ahmed-Hossainy web_project]$ touch scripts/backup.sh
[devops_ninja@Ahmed-Hossainy web_project]$ chmod +x scripts/backup.sh
[devops_ninja@Ahmed-Hossainy web_project]$ nano scripts/backup.sh
[devops_ninja@Ahmed-Hossainy web_project]$ nano ~/web_project/README.md
[devops_ninja@Ahmed-Hossainy web_project]$ cd scripts/
[devops_ninja@Ahmed-Hossainy scripts]$ ls
backup.sh
[devops_ninja@Ahmed-Hossainy scripts]$ ./backup.sh
web_project/
web_project/css/
web_project/backup/
web_project/backup/web_project_20250725_1540.tar.gz
web_project/README.md
web_project/html/
web_project/html/index.html
web_project/scripts/
web_project/scripts/backup.sh
web_project/js/
Backup created at /home/devops_ninja/web_project/backup/web_project_20250725_1540.tar.gz
[devops_ninja@Ahmed-Hossainy scripts]$ cd ..
[devops_ninja@Ahmed-Hossainy web_project]$ cd backup/
[devops_ninja@Ahmed-Hossainy backup]$ ls
web_project_20250725_1540.tar.gz
[devops_ninja@Ahmed-Hossainy backup]$


