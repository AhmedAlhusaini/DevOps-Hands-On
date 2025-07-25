# 🧪 Lab: Text Editing Challenge

## 📝 Task

> Create and edit files using different methods:
> - Use `nano` to create a file called `shopping_list.txt`  
> - Add 5 items to your shopping list  
> - Save and exit  
> - Add one more item to the end of the file without opening an editor  
> - Display the final shopping list  

---

## ✅ Steps

1. Open `shopping_list.txt` in `nano` (it will create the file if it doesn't exist).  
2. Enter five shopping items, one per line.  
3. Save (`Ctrl+O`) and exit (`Ctrl+X`).  
4. Append a sixth item non-interactively.  
5. Use a command to display the entire contents of `shopping_list.txt`.  

---

## 💡 Bonus

- Use `tee -a` to append text and still see output.
- Try `sed -i '$ a\NewItem' shopping_list.txt` to insert at end in-place.
- Explore `ed` or `ex` for scriptable line edits.
---

## 💻 Command(s)

```bash

ubuntu@UbuntUmachine:~$ nano
ubuntu@UbuntUmachine:~$ nano Shopping_list.txt
ubuntu@UbuntUmachine:~$ cat Shopping_list.txt
Shopping List
=================
Ice Cream
Pampers
Sandwich Batatissss

ubuntu@UbuntUmachine:~$ echo "bananaaaa" >> Shopping_list.txt
ubuntu@UbuntUmachine:~$ cat Shopping_list.txt
Shopping List
=================
Ice Cream
Pampers
Sandwich Batatissss

bananaaaa
ubuntu@UbuntUmachine:~$ tee -a "Chipsy"
^Z
[1]+  Stopped                 tee -a "Chipsy"
ubuntu@UbuntUmachine:~$ tail -n 2 shopping_list.txt
tail: cannot open 'shopping_list.txt' for reading: No such file or directory
ubuntu@UbuntUmachine:~$ tail -n 2 Shopping_list.txt

bananaaaa
ubuntu@UbuntUmachine:~$ echo "Chocolate" | tee -a Shopping_list.txt
Chocolate
ubuntu@UbuntUmachine:~$

