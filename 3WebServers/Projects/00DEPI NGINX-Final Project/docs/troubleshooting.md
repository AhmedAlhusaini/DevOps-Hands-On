
# 🚑 Nginx Troubleshooting Guide

This guide outlines diagnostic steps and solutions for common issues encountered in a production Nginx environment.

---

## 1. Nginx Fails to Start or Reload

- **Symptoms**: Service restart fails, reload returns errors.
- **Diagnosis**:
  ```bash
  sudo nginx -t
  sudo systemctl status nginx --no-pager
  sudo journalctl -u nginx -n 50 --no-pager
  ```
- **Resolution**: Fix the reported configuration error, then reload:
  ```bash
  sudo nginx -t && sudo systemctl reload nginx
  ```

---

## 2. 404 Errors for Existing Files

- **Checks**:
  - Validate the `root` directive in the site configuration.
  - Check file and directory permissions:
    ```bash
    ls -ld /var/www/your-site
    ls -l /var/www/your-site/index.html
    ```
  - Confirm `try_files` is correctly configured.
- **Resolution**:
  ```bash
  sudo chown -R www-data:www-data /var/www/your-site
  sudo chmod -R 755 /var/www/your-site
  ```

---

## 3. Site Accessible Locally but Not Publicly

- **Checks**:
  - Review firewall rules or AWS Security Group settings.
  - Confirm Nginx is listening on public interfaces:
    ```bash
    sudo ss -lntp | grep nginx
    ```
  - Verify DNS or `/etc/hosts` entries match `server_name`.
- **Resolution**: Open required ports, fix DNS records, update `server_name`.

---

## 4. 502 / 504 Bad Gateway Errors

- **Checks**:
  - Ensure backend service is running:
    ```bash
    curl http://127.0.0.1:3000/
    ```
  - Validate upstream IP/port in Nginx config.
  - Review error logs for upstream failures.
- **Resolution**: Start backend service, correct upstream config, adjust timeouts:
  ```nginx
  proxy_connect_timeout 10s;
  proxy_read_timeout 60s;
  ```

---

## 5. Intermittent Slowness

- **Checks**:
  - Monitor system resources:
    ```bash
    top -o %CPU
    free -h
    df -h
    ```
  - Analyze access logs for traffic spikes:
    ```bash
    tail -n 100 /var/log/nginx/access.log
    ```
  - Inspect active connections:
    ```bash
    ss -s
    ```
- **Resolution**: Scale resources, enable caching, increase `worker_connections`.

---

## 6. SSL/TLS Issues

- **Checks**:
  ```bash
  openssl s_client -connect yourdomain.com:443
  sudo certbot certificates
  ```
- **Resolution**: Renew certificates and update configuration:
  ```bash
  sudo certbot renew --dry-run
  ```
  ```nginx
  ssl_certificate     /etc/letsencrypt/live/yourdomain/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/yourdomain/privkey.pem;
  ```

---

## 🔎 Quick Reference Commands

```bash
sudo nginx -t                          # Validate configuration
sudo systemctl reload nginx            # Reload safely
sudo tail -f /var/log/nginx/error.log  # Live error logs
sudo ss -lntp | grep nginx             # Check listening ports
curl -I http://127.0.0.1/              # Local site test
```

---

## 🧭 Troubleshooting Flow

1. Validate configuration with `nginx -t`
2. Check service status via `systemctl`
3. Inspect logs (`error.log`, `journalctl`)
4. Verify ports, firewall, and DNS
5. Test backend services
6. Apply fix and retest

---

✅ Always back up configuration files to `/root/nginx-backups/` before making major changes.

