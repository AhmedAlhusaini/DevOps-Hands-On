#!/bin/bash

# Author: Ahmed Alhusainy
# Purpose: Combined Git workflow for local changes and GitHub sync

# === Lab 2: Working with Changes ===

# Step 1: Initialize repo and create files
mkdir Site 
cd Site 

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

# === Lab 2 Extension: Working with Change States ===

# Modify index.html again
echo "<footer>Contact us</footer>" >> index.html

# Undo unstaged changes
git restore index.html

# Modify and stage again
echo "<footer>Contact us</footer>" >> index.html
git add index.html

# Unstage the change
git restore --staged index.html

# === Lab 3: GitHub Setup and First Push ===

# Step 1: Add GitHub remote (replace USERNAME)
git remote add origin https://github.com/AhmedAlhusaini/my-first-website.git

# Step 2: Push to GitHub
git branch -M main
git push -u origin main

# Step 3: Simulate remote change (README.md) 
echo "# My First Website" > README.md
echo "This is a test update from GitHub." >> README.md
git add README.md
git commit -m "Added README.md In Local"
git push origin main

# Step 4: Pull remote changes after editing / creating a file inside GITHUB
Create A File On GIT HUB 
Contain Metadata about WebSite 
Write Manually some sentences 
-Hello This is a metadata about the web site 
-This is to test pull from local to clone these changes in local working directory

git pull origin main

echo "✅ Workflow complete: Local changes managed, GitHub synced, and repo cleaned."
