
# 🧪 Lab 1: Environment Setup and Basic Exploration

## 📝 Task

> Set up the environment by ensuring Nginx is installed, learn basic service commands, and test that it’s serving a default page.

**Subtasks:**

1. **Task 1.1** – Check if Nginx is Installed
2. **Task 1.2** – Install Nginx (if needed)
3. **Task 1.3** – Run Basic Nginx Commands
4. **Task 1.4** – Test Basic Installation

---

## ✅ Steps

1. Verify if Nginx is already installed on the system.
2. If not installed, update the package list and install Nginx.
3. Learn and run basic Nginx service commands: start, stop, restart, reload, status.
4. Confirm Nginx is running and accessible via browser or `curl`.

---

## 💻 Command(s)

```bash
# Task 1.1: Check if Nginx is installed
nginx -v
nginx -V
ps aux | grep nginx --> The only process with "nginx" running is the grep command itself, because Nginx isn’t active
which nginx
dpkg -l | grep nginx
apt list --installed | grep nginx
systemctl list-unit-files | grep nginx
systemctl status nginx

# Change Hostname
vim etc/hostname
hostnamectl set-hostname ubWebServer01
# To See Changes  1️⃣ Without reboot (reload hostname service)
sudo systemctl restart systemd-logind
# OR 2️⃣ With reboot (simplest)
sudo reboot

# If you want the hostname change to apply fully across the system (especially for web servers like Nginx)
sudo nano /etc/hosts
127.0.0.1   <new_hostname>

# Task 1.2: Install Nginx (if needed)
sudo apt update
sudo apt install -y nginx

# Task 1.3: Basic Nginx Commands
sudo systemctl start nginx     # Start service
sudo systemctl stop nginx      # Stop service
sudo systemctl restart nginx   # Restart service
sudo systemctl reload nginx    # Reload without dropping connections
sudo systemctl status nginx    # Check current status

# Task 1.4: Test Basic Installation
curl -I http://localhost
```

---

## 🔎 Verification / Expected Output

* `nginx -v` displays version (e.g., `nginx version: nginx/1.24.0`)
* `systemctl status nginx` shows **active (running)**
* `curl` output contains:

```
HTTP/1.1 200 OK
Server: nginx/...
```

* Opening `http://<server-ip>` in a browser shows **"Welcome to nginx!"** default page.

---

## 📦 Artifacts / Deliverables

* Screenshot of `nginx -v` output.
* Screenshot of browser showing default Nginx page.

---

## 🧠 Reflection

* Understood how to check, install, and manage Nginx services.
* Learned to test connectivity via both terminal (`curl`) and browser.

