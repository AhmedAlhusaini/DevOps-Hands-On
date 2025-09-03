#!/bin/bash

# Author: Ahmed Alhusainy
# Purpose: Combined Git workflow for local changes and GitHub sync


# Step 1: Initialize repo and create files
git init
echo "<!DOCTYPE html><html><head><title>Site</title></head><body></body></html>" > index.html
echo "body { font-family: sans-serif; }" > style.css
echo "console.log('Hello from script.js');" > script.js

# Step 2: Stage only index.html
git add index.html

# Step 3: Check status
git status

# Step 4: Stage remaining files
git add style.css script.js

# Step 5: Commit all staged files
git commit -m "Initial commit with HTML, CSS, and JS files"

# Step 6: Modify index.html
echo "<h1>Welcome to My Site</h1>" >> index.html

# Step 7: View unstaged changes
git diff index.html

# Step 8: Stage and commit the change
git add index.html
git commit -m "Added welcome header to index.html"



git checkout -b contact-page
git branch contact-page

git log --oneline


git branch

git switch contact-page

touch contact.html
echo "<h1>Contact Us </h1>" >> contact.html
echo "<h1>Hello From Contact Page Branch</h1>" >> index.html


git status
git commit -m "Added Contact Page & Link To Index"
git add .

git status

git commit -m "Added Contact Page & Link To Index"

git log --oneline

git checkout master

ls -ial

cat index.html
git checkout contact-page

ls -ial
cat contact.html

git switch master
git merge contact-page

git log --oneline
git branch -d list
git branch
git log --oneline


git push origin main

# === Step 8: Delete the feature branch locally and remotely ===
git branch -d contact-page
git push origin --delete contact-page