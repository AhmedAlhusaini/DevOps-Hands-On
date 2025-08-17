

# 🛠️ Nginx Maintenance Guide

This guide outlines essential maintenance tasks to ensure your Nginx environment remains **secure**, **stable**, and **high-performing**.  
All commands assume an **Ubuntu/Debian** system and should be executed with `sudo` privileges when necessary.

---

## 1. Service Health Checks

- **Check service status**:
  ```bash
  systemctl status nginx
  ```

- **Reload after configuration changes**:
  ```bash
  nginx -t && systemctl reload nginx
  ```

- **Restart if the service has stopped**:
  ```bash
  systemctl restart nginx
  ```

---

## 2. Log Monitoring

- **Live log tailing**:
  ```bash
  tail -f /var/log/nginx/access.log /var/log/nginx/error.log
  ```

- **Review recent errors**:
  ```bash
  tail -n 50 /var/log/nginx/error.log
  ```

---

## 3. System Updates

- **Update system packages**:
  ```bash
  apt update && apt upgrade -y
  ```

- **Upgrade Nginx (if installed via apt)**:
  ```bash
  apt install --only-upgrade nginx
  ```

---

## 4. Configuration Backups

- **Backup Nginx configuration**:
  ```bash
  tar czf /root/backup-nginx-$(date +%F).tar.gz /etc/nginx
  ```

- **Backup website content**:
  ```bash
  tar czf /root/backup-www-$(date +%F).tar.gz /var/www
  ```

---

## 5. SSL/TLS Renewal

- **Dry-run renewal with Certbot**:
  ```bash
  certbot renew --dry-run
  ```

- **Automate renewal**:  
  Use a cron job or systemd timer to schedule regular renewals.

---

## 6. Monitoring Scripts

- **Run health check**:
  ```bash
  /usr/local/mon/nginx-health.sh
  ```

- **Run log summary**:
  ```bash
  /usr/local/mon/nginx-log-summary.sh
  ```

- **Review alert logs**:
  ```bash
  cat /var/log/nginx/alerts.log
  ```

---

## 7. Performance Tuning

- **Check active connections**:
  ```bash
  ss -s
  ```

- **Monitor CPU and memory usage**:
  ```bash
  top -o %CPU
  ```

- **Inspect disk space**:
  ```bash
  df -h
  ```

---

## 8. Maintenance Checklist

| Frequency   | Tasks                                                                 |
|-------------|------------------------------------------------------------------------|
| **Daily**   | Check service status, monitor error logs                              |
| **Weekly**  | Rotate logs, verify SSL cert status, review alerts                    |
| **Monthly** | Apply system updates, test failover, validate backups                 |
| **Quarterly** | Audit rate limits, security headers, and perform load testing       |

---

## 📌 Best Practices

- Always validate configuration changes with:
  ```bash
  nginx -t
  ```

- Maintain a dedicated backup directory:
  ```
  /root/nginx-backups/
  ```

- Automate routine tasks using `cron` or `systemd` timers.


