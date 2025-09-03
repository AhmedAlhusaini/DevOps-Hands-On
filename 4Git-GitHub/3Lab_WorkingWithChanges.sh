#!/usr/bin/bash

# Create The Needed Files 
mkdir -p site
echo "<!DOCTYPE html><html><head><title>Site</title></head><body></body></html>" > site/index.html
echo "body { font-family: sans-serif; }" > site/style.css
echo "console.log('Hello from script.js');" > site/script.js


# Add Only Index 
git add index.html


# Git Status 
git status

# Add Remaning Files 
git add style.css script.js

# Add Commit 
git commit -m "Initial website structure with HTML, CSS, and JS"

# Modify Index 
echo "<h1>Welcome to My Site</h1>" >> index.html

# See The Differences 
git diff index.html
git diff # will show all modifications in all files 

# Add After Modoifications 
git add index.html
git commit -m "Added welcome header to index.html"


# See The Differences Before Stage 
# Modify Index 
echo "<h2>This is Ahmed Alhusainy Site</h2>" >> index.html

# To See the differences between working directory and index/stage 
git diff 

# To Discard Changes 
git restore | git checkout 

# Modify Index 
echo "<h2>This is Ahmed Alhusainy Site</h2>" >> index.html
git add index.html

# Show The Differences between repo and staging area 
git diff --staged index.html 

#Want to dicared 
git reset HEAD index.html
git restore --staged 

# Adding Again
git add index.html
git commit -m "Addding H2"

# Reset Last Commit
git reset --soft HEAD~1

git reset --hard  HEAD~1


# Modify Index 
echo "<h2>This is Ahmed Alhusainy Site</h2>" >> index.html
git add index.html
git commit -m "Adding Again To Test Revert"
git revert HEAD

