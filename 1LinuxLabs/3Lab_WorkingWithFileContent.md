# 🧪 Lab: Working with File Content

## 📝 Task

> Practice viewing and editing file content:
> - Navigate to your documents folder  
> - Create a file called `intro.txt` using the `touch` command  
> - Use `nano` to edit the file and add 3 lines of text about yourself  
> - Save and exit `nano`  
> - Display the entire content of the file using `cat`  
> - Display the content page by page using `less`  

---

## ✅ Steps

1. Change directory to your Documents folder.  
2. Create `intro.txt` with `touch`.  
3. Open `intro.txt` in `nano`.  
4. Add three descriptive lines, then save and exit (`Ctrl+O`, `Enter`, `Ctrl+X`).  
5. Use `cat intro.txt` to view all content.  
6. Use `less intro.txt` to page through the file.  

---

## 💡 Bonus

- Use `head -n3 intro.txt` to show just the first three lines.  
- Try `nano --linenumbers intro.txt` to display line numbers while editing.  
---

## 💻 Command(s)

```bash

ubuntu@UbuntUmachine:~/my_projects/documents$ ls
readme.txt
ubuntu@UbuntUmachine:~/my_projects/documents$ touch intro.txt && ( echo "I am Ahmed Alhusainy" ; echo " I am Studying Devops " ) >> intro.txt
ubuntu@UbuntUmachine:~/my_projects/documents$ tree
.
├── intro.txt
└── readme.txt

1 directory, 2 files
ubuntu@UbuntUmachine:~/my_projects/documents$ cat intro.txt
I am Ahmed Alhusainy
 I am Studying Devops

ubuntu@UbuntUmachine:~/my_projects/documents$ echo -e "\nI Need To Add A New Line By echo" >> intro.txt
ubuntu@UbuntUmachine:~/my_projects/documents$ cat intro.txt
I am Ahmed Alhusainy
 I am Studying Devops

I Need To Add A New Line By echo
ubuntu@UbuntUmachine:~/my_projects/documents$ printf '\n New Line By Print F Command \n' >> intro.txt
ubuntu@UbuntUmachine:~/my_projects/documents$ cat intro.txt
I am Ahmed Alhusainy
 I am Studying Devops

I Need To Add A New Line By echo

 New Line By Print F Command
ubuntu@UbuntUmachine:~/my_projects/documents$ printf '\n =============Adding By VIM ===========  \n' >> intro.txt
ubuntu@UbuntUmachine:~/my_projects/documents$ cat intro.txt
I am Ahmed Alhusainy
 I am Studying Devops

I Need To Add A New Line By echo

 New Line By Print F Command

 =============Adding By VIM ===========
ubuntu@UbuntUmachine:~/my_projects/documents$ vim intro.txt
ubuntu@UbuntUmachine:~/my_projects/documents$ nano intro.txt
ubuntu@UbuntUmachine:~/my_projects/documents$ nano intro.txt
ubuntu@UbuntUmachine:~/my_projects/documents$ nano
ubuntu@UbuntUmachine:~/my_projects/documents$ cat intro.txt
I am Ahmed Alhusainy
 I am Studying Devops

I Need To Add A New Line By echo

 New Line By Print F Command

 =============Adding By VIM ===========

I am Studying DevOps At DEPI , part of MCIT Internships
I am Studying DevOps At DEPI , part of MCIT Internships
I am Studying DevOps At DEPI , part of MCIT Internships
I am Studying DevOps At DEPI , part of MCIT Internships


===== Adding By NANO ==================

I want ti copy word "Great"

ubuntu@UbuntUmachine:~/my_projects/documents$ less intro.txt
ubuntu@UbuntUmachine:~/my_projects/documents$ more intro.txt
I am Ahmed Alhusainy
 I am Studying Devops

I Need To Add A New Line By echo

 New Line By Print F Command

 =============Adding By VIM ===========

I am Studying DevOps At DEPI , part of MCIT Internships
I am Studying DevOps At DEPI , part of MCIT Internships
I am Studying DevOps At DEPI , part of MCIT Internships
I am Studying DevOps At DEPI , part of MCIT Internships


===== Adding By NANO ==================

I want ti copy word "Great"



ubuntu@UbuntUmachine:~/my_projects/documents$ nano --linenumbers intro.txt

  GNU nano 7.2                                                                                       intro.txt
 1 I am Ahmed Alhusainy
 2  I am Studying Devops
 3
 4 I Need To Add A New Line By echo
 5
 6  New Line By Print F Command
 7
 8  =============Adding By VIM ===========
 9
10 I am Studying DevOps At DEPI , part of MCIT Internships
11 I am Studying DevOps At DEPI , part of MCIT Internships
12 I am Studying DevOps At DEPI , part of MCIT Internships
13 I am Studying DevOps At DEPI , part of MCIT Internships
14
15
16 ===== Adding By NANO ==================
17
18 I want ti copy word "Great"
19
20
21


