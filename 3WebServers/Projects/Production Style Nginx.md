

# 🧪 Final Lab: Complete Nginx Setup Project

## 📝 Project Objectives

> Build a production-style Nginx setup that hosts multiple sites, load-balances backend services, enforces security, and includes monitoring/logging (with optional TLS).

**Requirements:**

1. Multiple websites with different purposes
2. Load-balanced backend services
3. Security configurations implemented
4. Monitoring and logging set up
5. **Bonus:** SSL/TLS configuration

**Project Tasks:**

* **Task 1** – Architecture Design
* **Task 2** – Implementation
* **Task 3** – Testing & Validation
* **Task 4** – Documentation

---

## 📁 Recommended Folder Structure (Deliverable)

```
nginx-final-project/
├─ README.md
├─ docs/
│  ├─ architecture-diagram.png
│  ├─ architecture.md
│  ├─ troubleshooting.md
│  └─ maintenance.md
├─ scripts/
│  ├─ nginx-log-summary.sh
│  ├─ nginx-health.sh
│  └─ alert-on-fail.sh
├─ nginx/
│  ├─ snippets/
│  │  └─ security-headers.conf
│  ├─ sites-available/
│  │  ├─ corporate.conf          # main corporate site
│  │  ├─ api-gateway.conf        # reverse proxy to upstreams
│  │  ├─ admin.conf              # IP-restricted admin UI
│  │  └─ status.conf             # optional nginx status/monitor page
│  ├─ sites-enabled/             # symlinks in OS; empty in repo
│  └─ nginx.conf.sample          # http{} with rate-limit zones & log_format
├─ web/
│  ├─ corporate/
│  │  └─ index.html
│  ├─ admin/
│  │  └─ index.html
│  └─ static/
│     ├─ css/style.css
│     └─ js/app.js
├─ backend/                      # sample Node.js apps (for LB)
│  ├─ app1/
│  │  ├─ package.json
│  │  └─ app.js                  # listens on 3100
│  ├─ app2/
│  │  ├─ package.json
│  │  └─ app.js                  # listens on 3200
│  └─ app3-backup/
│     ├─ package.json
│     └─ app.js                  # listens on 3500 (backup)
└─ ops/
   ├─ hosts-examples.txt         # /etc/hosts lines for local testing (optional)
   ├─ ufw-rules.txt              # list of firewall openings
   └─ curl-tests.txt             # curl commands used in validation
```

> When delivering: include **all config files**, **scripts**, **web content**, and **sample backend apps**. On the server, you’ll copy to OS paths (not run from the repo).

---

## ✅ Task 1: Architecture Design

**Target Design:**

* **Corporate site** (static): `server_name corp.local` → `/var/www/corporate`
* **API Gateway**: `server_name api.local` → reverse proxy to **upstream pool** (Node apps on 3100/3200 + backup 3500)
* **Admin interface**: `server_name admin.local` → static content with **IP allowlist** + rate limiting
* **Monitoring**: log summary + health checks; optional `/nginx_status`

Diagram: put it in `docs/architecture-diagram.png` (hand-drawn is fine).

---

## ✅ Task 2: Implementation

### 2.1 Prepare directories & content

```bash
# Web roots
sudo mkdir -p /var/www/corporate /var/www/admin /var/www/static/{css,js}
echo "<h1>Corporate Site</h1>" | sudo tee /var/www/corporate/index.html
echo "<h1>Admin Panel</h1>"     | sudo tee /var/www/admin/index.html
echo "body{font-family:sans-serif}" | sudo tee /var/www/static/css/style.css
echo "console.log('ok');"           | sudo tee /var/www/static/js/app.js

# Permissions
sudo chown -R www-data:www-data /var/www
sudo find /var/www -type d -exec sudo chmod 755 {} \;
sudo find /var/www -type f -exec sudo chmod 644 {} \;
```

### 2.2 Security headers snippet

```bash
sudo mkdir -p /etc/nginx/snippets
sudo tee /etc/nginx/snippets/security-headers.conf >/dev/null <<'EOF'
add_header X-Content-Type-Options "nosniff" always;
add_header X-Frame-Options "DENY" always;
add_header Referrer-Policy "no-referrer-when-downgrade" always;
add_header X-XSS-Protection "0" always;
add_header Content-Security-Policy "default-src 'self'; img-src 'self' data:; script-src 'self'; style-src 'self' 'unsafe-inline'; object-src 'none'" always;
add_header Permissions-Policy "geolocation=(), microphone=(), camera=()" always;
# Enable HSTS only when HTTPS is enabled:
# add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
EOF
```

### 2.3 Global nginx.conf (zones & log\_format)

```bash
# Backup then edit
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
sudo vim /etc/nginx/nginx.conf
```

**Inside `http { ... }` add:**

```
limit_req_zone  $binary_remote_addr zone=req_per_ip:10m rate=5r/s;
limit_conn_zone $binary_remote_addr zone=conn_per_ip:10m;
log_format sec '$remote_addr - $status "$request" -> $upstream_addr ($request_time)s';
```

### 2.4 Site configs

**Corporate site** – `/etc/nginx/sites-available/corporate.conf`

```nginx
server {
    listen 80;
    server_name corp.local;        # or _ for IP testing

    root /var/www/corporate;
    index index.html;

    include snippets/security-headers.conf;

    location / {
        try_files $uri $uri/ =404;
        limit_req  zone=req_per_ip  burst=10 nodelay;
        limit_conn conn_per_ip      20;
    }
}
```

**API Gateway + Load Balancing** – `/etc/nginx/sites-available/api-gateway.conf`

```nginx
upstream api_pool {
    server 127.0.0.1:3100 max_fails=1 fail_timeout=10s;
    server 127.0.0.1:3200 max_fails=1 fail_timeout=10s;
    server 127.0.0.1:3500 backup;
}

server {
    listen 80;
    server_name api.local;

    include snippets/security-headers.conf;

    location / {
        proxy_pass http://api_pool;
        proxy_http_version 1.1;
        proxy_set_header Host               $host;
        proxy_set_header X-Real-IP          $remote_addr;
        proxy_set_header X-Forwarded-For    $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto  $scheme;
        proxy_set_header Connection         "";

        proxy_connect_timeout 5s;
        proxy_send_timeout    30s;
        proxy_read_timeout    30s;
        proxy_buffering on;
        proxy_buffers 8 16k;
        proxy_buffer_size 16k;

        proxy_next_upstream error timeout http_502 http_503 http_504;
    }

    location /health {
        proxy_pass http://api_pool/health;
        proxy_set_header Host $host;
    }
}
```

**Admin interface (IP allow + limits)** – `/etc/nginx/sites-available/admin.conf`

```nginx
server {
    listen 80;
    server_name admin.local;

    include snippets/security-headers.conf;

    location / {
        alias /var/www/admin/;
        index index.html;

        # Allow your public IP + localhost, deny rest
        allow 127.0.0.1;
        allow <YOUR_PUBLIC_IP>;
        deny  all;

        limit_req  zone=req_per_ip  burst=5 nodelay;
        limit_conn conn_per_ip      10;
    }
}
```

**Optional Nginx status** – `/etc/nginx/sites-available/status.conf`

```nginx
server {
    listen 80;
    server_name status.local;

    location /nginx_status {
        stub_status on;
        allow 127.0.0.1;
        allow <YOUR_PUBLIC_IP>;
        deny all;
    }
}
```

Enable sites (and disable default if present):

```bash
sudo ln -sf /etc/nginx/sites-available/corporate.conf   /etc/nginx/sites-enabled/corporate
sudo ln -sf /etc/nginx/sites-available/api-gateway.conf /etc/nginx/sites-enabled/api-gateway
sudo ln -sf /etc/nginx/sites-available/admin.conf       /etc/nginx/sites-enabled/admin
# optional
sudo ln -sf /etc/nginx/sites-available/status.conf      /etc/nginx/sites-enabled/status
sudo unlink /etc/nginx/sites-enabled/default 2>/dev/null || true

sudo nginx -t
sudo systemctl reload nginx


#using public or private IP No worries 
13.220.92.58  corp.local
13.220.92.58  api.local 
13.220.92.58  status.local
13.220.92.58  admin.local


# Map Public IPs on My Machine so i can test inside vm and publically 
13.220.92.58  corp.local  #Here Must Provide Public IP From AWS management console
13.220.92.58  api.local
13.220.92.58  status.local
13.220.92.58  admin.local


```
![corp.local](./00DEPI%20NGINX-Final%20Project/Assets/corp.png)
![Admin.local](./00DEPI%20NGINX-Final%20Project/Assets/Admin.png)
![Status.local](./00DEPI%20NGINX-Final%20Project/Assets/status.png)

### 2.5 Sample backend apps (Node.js)

```bash
sudo apt update && sudo apt install -y nodejs npm

# app1 (3100)
mkdir -p ~/app1 && cd ~/app1 && npm init -y && npm install express
cat > app.js <<'EOF'
const e=require('express');const a=e();const P=3100;
a.get('/',(_,r)=>r.send('app1:3100')); a.get('/health',(_,r)=>r.send('ok'));
a.listen(P,'127.0.0.1',()=>console.log('app1 on',P));
EOF
node app.js &

# app2 (3200)
mkdir -p ~/app2 && cd ~/app2 && npm init -y && npm install express
cat > app.js <<'EOF'
const e=require('express');const a=e();const P=3200;
a.get('/',(_,r)=>r.send('app2:3200')); a.get('/health',(_,r)=>r.send('ok'));
a.listen(P,'127.0.0.1',()=>console.log('app2 on',P));
EOF
node app.js &

# backup app3 (3500)
mkdir -p ~/app3 && cd ~/app3 && npm init -y && npm install express
cat > app.js <<'EOF'
const e=require('express');const a=e();const P=3500;
a.get('/',(_,r)=>r.send('app3-backup:3500')); a.get('/health',(_,r)=>r.send('ok'));
a.listen(P,'127.0.0.1',()=>console.log('app3 on',P));
EOF
node app.js &
```

---

## ✅ Task 3: Testing & Validation

### 3.1 Name resolution (local testing)

On **your laptop** add to `/etc/hosts` (or Windows hosts file), replacing `<EC2_PUBLIC_IP>`:

```
13.220.92.58 corp.local
13.220.92.58 api.local
13.220.92.58 admin.local
13.220.92.58 status.local
```

### 3.2 Functional checks

```bash
# Corporate
curl -I http://corp.local/

# API (LB): refresh several times — see app1/app2 alternate; stop both and see backup
curl http://api.local/
curl http://api.local/health

# Admin (IP allowlist): 200 from allowed IP, 403 from others
curl -I http://admin.local/

# Status (optional)
curl http://status.local/nginx_status
```

![API Local-1](./00DEPI%20NGINX-Final%20Project/Assets/API%20Local-1.png)
![API Local-2](./00DEPI%20NGINX-Final%20Project/Assets/API%20Local-2.png)
![API Health](./00DEPI%20NGINX-Final%20Project/Assets/API%20Health.png)


### 3.3 Security headers

```bash
curl -I http://corp.local/ | egrep -i 'content-security|x-frame|x-content|permissions|referrer'
```
![TestSecurityHeader](./00DEPI%20NGINX-Final%20Project/Assets/TestSecurityHeader.png)

### 3.4 Rate limiting (expect some 429)

```bash
for i in $(seq 1 30); do curl -s -o /dev/null -w "%{http_code}\n" http://corp.local/; done | sort | uniq -c
```

### 3.5 Failover test

* Stop `app1` and `app2` (`pkill -f 'app.js'` individually or ctrl-c) → `api.local` should serve **app3-backup**.
* Restart app1/app2 and verify round-robin resumes.

---

## ✅ Task 4: Documentation

Populate the **docs/** folder:

* `architecture.md`: describe sites, upstreams, security, monitoring
* `troubleshooting.md`: common errors and fixes (ports, perms, logs)
* `maintenance.md`: how to deploy changes, rotate logs, renew TLS
* `architecture-diagram.png`: diagram of request flows

Populate the **README.md** with:

* Overview, prerequisites
* How to apply configs, enable sites, run backends
* Testing instructions and sample `curl` commands

---

## 💻 (Optional) Bonus: TLS (self-signed quick demo)

```bash
sudo openssl req -x509 -nodes -newkey rsa:2048 -days 365 \
  -keyout /etc/ssl/private/demo.key -out /etc/ssl/certs/demo.crt -subj "/CN=corp.local"

# In corporate.conf, add:
# listen 443 ssl;
# ssl_certificate /etc/ssl/certs/demo.crt;
# ssl_certificate_key /etc/ssl/private/demo.key;
# (Enable HSTS in security-headers.conf)
sudo nginx -t && sudo systemctl reload nginx
```

---

## 🔎 Verification / Expected Output

* All server blocks pass `sudo nginx -t` and load correctly.
* `corp.local` serves static content with security headers and rate limits.
* `api.local` proxies to upstream pool with round-robin; backup kicks in on primary failure.
* `admin.local` is accessible only from allowed IPs.
* Monitoring scripts run and produce summaries/health logs.

---

## 📦 Artifacts / Deliverables

* Entire `nginx-final-project/` folder (as zip or repo) including **docs**, **nginx configs**, **scripts**, **web**, **backend**.
* Screenshots: headers check, LB alternation, failover, `/nginx_status`, and `nginx -t`.
* README with clear run/test instructions.

---

## 🧠 Reflection

* You integrated multi-site hosting, reverse proxy, and LB in one cohesive setup.
* You enforced practical security defaults and rate limiting.
* You added basic monitoring to observe behavior during load and failure.
* You documented the deployment for handoff and maintenance.

