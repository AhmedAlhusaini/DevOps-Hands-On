## 🧪 LAB 6: GitHub Features – Complete Project Setup  
**Objective**: Use GitHub’s features to structure, document, and publish a professional project.

---

### 🧱 Part A: Create `README.md`

```bash
# Create a README file with project overview
echo "# My First Website" > README.md
echo "This project is a simple static website built with HTML, CSS, and JavaScript." >> README.md
echo "## Features" >> README.md
echo "- Home and Contact pages" >> README.md
echo "- Styled layout with CSS" >> README.md
echo "- Responsive design (planned)" >> README.md

# Stage and commit the README
git add README.md
git commit -m "Add comprehensive README with project overview"
```

> 📝 **Note**: A good README improves project clarity, helps collaborators onboard quickly, and boosts credibility on GitHub.

---

### 🧱 Part B: Create `.gitignore`

```bash
# Create a .gitignore file to exclude unnecessary files
echo "node_modules/" > .gitignore
echo "*.log" >> .gitignore
echo ".DS_Store" >> .gitignore
echo "dist/" >> .gitignore

# Stage and commit .gitignore
git add .gitignore
git commit -m "Add .gitignore to exclude build artifacts and system files"
```

> 🧹 **Note**: `.gitignore` keeps your repo clean by preventing clutter from temporary or system-specific files.

---

### 🧱 Part C: Create GitHub Issue

> 🔧 **Manual Steps on GitHub.com**  
1. Go to your repository → **Issues** tab → click **New issue**  
2. **Title**: `Add responsive design for mobile devices`  
3. **Description**:  
   ```
   The website should look good on mobile phones and tablets.
   Need to add CSS media queries and test on different screen sizes.
   ```
4. Add label: `enhancement`

> 🧠 **Note**: Issues help track work, assign tasks, and document feature requests or bugs.

---

### 🧱 Part D: Create Pull Request Referencing the Issue

```bash
# Create a new branch for the responsive design feature
git checkout -b responsive-design

# Modify CSS to include media queries (example)
cat <<EOF >> style.css

@media (max-width: 600px) {
  body {
    font-size: 16px;
    padding: 10px;
  }
  footer {
    font-size: 12px;
  }
}
EOF

# Commit the changes
git add style.css
git commit -m "Add media queries for mobile responsiveness. Fixes #<issue-number>"

# Push the branch to GitHub
git push origin responsive-design
```

> 🔗 **Note**: Use `Fixes #<issue-number>` in your commit or PR description to automatically close the issue when merged.

> 🧑‍💻 **Manual Steps on GitHub.com**  
1. Go to **Pull Requests** tab → click **New pull request**  
2. Select `main` as base and `responsive-design` as compare  
3. Title: `Add responsive design for mobile devices`  
4. Description: Reference the issue and summarize changes  
5. Review → Merge → Delete branch

---

### 🌐 Part E: Enable GitHub Pages

> 🛠️ **Manual Steps on GitHub.com**  
1. Go to **Settings** → **Pages**  
2. Under **Source**, select:  
   - **Branch**: `main`  
   - **Folder**: `/ (root)`  
3. Click **Save**

> 🌍 Visit your live site at:  
`https://github.com/AhmedAlhusaini/my-first-website/index.html`

> 🚀 **Note**: GitHub Pages is perfect for hosting static sites, documentation, or portfolios directly from your repo.

