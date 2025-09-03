#!/usr/bin/bash

# 
# ### 🧩 What `git add -p` Does
# 
# It breaks down your changes into **hunks** (small sections of diff output) and lets you decide, one by one, whether to stage each hunk. This is ideal for:
# 
# - Staging only relevant changes (e.g., bug fixes vs. debug prints)
# - Keeping commits clean and focused
# - Avoiding accidental commits of unfinished work
# 
# ---
# 
# ### 🛠️ How to Use It
# 
# ```bash
# git add -p
# ```
# 
# You'll be prompted with something like:
# 
# ```
# Stage this hunk [y,n,q,a,d,s,e,?]?
# ```
# 
# Here’s what those options mean:
# 
# | Key | Action |
# |-----|--------|
# | `y` | Stage this hunk |
# | `n` | Skip this hunk |
# | `q` | Quit; don’t stage this or any remaining hunks |
# | `a` | Stage this and all remaining hunks |
# | `d` | Skip this and all remaining hunks |
# | `s` | Split the hunk into smaller pieces (if possible) |
# | `e` | Manually edit the hunk before staging |
# | `?` | Show help for these options |
# 
# ---
# 
# ### 🧠 What to Review
# 
# To master this, revisit:
# 
# - **Git staging concepts** (index vs working directory)
# - **Diffs and hunks** (`git diff`, `git diff --cached`)
# - **Interactive commands** (`git add -p`, `git checkout -p`, `git stash -p`)
# 


###Part 2 

### 🔍 What Is `git add -p` Really Doing?

# Git enters **interactive patch mode**, which means:
# 
# - It scans your modified files.
# - Breaks changes into **hunks** (logical blocks of changes).
# - Prompts you to **stage or skip** each hunk individually.
# 
# This gives you **surgical control** over what goes into your next commit—ideal for clean commit history, 
# separating bug fixes from debug logs, or staging only production-ready code.
# 
# ---
# 
# ### 🧠 Why It Matters for DevOps & Teaching
# 
# | Benefit | DevOps Impact | Teaching Value |
# |--------|----------------|----------------|
# | **Atomic Commits** | Keeps CI/CD pipelines clean and traceable. | Shows students how to commit with intent. |
# | **Selective Staging** | Avoids committing debug/test code. | Demonstrates real-world version control hygiene. |
# | **Conflict Isolation** | Helps isolate merge conflicts to specific hunks. | Teaches granular control over Git workflows. |
# 
# ---
# 
# ### 🧪 Real-World Scenario
# 
# Imagine you're editing a script:
# 
# ```bash
# # script.sh
# echo "Starting service..."
# # debug line
# echo "Debug: Service started at $(date)"
# ```
# 
# You want to commit only the production line. Run:
# 
# ```bash
# git add -p script.sh
# ```
# 
# Git will show:
# 
# ```
# @@ -1,2 +1,3 @@
#  echo "Starting service..."
# +echo "Debug: Service started at $(date)"
# Stage this hunk [y,n,q,a,d,s,e,?]?
# ```
# 
# Press `n` to skip the debug line. Now your commit stays clean.
# 
# ---
# 
# ### 🧭 What to Review Next
# 
# To master this, explore:
# 
# - `git diff` → Understand what’s changing.
# - `git status` → See staged vs unstaged changes.
# - `git reset -p` → Unstage hunks interactively.
# - `git stash -p` → Stash hunks selectively.
# - `git commit --patch` → Commit hunks directly without staging.
# 


echo "line 1" > test.txt
git init
git add test.txt
echo "line 2" >> test.txt
echo "line 3" >> test.txt
git add -p
