

# Nginx Publishing Options (All the Ways)

## A) Single default site (quick & dirty)

* **Where:** `/etc/nginx/sites-available/default` (Debian/Ubuntu) or directly inside `nginx.conf` on RHEL.
* **Use when:** You just need one simple site fast.

```nginx
# inside the existing server { } of the default
root /var/www/html;
index index.html;
```

---

## B) Debian-style virtual hosts (clean, multi-site)

* **Where:**

  * Put site file in: `/etc/nginx/sites-available/mysite`
  * Enable via symlink to: `/etc/nginx/sites-enabled/mysite`
* **Use when:** You want **many** sites, clean separation, easy enable/disable.

```bash
sudo tee /etc/nginx/sites-available/mysite <<'EOF'
server {
  listen 80;
  server_name example.com;
  root /var/www/mysite;
  index index.html;
}
EOF
sudo ln -s /etc/nginx/sites-available/mysite /etc/nginx/sites-enabled/mysite
sudo nginx -t && sudo systemctl reload nginx
```

---

## C) RHEL/CentOS-style `conf.d/*.conf` (modular includes)

* **Where:** `/etc/nginx/conf.d/yourapp.conf`
* **Why it works:** `nginx.conf` usually has `include /etc/nginx/conf.d/*.conf;`
* **Use when:** You prefer one flat folder with one `.conf` per site/service.

```nginx
# /etc/nginx/conf.d/yourapp.conf
server {
  listen 80;
  server_name _;
  root /var/www/yourapp;
  index index.html;
}
```

---

## D) Put the server block directly in `nginx.conf`

* **Where:** `/etc/nginx/nginx.conf` under the `http { ... }` block
* **Use when:** Minimal environments, or you’re prototyping and don’t care about file hygiene.

```nginx
http {
  # ...
  server {
    listen 80;
    root /var/www/site1;
  }
}
```

---

## E) Name-based multi-site (hosted domains)

* **Where:** Any of the above (B/C/D), but with **distinct `server_name`** per site.
* **Use when:** Multiple domains on one server.

```nginx
server { listen 80; server_name example.com;   root /var/www/example; }
server { listen 80; server_name blog.example.com; root /var/www/blog; }
```

---

## F) Port-based sites (custom ports)

* **Where:** Any of the above; change `listen`.
* **Use when:** Separate sites by port (e.g., 888).

```nginx
server { listen 888; server_name _; root /var/www/app888; }
```

> Don’t forget to **open the port** in AWS Security Group and firewall.

---

## G) IP-based sites (multiple IPs on the host)

* **Where:** Any; bind `listen` to specific IP.
* **Use when:** One server has multiple public IPs.

```nginx
server { listen 203.0.113.10:80; root /var/www/siteA; }
server { listen 203.0.113.11:80; root /var/www/siteB; }
```

---

## H) Reverse proxy to an application (Node, Python, etc.)

* **Where:** Any; typical in `sites-available` or `conf.d`.
* **Use when:** Nginx fronts an app on 127.0.0.1:3000 (or a container).

```nginx
server {
  listen 80; server_name app.example.com;
  location / { proxy_pass http://127.0.0.1:3000; }
}
```

---

## I) Load balancing multiple upstreams

* **Where:** Any; define `upstream` + proxy.
* **Use when:** Scale across several app instances.

```nginx
upstream api_pool { server 127.0.0.1:3001; server 127.0.0.1:3002; }
server {
  listen 80; server_name api.example.com;
  location / { proxy_pass http://api_pool; }
}
```

---

## J) PHP (FastCGI via php-fpm)

* **Where:** Any; serve static + pass `.php` to FPM.
* **Use when:** WordPress/PHP apps.

```nginx
server {
  listen 80; root /var/www/phpapp;
  location /      { try_files $uri $uri/ =404; }
  location ~ \.php$ {
    include fastcgi_params;
    fastcgi_pass unix:/run/php/php8.2-fpm.sock;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
  }
}
```

---

## K) Python (uWSGI/Gunicorn)

* **Use when:** Django/Flask behind sockets/ports.

```nginx
upstream flask { server 127.0.0.1:8000; }
server {
  listen 80; location / { proxy_pass http://flask; }
}
```

*(Or with `uwsgi_pass` if using uWSGI.)*

---

## L) Subdirectory publishing (root + alias/try\_files)

* **Use when:** Host multiple *apps/sections* under one domain.

```nginx
server {
  listen 80; root /var/www/main;

  # static section at /docs
  location /docs/ {
    alias /var/www/docs/;   # note: alias replaces the path prefix
    autoindex on;           # optional directory listing
  }

  # SPA or static fallback
  location / {
    try_files $uri $uri/ /index.html;
  }
}
```

---

## M) Split configs with `include` (snippets & hygiene)

* **Where:** Reusable bits in `/etc/nginx/snippets/*.conf` or similar.
* **Use when:** DRY (SSL params, security headers, proxy defaults).

```nginx
# /etc/nginx/snippets/ssl.conf
ssl_protocols TLSv1.2 TLSv1.3;
add_header X-Frame-Options DENY;

# use it in a site:
server {
  listen 443 ssl; include snippets/ssl.conf;
  server_name example.com; root /var/www/example;
}
```

---

## N) Docker/Nginx container (per-site isolation)

* **Where:** Docker compose, mount config + content.
* **Use when:** You want each site isolated or CI/CD-driven.

```yaml
services:
  web:
    image: nginx:alpine
    ports: ["80:80"]
    volumes:
      - ./site.conf:/etc/nginx/conf.d/site.conf:ro
      - ./public:/usr/share/nginx/html:ro
```

---

## O) HTTPS/TLS publishing (Let’s Encrypt or custom certs)

* **Use when:** Public websites; essential for security/SEO.

```nginx
server {
  listen 443 ssl; server_name example.com;
  ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
  root /var/www/example;
}
```

---

## P) CDN / static-only offload (optional pattern)

* **Use when:** You want Nginx to **proxy** or **redirect** to CDN for assets.

```nginx
location /assets/ {
  proxy_pass https://cdn.example.com/assets/;
}
```

---

# How the “folders” differ

| Layout                                    | Typical Distros            | Include pattern in `nginx.conf`       | Best For                        |
| ----------------------------------------- | -------------------------- | ------------------------------------- | ------------------------------- |
| **Debian/Ubuntu sites-available/enabled** | Debian, Ubuntu             | `include /etc/nginx/sites-enabled/*;` | Multi-site hygiene, easy toggle |
| **RHEL/CentOS `conf.d/*.conf`**           | RHEL, CentOS, Amazon Linux | `include /etc/nginx/conf.d/*.conf;`   | Flat layout, one-file-per-site  |
| **All-in-one `nginx.conf`**               | Any                        | none (inline)                         | Small/simple setups, quick demo |

> You can mix them, but keep it **consistent** per server to avoid confusion.

---

## Minimal “publish” checklist (whichever path you choose)

1. Create **content** (`/var/www/<site>/index.html`).
2. Add a **server block** (in `sites-available`, `conf.d`, or `nginx.conf`).
3. Point `root` (or `alias`) to your content.
4. `sudo nginx -t && sudo systemctl reload nginx`
5. Open ports (AWS SG + OS firewall).
6. Test: `curl -I http://<public-ip>` and check `/var/log/nginx/access.log`.

---
