#!/usr/bin/bash

## Open Nano Then Ctrl+ o to save 
nano
## or nano shopping_list.txt
cat Shopping_list.txt
cho "bananaaaa" >> Shopping_list.txt
tail -n 2 shopping_list.txt
echo "Chocolate" | tee -a Shopping_list.txt
