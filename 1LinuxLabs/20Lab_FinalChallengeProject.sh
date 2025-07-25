#!/usr/bin/bash

mkdir -p ~/web_project/{html,css,js,backup,scripts}

nano ~/web_project/html/index.html
```
Added:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Graduation Project</title>
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>
  <h1>Welcome to My Project Portfolio</h1>
  <script src="../js/app.js"></script>
</body>
</html>
```

## 3. Set file permissions

```bash
chmod -R 744 ~/web_project/html
chmod -R 755 ~/web_project/css ~/web_project/js
```
* **Why**:
  * `744` (`rwxr--r--`) is typical for static files: owner can edit, others can read.
  * `755` (`rwxr-xr-x`) on `css`/`js` allows group/others to read and execute (for some servers that require execution bit on scripts).
  * `-R` applies changes recursively.

---

## 4. Create a backup script

```bash
nano ~/web_project/scripts/backup.sh
chmod +x ~/web_project/scripts/backup.sh
```

In `backup.sh`, write:

```bash
#!/bin/bash
# Backup current web_project into a dated tar.gz

PROJECT=~/web_project
BACKUP_DIR=~/web_project/backup
TIMESTAMP=$(date +%Y%m%d_%H%M)
ARCHIVE="$BACKUP_DIR/web_project_$TIMESTAMP.tar.gz"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Create compressed archive
tar czvf "$ARCHIVE" -C ~ web_project

echo "Backup created at $ARCHIVE"
```



## 5. Document the process in `README.md`

```bash
nano ~/web_project/README.md
```

Include sections:

1. **Project Overview** – describe goals and technologies.
2. **Directory Structure** – outline each folder’s purpose.
3. **Setup Instructions** – how to open/edit files.
4. **Backup Guide** – how to run `scripts/backup.sh`.
5. **Testing** – steps to verify HTML renders, backups succeed.

* **Why**:

  * A clear README is the first thing recruiters and collaborators read.
  * Demonstrates professionalism and communication skills.

---

## 6. Test your implementation

```bash
# Run backup script
~/web_project/scripts/backup.sh

# Verify archive exists
ls -lh ~/web_project/backup

# Preview HTML in a browser or terminal
cat ~/web_project/html/index.html

# Check permissions
ls -l ~/web_project/html
ls -l ~/web_project/css
```
