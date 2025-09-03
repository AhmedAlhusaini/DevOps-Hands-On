#!/bin/bash

# This script demonstrates basic Git commands and their output

# Check Git version
echo "Checking Git version..."
git --version
git config --list
git config --global user.name "Ahmed Tarek Alhusainy"

# Initialize a new Git repository
echo "Initializing a new Git repository..."
git init my-first-repo
cd my-first-repo

ls -ial 

# Create a new file and add some content
echo "Creating a new file..."
echo "Hello, Git!" > hello.txt
touch README.md

echo -e "# TThis is a test repo for Lab 1 Git Basics" >> README.md
echo -e "$(git config --list)" >> README.md
git config --list >> README.md

cat README.md
Cat hello.txt  

# Check the status of the repository
echo "Checking the status of the repository..."
git status

# Add the new file to the staging area
echo "Adding the new file to the staging area..."
git add .

# Commit the changes
echo "Committing the changes..."
git commit -m "Initial commit"

# Show the commit history
echo "Showing the commit history..."
git log --oneline


# Clean up
echo "Cleaning up..."
cd ..
rm -rf my-repo

############################Output#####
C:\Users\ahmed.elhossainy
λ git config --list
diff.astextplain.textconv=astextplain
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
http.sslbackend=openssl
http.sslcainfo=C:/Program Files/Git/mingw64/etc/ssl/certs/ca-bundle.crt
core.autocrlf=true
core.fscache=true
core.symlinks=false
pull.rebase=false
credential.helper=manager
credential.https://dev.azure.com.usehttppath=true
init.defaultbranch=master
credential.helperselector.selected=wincred
user.name=John Doe
user.email=ahmdlhoseny@gmail.com

C:\Users\ahmed.elhossainy
λ git config --global user.name "Ahmed Tarek Alhusainy"

C:\Users\ahmed.elhossainy
λ git config --list
diff.astextplain.textconv=astextplain
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
http.sslbackend=openssl
http.sslcainfo=C:/Program Files/Git/mingw64/etc/ssl/certs/ca-bundle.crt
core.autocrlf=true
core.fscache=true
core.symlinks=false
pull.rebase=false
credential.helper=manager
credential.https://dev.azure.com.usehttppath=true
init.defaultbranch=master
credential.helperselector.selected=wincred
user.name=Ahmed Tarek Alhusainy
user.email=ahmdlhoseny@gmail.com

C:\Users\ahmed.elhossainy
λ cd /d "D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On"

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On (main)
λ cd 4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo\

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (main)
λ git init
Initialized empty Git repository in D:/Enterprise Solutions/01 CloudAndDevOps/DevOps/DevOps-Hands-On/4Git-GitHub/Labs/1Lab_GITBasics/my-first-repo/.git/

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ ls

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ ls -ial
total 0
1586674443717970864 drwxr-xr-x 1 ahmed.elhossainy 1049089 0 Sep  3 09:36 ./
3879288129026263947 drwxr-xr-x 1 ahmed.elhossainy 1049089 0 Sep  3 09:33 ../
  16888498602642741 drwxr-xr-x 1 ahmed.elhossainy 1049089 0 Sep  3 09:36 .git/

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ touch "README.md"

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ ls -ial
total 0
1586674443717970864 drwxr-xr-x 1 ahmed.elhossainy 1049089 0 Sep  3 09:36 ./
3879288129026263947 drwxr-xr-x 1 ahmed.elhossainy 1049089 0 Sep  3 09:33 ../
  16888498602642741 drwxr-xr-x 1 ahmed.elhossainy 1049089 0 Sep  3 09:36 .git/
    562949953425556 -rw-r--r-- 1 ahmed.elhossainy 1049089 0 Sep  3 09:36 README.md

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ echo -e "# THis is a test repo for Lab 1 Git Basicss" >> README.md

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ cat README.md
-e "# THis is a test repo for Lab 1 Git Basicss"

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ echo -e "$(git config --list)" >> README.md

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ cat README.md
-e "# THis is a test repo for Lab 1 Git Basicss"
-e "$(git config --list)"

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ git config --list >> README.md

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ cat README.md
-e "# THis is a test repo for Lab 1 Git Basicss"
-e "$(git config --list)"
diff.astextplain.textconv=astextplain
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
http.sslbackend=openssl
http.sslcainfo=C:/Program Files/Git/mingw64/etc/ssl/certs/ca-bundle.crt
core.autocrlf=true
core.fscache=true
core.symlinks=false
pull.rebase=false
credential.helper=manager
credential.https://dev.azure.com.usehttppath=true
init.defaultbranch=master
credential.helperselector.selected=wincred
user.name=Ahmed Tarek Alhusainy
user.email=ahmdlhoseny@gmail.com
core.repositoryformatversion=0
core.filemode=false
core.bare=false
core.logallrefupdates=true
core.symlinks=false
core.ignorecase=true

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ
D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        README.md

nothing added to commit but untracked files present (use "git add" to track)

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ git add README.md
warning: in the working copy of 'README.md', LF will be replaced by CRLF the next time Git touches it

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ git commit -m "Initial Commit"
[master (root-commit) 1b05768] Initial Commit
 1 file changed, 25 insertions(+)
 create mode 100644 README.md

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ git status
On branch master
nothing to commit, working tree clean

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ git log --oneline
1b05768 (HEAD -> master) Initial Commit

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ git log
commit 1b05768c6ef98f457ded27c60a0e3ef13ffb328a (HEAD -> master)
Author: Ahmed Tarek Alhusainy <ahmdlhoseny@gmail.com>
Date:   Wed Sep 3 09:41:09 2025 +0300

    Initial Commit

D:\Enterprise Solutions\01 CloudAndDevOps\DevOps\DevOps-Hands-On\4Git-GitHub\Labs\1Lab_GITBasics\my-first-repo (master)
λ git show 1b05
commit 1b05768c6ef98f457ded27c60a0e3ef13ffb328a (HEAD -> master)
Author: Ahmed Tarek Alhusainy <ahmdlhoseny@gmail.com>
Date:   Wed Sep 3 09:41:09 2025 +0300

    Initial Commit

diff --git a/README.md b/README.md
new file mode 100644
index 0000000..93be828
--- /dev/null
+++ b/README.md
@@ -0,0 +1,25 @@
+-e "# THis is a test repo for Lab 1 Git Basicss"
+-e "$(git config --list)"
+diff.astextplain.textconv=astextplain
+filter.lfs.clean=git-lfs clean -- %f
+filter.lfs.smudge=git-lfs smudge -- %f
+filter.lfs.process=git-lfs filter-process
+filter.lfs.required=true
+http.sslbackend=openssl
+http.sslcainfo=C:/Program Files/Git/mingw64/etc/ssl/certs/ca-bundle.crt
+core.autocrlf=true
+core.fscache=true
+core.symlinks=false
+pull.rebase=false
+credential.helper=manager
+credential.https://dev.azure.com.usehttppath=true
+init.defaultbranch=master
+credential.helperselector.selected=wincred
+user.name=Ahmed Tarek Alhusainy
+user.email=ahmdlhoseny@gmail.com
+core.repositoryformatversion=0
+core.filemode=false
+core.bare=false
+core.logallrefupdates=true
+core.symlinks=false
+core.ignorecase=true
