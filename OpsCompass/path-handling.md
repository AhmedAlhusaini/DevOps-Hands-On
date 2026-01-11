## 🗂️ Path Handling Scenarios

### 1. **Windows-style paths (PowerShell / CMD)**
- Format: `D:\path\to\folder`
- Example:
  ```powershell
  docker run -v "D:\Projects\site:/usr/share/nginx/html" nginx
  ```
- ✅ Works in PowerShell and CMD.
- ❌ In Git Bash, backslashes (`\`) can be misinterpreted as escape characters.

---

### 2. **Windows paths with forward slashes (Git Bash)**
- Format: `D:/path/to/folder`
- Example:
  ```bash
  docker run -v "D:/Projects/site:/usr/share/nginx/html" nginx
  ```
- ✅ Works in Git Bash because forward slashes avoid escape issues.
- ✅ Docker Desktop understands this format correctly.
- 🔑 This is the option that fixed your issue.

---

### 3. **WSL paths (`/mnt/d/...`)**
- Format: `/mnt/d/path/to/folder`
- Example:
  ```bash
  docker run -v "/mnt/d/Projects/site:/usr/share/nginx/html" nginx
  ```
- ✅ Works if you run Docker **inside WSL** (Ubuntu/WSL terminal).
- ❌ Fails in Git Bash, because Git Bash tries to interpret `/mnt/...` as a local Unix path and rewrites it incorrectly (that’s why you saw `C:\Program Files\Git\mnt`).

---

### 4. **Relative paths**
- Format: `$(pwd)/subfolder:/usr/share/nginx/html`
- Example:
  ```bash
  docker run -v "$(pwd)/Stylish:/usr/share/nginx/html" nginx
  ```
- ✅ Works in Git Bash and WSL if your current directory is inside the project.
- ⚠️ On Windows CMD/PowerShell, `$(pwd)` won’t work — you’d use `%cd%` instead.

---

### 5. **Spaces in paths**
- Always wrap the path in quotes:
  ```bash
  docker run -v "D:/Enterprise Solutions/site:/usr/share/nginx/html" nginx
  ```
- Without quotes, Docker will split the path at the space and fail.

---

## 🧭 Quick Decision Guide

| Environment       | Path format to use | Example |
|-------------------|--------------------|---------|
| **PowerShell / CMD** | `D:\...` | `"D:\Projects\site:/usr/share/nginx/html"` |
| **Git Bash**        | `D:/...` | `"D:/Projects/site:/usr/share/nginx/html"` |
| **WSL (Ubuntu)**    | `/mnt/d/...` | `"/mnt/d/Projects/site:/usr/share/nginx/html"` |
| **Relative (Git Bash/WSL)** | `$(pwd)/...` | `"$(pwd)/Stylish:/usr/share/nginx/html"` |

---

## 🔍 Why this matters
- Docker Desktop runs Linux containers, so the **container side** always uses Linux paths (`/usr/share/nginx/html`).  
- The **host side** depends on your shell:
  - Windows shells → Windows paths (`D:\...`)  
  - Git Bash → Windows paths with forward slashes (`D:/...`)  
  - WSL → Linux-style mount paths (`/mnt/d/...`)  

---

👉 Now you can confidently mount volumes no matter which shell you’re in.  

Would you like me to also show you **how to persist these mounts in a `docker-compose.yaml`** so you don’t have to remember the path quirks every time?