
# 🧪 Lab 2: Installation and File System Exploration

## 📝 Task

> Explore the Nginx installation on the server, verify its main directories, review configuration files, check logs, and locate the document root for serving web pages.

**Subtasks:**

1. **Task 2.1** – Verify Installation Directories
2. **Task 2.2** – Examine Default Configuration
3. **Task 2.3** – Check Log Files
4. **Task 2.4** – Locate Document Root

---

## ✅ Steps

1. Confirm Nginx installation path and related directories.
2. Identify and open the main configuration file.
3. Review and locate the log file paths for access and error logs.
4. Locate the document root directory where Nginx serves content.

---

## 💻 Command(s)

```bash
# removing files that not removed if deleted 
apt remove nginx -y
service nginx stop
apt auto-remove -y 


# Veriy Its Running 
ubuntu@ubWebServer01:~$ systemctl status nginx.service
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; preset: enabled)
     Active: active (running) since Thu 2025-08-14 15:36:10 UTC; 3h 22min ago
       Docs: man:nginx(8)
    Process: 1860 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
    Process: 1862 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
   Main PID: 1890 (nginx)
      Tasks: 2 (limit: 1121)
     Memory: 1.8M (peak: 3.7M)
        CPU: 22ms
     CGroup: /system.slice/nginx.service
             ├─1890 "nginx: master process /usr/sbin/nginx -g daemon on; master_process on;"
             └─1893 "nginx: worker process"

Aug 14 15:36:10 ubWebServer01 systemd[1]: Starting nginx.service - A high performance web server and a reverse proxy server...
Aug 14 15:36:10 ubWebServer01 systemd[1]: Started nginx.service - A high performance web server and a reverse proxy server.


# Task 2.1: Verify Installation Directories
which nginx --> /usr/sbin/nginx --> Nginx is a service — it needs to bind to privileged ports (like 80, 443) and run with elevated privileges at startup.
# Why Nginx in sbin not bin ?
#/bin → Binaries for all users.
	#Commands needed for normal operation by both root and regular users.
	# Example: ls, cat, grep.

#/sbin → System binaries for administrative tasks.
	#Commands usually intended to be run by root or with sudo.
	#Example: iptables, mount, shutdown.
	

dpkg -L nginx   # List files installed by nginx package (Debian/Ubuntu)

ubuntu@ubWebServer01:/$ dpkg -L nginx
# /.
# /usr
# /usr/sbin
# /usr/sbin/nginx
# /usr/share
# /usr/share/doc
# /usr/share/doc/nginx
# /usr/share/doc/nginx/changelog.Debian.gz
# /usr/share/doc/nginx/copyright
# /usr/share/man
# /usr/share/man/man8
# /usr/share/man/man8/nginx.8.gz
# ubuntu@ubWebServer01:/$

dpkg -L nginx-common   # List files installed by nginx-common package 
# 
# ubuntu@ubWebServer01:/$ dpkg -L nginx-common
# /.
# /etc
# /etc/default
# /etc/default/nginx
# /etc/init.d
# /etc/init.d/nginx
# /etc/logrotate.d
# /etc/logrotate.d/nginx
# /etc/nginx
# /etc/nginx/conf.d
# /etc/nginx/fastcgi.conf
# /etc/nginx/fastcgi_params
# /etc/nginx/koi-utf
# /etc/nginx/koi-win
# /etc/nginx/mime.types
# /etc/nginx/modules-available
# /etc/nginx/modules-enabled
# /etc/nginx/nginx.conf
# /etc/nginx/proxy_params
# /etc/nginx/scgi_params
# /etc/nginx/sites-available
# /etc/nginx/sites-available/default
# /etc/nginx/sites-enabled
# /etc/nginx/snippets
# /etc/nginx/snippets/fastcgi-php.conf
# /etc/nginx/snippets/snakeoil.conf
# /etc/nginx/uwsgi_params
# /etc/nginx/win-utf
# /etc/ufw
# /etc/ufw/applications.d
# /etc/ufw/applications.d/nginx
# /usr
# /usr/lib
# /usr/lib/systemd
# /usr/lib/systemd/system
# /usr/lib/systemd/system/nginx.service
# /usr/share
# /usr/share/apport
# /usr/share/apport/package-hooks
# /usr/share/apport/package-hooks/source_nginx.py
# /usr/share/doc
# /usr/share/doc/nginx-common
# /usr/share/doc/nginx-common/changelog.Debian.gz
# /usr/share/doc/nginx-common/copyright
# /usr/share/nginx
# /usr/share/nginx/html
# /usr/share/nginx/html/index.html
# /usr/share/vim
# /usr/share/vim/addons
# /usr/share/vim/addons/ftdetect
# /usr/share/vim/addons/ftdetect/nginx.vim
# /usr/share/vim/addons/ftplugin
# /usr/share/vim/addons/ftplugin/nginx.vim
# /usr/share/vim/addons/indent
# /usr/share/vim/addons/indent/nginx.vim
# /usr/share/vim/addons/syntax
# /usr/share/vim/addons/syntax/nginx.vim
# /usr/share/vim/registry
# /usr/share/vim/registry/nginx.yaml
# /var
# /var/lib
# /var/lib/nginx
# /var/log
# /var/log/nginx
# /usr/share/nginx/modules

#There are 3 main types 
#Config Directory 
#Log Directory 
#Root Document Directory 


# Task 2.2: Examine Default Configuration
cat /etc/nginx/nginx.conf
ls -l /etc/nginx/sites-available/
ls -l /etc/nginx/sites-enabled/
ls /etc/nginx/conf.d/
cd /etc/nginx
cat sites-available/default
ls /var/log/nginx/
cd /var/www
ls 
cd html
cat index.nginx-debian.html

cat nginx.conf

ubuntu@ubWebServer01:/etc/nginx$ cat nginx.conf
user www-data;
worker_processes auto;
pid /run/nginx.pid;
error_log /var/log/nginx/error.log;
include /etc/nginx/modules-enabled/*.conf;

events {
        worker_connections 768;
        # multi_accept on;
}

http {

        ##
        # Basic Settings
        ##

        sendfile on;
        tcp_nopush on;
        types_hash_max_size 2048;
        # server_tokens off;

        # server_names_hash_bucket_size 64;
        # server_name_in_redirect off;

        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        ##
        # SSL Settings
        ##

        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
        ssl_prefer_server_ciphers on;

        ##
        # Logging Settings
        ##

        access_log /var/log/nginx/access.log;

        ##
        # Gzip Settings
        ##

        gzip on;

        # gzip_vary on;
        # gzip_proxied any;
        # gzip_comp_level 6;
        # gzip_buffers 16 8k;
        # gzip_http_version 1.1;
        # gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

        ##
        # Virtual Host Configs
        ##

        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
}


#mail {
#       # See sample authentication script at:
#       # http://wiki.nginx.org/ImapAuthenticateWithApachePhpScript
#
#       # auth_http localhost/auth.php;
#       # pop3_capabilities "TOP" "USER";
#       # imap_capabilities "IMAP4rev1" "UIDPLUS";
#
#       server {
#               listen     localhost:110;
#               protocol   pop3;
#               proxy      on;
#       }
#
#       server {
#               listen     localhost:143;
#               protocol   imap;
#               proxy      on;
#       }
#}

# Task 2.3: Check Log Files
ls -l /var/log/nginx/
tail -n 20 /var/log/nginx/access.log
tail -n 20 /var/log/nginx/error.log

# Task 2.4: Locate Document Root
root@ubWebServer01:/etc/nginx/sites-available# grep "root" default
        root /var/www/html;
        # deny access to .htaccess files, if Apache's document root
#       root /var/www/example.com;

ls -l /var/www/html

```

---

## 🔎 Verification / Expected Output

* `which nginx` returns `/usr/sbin/nginx` or similar.
* `nginx.conf` shows global settings and `include` directives for site configs.
* `/var/log/nginx/` contains `access.log` and `error.log`.
* Document root is typically `/var/www/html` for the default site, containing `index.html`.

---

## 📦 Artifacts / Deliverables

* Screenshot of Nginx installation path and config file listing.
* Screenshot of `access.log` and `error.log` last entries.
* Screenshot of document root directory contents.

---

## 🧠 Reflection

* Learned where Nginx stores configs, logs, and web content.
* Understood how to navigate and verify Nginx file system structure.

