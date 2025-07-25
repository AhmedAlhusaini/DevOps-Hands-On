#!/bin/bash
mkdir my_projects
ls 
cd my_projects || exit
mkdir documents scripts backup
touch documents/readme.txt
tree 
mkdir -p Ahmed/nested/subnested
tree 
touch -t 202507201545 example.txt
ls -l example.txt
ls -l --full-time example.txt
date -r example.txt
echo "This is a sample file." > example.txt
cat example.txt
echo "This is a new line." >> example.txt
cat example.txt


