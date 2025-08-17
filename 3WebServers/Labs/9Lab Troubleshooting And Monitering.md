# \#######################################
# ! I solve it with AI to understand what exactly needed and how 		  
# \######################################



# 🧪 Lab 9: Troubleshooting and Monitoring

## 📝 Task

> Intentionally break parts of your Nginx setup, practice fixing them, then add simple monitoring: log analysis, health checks, and automated alerts.

**Subtasks:**

1. **Task 9.1** – Create Intentional Configuration Errors
2. **Task 9.2** – Practice Troubleshooting
3. **Task 9.3** – Create Monitoring Scripts
4. **Task 9.4** – Create Log Analysis Script
5. **Task 9.5** – Create Health Check Script
6. **Task 9.6** – Set Up Automated Monitoring
7. **Task 9.7** – Test Monitoring and Alerting
8. **Task 9.8** – Create Troubleshooting Playbook

---

## ✅ Steps

1. Back up working Nginx config.
2. Introduce common mistakes (syntax error, wrong root path, port conflict).
3. Use `nginx -t`, `journalctl`, and logs to diagnose and fix.
4. Build small scripts: **tail-based alert**, **log analyzer**, **HTTP health check**.
5. Schedule checks with **cron**.
6. Simulate failures and confirm alerts/logs.
7. Write a short **playbook** of symptoms → checks → fixes.

---

## 💻 Command(s)

```bash
# ---------- Prep ----------
sudo apt update
sudo apt install -y nginx curl jq

# Save a known-good config bundle
sudo mkdir -p /root/nginx-backups
sudo cp -a /etc/nginx /root/nginx-backups/nginx.$(date +%F-%H%M).tarball
sudo tar -C /etc -czf /root/nginx-backups/nginx.$(date +%F-%H%M).tgz nginx

# Make sure you have at least one working site
sudo nginx -t && sudo systemctl reload nginx
```

### Task 9.1 — Create Intentional Configuration Errors

**A) Syntax error (missing `;`)**

```bash
# Pick a test site (or create /etc/nginx/sites-available/bad)
sudo tee /etc/nginx/sites-available/bad >/dev/null <<'EOF'
server {
    listen 8080
    server_name _;
    return 200 "bad site\n";
}
EOF
sudo ln -sf /etc/nginx/sites-available/bad /etc/nginx/sites-enabled/bad
sudo nginx -t || true
```

**B) Wrong document root**

```bash
sudo tee /etc/nginx/sites-available/wrongroot >/dev/null <<'EOF'
server {
    listen 8081;
    server_name _;
    root /var/www/does-not-exist;
    location / { try_files $uri $uri/ =404; }
}
EOF
sudo ln -sf /etc/nginx/sites-available/wrongroot /etc/nginx/sites-enabled/wrongroot
sudo nginx -t && sudo systemctl reload nginx
```

**C) Port conflict (duplicate listen)**

```bash
# Duplicate a default listen 80 to force a clash
sudo tee /etc/nginx/sites-available/conflict >/dev/null <<'EOF'
server {
    listen 80 default_server;
    server_name _;
    return 200 "conflict\n";
}
EOF
sudo ln -sf /etc/nginx/sites-available/conflict /etc/nginx/sites-enabled/conflict
# This may still test OK, but the real conflict shows at reload/start
sudo nginx -t
sudo systemctl reload nginx || true
```

---

### Task 9.2 — Practice Troubleshooting

```bash
# 1) Validate config & read exact error lines
sudo nginx -t

# 2) If reload/start failed, read service logs
sudo systemctl status nginx --no-pager
sudo journalctl -u nginx -n 50 --no-pager

# 3) Nginx runtime logs
sudo tail -n 50 /var/log/nginx/error.log
sudo tail -n 50 /var/log/nginx/access.log

# 4) Check ports & listeners
sudo ss -lntp | grep nginx || true

# 5) Try site endpoints
curl -I http://127.0.0.1:8080/ || true
curl -I http://127.0.0.1:8081/ || true
curl -I http://<EC2_PUBLIC_IP>/ || true
```

**Fix the issues one by one:**

* **Syntax error:** add the missing `;` after `listen 8080;`

  ```bash
  sudo sed -n '1,200p' /etc/nginx/sites-available/bad
  sudo sed -i 's/listen 8080$/listen 8080;/' /etc/nginx/sites-available/bad
  sudo nginx -t && sudo systemctl reload nginx
  ```

* **Wrong root:** point to an existing path

  ```bash
  sudo mkdir -p /var/www/correct && echo ok | sudo tee /var/www/correct/index.html
  sudo sed -i 's#/var/www/does-not-exist#/var/www/correct#' /etc/nginx/sites-available/wrongroot
  sudo nginx -t && sudo systemctl reload nginx
  curl -s http://127.0.0.1:8081/
  ```

* **Port conflict:** disable the conflicting site

  ```bash
  sudo unlink /etc/nginx/sites-enabled/conflict
  sudo nginx -t && sudo systemctl reload nginx
  ```

Clean up (optional):

```bash
# keep wrongroot/bad for training, but it's okay to disable them
# sudo unlink /etc/nginx/sites-enabled/bad
# sudo unlink /etc/nginx/sites-enabled/wrongroot
```

---

### Task 9.3 — Create Monitoring Scripts (folder + permissions)

```bash
sudo mkdir -p /usr/local/mon
sudo chmod 755 /usr/local/mon
```

---

### Task 9.4 — Create Log Analysis Script

```bash
# /usr/local/mon/nginx-log-summary.sh
sudo tee /usr/local/mon/nginx-log-summary.sh >/dev/null <<'EOF'
#!/usr/bin/env bash
LOG="/var/log/nginx/access.log"
echo "=== Nginx Log Summary (last 200 lines) ==="
tail -n 200 "$LOG" | awk '{print $1, $9, $7}' > /tmp/ng-last200.txt

echo "-- Top status codes --"
awk '{print $2}' /tmp/ng-last200.txt | sort | uniq -c | sort -nr

echo "-- Top 10 paths --"
awk '{print $3}' /tmp/ng-last200.txt | sort | uniq -c | sort -nr | head

echo "-- Top 10 IPs --"
awk '{print $1}' /tmp/ng-last200.txt | sort | uniq -c | sort -nr | head

echo "-- 4xx/5xx recent --"
grep -E ' 4[0-9][0-9] | 5[0-9][0-9] ' "$LOG" | tail -n 20 || true
EOF

sudo chmod +x /usr/local/mon/nginx-log-summary.sh
```

Run it:

```bash
sudo /usr/local/mon/nginx-log-summary.sh
```

---

### Task 9.5 — Create Health Check Script

```bash
# /usr/local/mon/nginx-health.sh
sudo tee /usr/local/mon/nginx-health.sh >/dev/null <<'EOF'
#!/usr/bin/env bash
TARGET="http://127.0.0.1"
CODE=$(curl -s -o /dev/null -w "%{http_code}" "$TARGET")
TIME=$(date '+%F %T')
if [ "$CODE" -ge 200 ] && [ "$CODE" -lt 400 ]; then
  echo "$TIME HEALTH OK $CODE $TARGET"
  exit 0
else
  echo "$TIME HEALTH FAIL $CODE $TARGET"
  exit 1
fi
EOF

sudo chmod +x /usr/local/mon/nginx-health.sh
sudo /usr/local/mon/nginx-health.sh || true
```

---

### Task 9.6 — Set Up Automated Monitoring (cron)

We’ll run the health check every minute and log failures; log summary every 10 minutes.

```bash
# Create a simple alert logger
sudo tee /usr/local/mon/alert-on-fail.sh >/dev/null <<'EOF'
#!/usr/bin/env bash
/usr/local/mon/nginx-health.sh >> /var/log/nginx/health.log 2>&1
RC=$?
if [ $RC -ne 0 ]; then
  echo "$(date '+%F %T') ALERT: Health check failed" >> /var/log/nginx/alerts.log
fi
EOF
sudo chmod +x /usr/local/mon/alert-on-fail.sh
```

Add cron jobs:

```bash
( sudo crontab -l 2>/dev/null; echo "* * * * * /usr/local/mon/alert-on-fail.sh"; ) | sudo crontab -
( sudo crontab -l 2>/dev/null; echo "*/10 * * * * /usr/local/mon/nginx-log-summary.sh >> /var/log/nginx/log-summary.log 2>&1"; ) | sudo crontab -
```

Check they’re registered:

```bash
sudo crontab -l
```

---

### Task 9.7 — Test Monitoring and Alerting

**A) Break the site temporarily**

```bash
# Stop Nginx (or introduce a syntax error then reload)
sudo systemctl stop nginx
sleep 70
sudo systemctl start nginx
```

**B) Inspect logs**

```bash
sudo tail -n 50 /var/log/nginx/health.log
sudo tail -n 50 /var/log/nginx/alerts.log
sudo tail -n 50 /var/log/nginx/log-summary.log
```

You should see a **FAIL** and an **ALERT** while Nginx was down.

**C) Trigger 404/429/500 to populate summaries**

```bash
curl -I http://127.0.0.1/no-such-page
# (If you have rate limiting from Lab 8)
for i in $(seq 1 40); do curl -s -o /dev/null -w "%{http_code}\n" http://127.0.0.1/; done
sudo /usr/local/mon/nginx-log-summary.sh
```

---

### Task 9.8 — Create Troubleshooting Playbook

```bash
sudo tee /var/www/secure/Troubleshooting-Playbook.txt >/dev/null <<'EOF'
Nginx Troubleshooting Playbook (Quick)
/--------------------------------------------------------/
SYMPTOM: Nginx won’t reload or start
  1) sudo nginx -t
  2) sudo systemctl status nginx --no-pager
  3) sudo journalctl -u nginx -n 50 --no-pager
  4) Fix the exact line/file shown; retest.

SYMPTOM: 404s for valid files
  1) Check server block root + path
  2) File perms: dirs 755, files 644, owner www-data
  3) try_files logic

SYMPTOM: “working locally but not from internet”
  1) AWS Security Group / UFW rules
  2) Nginx listening on expected port (sudo ss -lntp | grep nginx)
  3) DNS/hosts (server_name vs Host header)

SYMPTOM: 502/504 through reverse proxy
  1) Backend running? (curl backend directly)
  2) Upstream IP/port correct?
  3) proxy_read_timeout / proxy_next_upstream
  4) error.log for upstream failures

SYMPTOM: Intermittent slowness
  1) Check CPU/mem/disk: top, free -h, df -h, iostat
  2) Access/error logs for spikes
  3) Increase timeouts or buffers if needed

Useful commands:
  - sudo nginx -t && sudo systemctl reload nginx
  - sudo tail -f /var/log/nginx/access.log /var/log/nginx/error.log
  - sudo ss -lntp | grep nginx
  - curl -I http://127.0.0.1/
EOF
```

---

## 🔎 Verification / Expected Output

* `sudo nginx -t` pinpoints syntax errors; reload succeeds after fixes.
* `curl -I` to broken sites shows expected failures (then success after fix).
* `nginx-log-summary.sh` lists top status codes, IPs, and paths.
* `nginx-health.sh` prints **HEALTH OK/FAIL**; cron writes to `health.log` and `alerts.log`.
* During the outage test, an **ALERT** entry appears.

---

## 📦 Artifacts / Deliverables

* Screenshots of a failing `nginx -t` and the corrected re-test.
* Output of `nginx-log-summary.sh`.
* Snippets from `health.log` and `alerts.log` showing a failure period.
* The `Troubleshooting-Playbook.txt` file content.

---

## 🧠 Reflection

* You practiced **safe break/fix** cycles with Nginx.
* You built small, useful **ops scripts** for health and logs.
* You scheduled automated checks and verified alerts during an outage.

