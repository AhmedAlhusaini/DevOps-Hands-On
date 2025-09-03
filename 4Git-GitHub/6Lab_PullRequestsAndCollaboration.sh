#!/usr/bin/bash
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


######################################################################New Section######################################################################

################Part A #######################################################################################################
git checkout -b add-footer
echo "<footer>© 2025 My Website</footer>" >> index.html
echo "<footer>© 2025 My Website</footer>" >> contact.html

cat <<EOF >> style.css

footer {
  text-align: center;
  padding: 10px;
  background-color: #f2f2f2;
  font-size: 14px;
  color: #333;
}
EOF



git add index.html contact.html style.css
git commit -m "Add footer to index and contact pages with styling"
git log --oneline


git push origin add-footer


#############Part B #######################################################################################################

🌐 Part B: Create Pull Request on GitHub
✅ 1. Go to GitHub repository page
Navigate to: https://github.com/AhmedAlhusaini/my-first-website/pulls

✅ 2. Click “New Pull Request”
Base branch: main

Compare branch: add-footer

✅ 3. Write a good title and description
Title: Add footer to website Description:

This pull request adds a consistent footer to both index and contact pages. It includes basic styling in style.css for layout and readability.

✅ 4. Review your own changes
Click “Files changed”

Confirm footer HTML and CSS updates

✅ 5. Merge the pull request
Click “Merge pull request”

Confirm with “Confirm merge”

✅ 6. Delete the feature branch on GitHub
Click “Delete branch” after merge

✅ 7. Pull changes to your local main branch


git checkout main
git pull origin main
git log --oneline
git branch -d add-footer
