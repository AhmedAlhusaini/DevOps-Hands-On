
## **1️⃣ Concept: Location Blocks**

* **Location blocks** in Nginx tell it *how to handle requests that match certain URL patterns*.
* Think of them as **rules for specific paths or file types**.

---

## **2️⃣ Breaking Down the Config**

```nginx
server {
    listen 80;
    server_name example.com;
    root /var/www/html;
```

* `listen 80;` → Nginx listens for HTTP requests on port 80.
* `server_name example.com;` → This block only applies to requests for `example.com`.
* `root /var/www/html;` → Base directory where files are served from.

---

### **Exact match for favicon**

```nginx
location = /favicon.ico {
    log_not_found off;
    access_log off;
}
```

* `location = /favicon.ico` → Exact match for `/favicon.ico`.
* `log_not_found off;` → Don’t log errors if the file is missing.
* `access_log off;` → Don’t log access to this file (reduces log noise).

---

### **Static assets (CSS, JS, images)**

```nginx
location ~* \.(css|js|png|jpg|jpeg|gif|ico|svg)$ {
    expires 1y;
    add_header Cache-Control "public";
}
```

* `~*` → Case-insensitive regex match for file extensions.
* `expires 1y;` → Tell browsers they can cache the file for **1 year**.
* `add_header Cache-Control "public";` → Allows caching by any cache (browser, CDN).

**Why:**
These files don’t change often, so long caching improves performance and reduces server load.

---

### **Default location**

```nginx
location / {
    try_files $uri $uri/ =404;
}
```

* `location /` → Applies to everything else.
* `try_files $uri $uri/ =404;` → Try to serve the exact file requested, then the directory, else return 404.

**Why:**
This ensures Nginx only serves real files and returns a **404 Not Found** if it doesn’t exist.

---

## **3️⃣ Performance Optimization Notes (Right Side)**

* **Gzip compression** → Reduces file size before sending, faster load times.
* **Browser caching** → Tells the browser to reuse files it has already downloaded instead of re-fetching.
* **File serving optimization** → Serving static files directly from Nginx is much faster than generating them dynamically.

---

## **4️⃣ How This Helps**

* Reduces server load.
* Speeds up site for repeat visitors.
* Keeps logs cleaner.
* Lets Nginx shine at what it’s best at: **fast static file delivery**.



## **1️⃣ How the “right side” items (Gzip, Browser caching, File serving) relate to the left config**

The **right side** is describing **performance optimization techniques** that can be applied **in or alongside** the `server {}` block on the left.

Let’s map them:

| Right Side Term               | Where It Fits in Config                                                                                                                     | Example Config                                                                                    |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| **Gzip compression**          | Usually in the `http {}` or `server {}` block, **outside** a `location`. It compresses responses before sending to the browser.             | `nginx gzip on; gzip_types text/css application/javascript image/svg+xml; gzip_min_length 1024; ` |
| **Browser caching**           | Already partly implemented in the **static assets location** in the left config with `expires 1y;` and `add_header Cache-Control "public";` | These headers tell the browser to cache files for a set period.                                   |
| **File serving optimization** | Implemented via `try_files` in the **default location** block. It tells Nginx to serve files directly and avoid unnecessary processing.     | `nginx try_files $uri $uri/ =404; `                                                               |

So:

* **Gzip** isn’t explicitly shown on the left — you’d add that as an extra directive.
* **Browser caching** is **already implemented** for static assets in the left config.
* **File serving optimization** is also **already implemented** in the default location.

---

## **2️⃣ Does this `server {}` block need to be inside `http {}`?**

Yes — in the **Nginx config hierarchy**:

```
http {
    server {
        listen 80;
        ...
        location { ... }
    }
}
```

* **`http {}`** → Main HTTP configuration context.
  Inside it, you can have **multiple** `server {}` blocks (one per domain/site).
* **`server {}`** → Defines settings for a specific site/virtual host.
* **`location {}`** → Inside `server {}`, handles specific URL patterns.

---

💡 **Extra note**:
Sometimes, you won’t see the `http {}` in `/etc/nginx/sites-available/mysite.conf` because **the main nginx.conf already has an `http { include /etc/nginx/sites-enabled/*; }`**, so your `server {}` is effectively *already inside* the `http {}` via that include.



---

## **Step 1 – What is a Virtual Host / Server Block?**

It’s just a **set of rules** telling the web server:

> “If a request comes in for this domain (or on this IP/port), serve these files.”

It’s how **one web server** can handle **many different websites**.

---

## **Step 2 – How We Can Separate Websites**

There are 3 main ways:

---

### **1) Name-based hosting** (most common)

* **How**: Same IP address, same port (80/443), but different **domain names**.
* **Hosting example**: Shared hosting on GoDaddy — hundreds of domains on the same IP.
* **Nginx idea**:

```nginx
server {
  listen 80;
  server_name site1.com www.site1.com;
  root /var/www/site1;
}
server {
  listen 80;
  server_name site2.com www.site2.com;
  root /var/www/site2;
}
```

* **When to use**:
  ✅ Public websites with their own domains but no need for separate IPs.

---

### **2) Port-based hosting**

* **How**: Same IP address, but each site listens on a **different port**.
* **Hosting example**: Your provider gives you `example.com:8080` for testing and `example.com:8443` for admin.
* **Nginx idea**:

```nginx
server {
  listen 80; # normal site
  server_name example.com;
  root /var/www/public;
}
server {
  listen 8080; # admin panel
  server_name example.com;
  root /var/www/admin;
}
```

* **When to use**:
  ✅ Testing, private admin pages, internal tools (not for general public).

---

### **3) IP-based hosting**

* **How**: Each site has its **own IP address**, even if on the same server.
* **Hosting example**: Some old SSL hosting before SNI (one IP per SSL certificate).
* **Nginx idea**:

```nginx
server {
  listen 203.0.113.10:80;
  server_name brandA.com;
  root /var/www/brandA;
}
server {
  listen 203.0.113.11:80;
  server_name brandB.com;
  root /var/www/brandB;
}
```

* **When to use**:
  ✅ When you must keep sites **completely separate** for SSL, firewall, or compliance reasons.

---

## **Step 3 – How this connects to Shared Hosting**

* **Shared hosting** → The hosting company sets up **name-based virtual hosts** so many customers share the **same server, IP, and ports** but still get their own domain.
* **Dedicated hosting** → You control the server; you might still use server blocks to manage **your own multiple domains**.

---

💡 **Simple analogy:**

* **Server** = An apartment building.
* **Virtual host / server block** = An apartment unit.
* **Shared hosting** = Many different families (customers) renting different units in the same building.
* **Dedicated hosting** = One family owns the whole building, but can still make separate rooms (server blocks) for different purposes.



# The 3 ways to host multiple sites

1. **Name‑based (most common)** – many domains on **one IP and one port**
2. **Port‑based** – same IP, **different ports**
3. **IP‑based** – **different IPs**, same (or different) ports

---

# 1) Name‑based virtual hosts (server\_name) ✅ default choice

**When to use**

* You own multiple domains/subdomains (e.g., `site1.com`, `api.site1.com`) and want them all on the **same server/IP:80/443**.
* You have TLS certificates per hostname (SNI handles this fine for modern clients).

**Why**

* Easiest to operate. No extra IPs, no odd ports for users.
* Works perfectly with HTTPS using SNI (all modern browsers).

**Config**

```nginx
# /etc/nginx/sites-available/site1.conf
server {
  listen 80;
  server_name site1.com www.site1.com;
  root /var/www/site1;
}

# /etc/nginx/sites-available/site2.conf
server {
  listen 80;
  server_name site2.com www.site2.com;
  root /var/www/site2;
}

# optional catch‑all
server {
  listen 80 default_server;
  server_name _;
  return 444;
}
```

> For HTTPS, add `listen 443 ssl;` and per‑host certs:

```nginx
server {
  listen 443 ssl http2;
  server_name site1.com;
  ssl_certificate     /etc/ssl/site1/fullchain.pem;
  ssl_certificate_key /etc/ssl/site1/privkey.pem;
  root /var/www/site1;
}
```

---

# 2) Port‑based virtual hosts (listen on different ports)

**When to use**

* Internal/admin app that **must not** be on 80/443 (e.g., `:8080`, `:8443`).
* Same domain but **separate apps** by port (e.g., `public:443`, `ops:8443`).
* Temporary side‑by‑side deployments (blue/green) or quick testing without DNS changes.

**Pros**

* No DNS changes required if you connect via `:port`.
* Simple separation for tooling or admin interfaces.

**Cons**

* Users must type the port (ugly); often **blocked by corporate firewalls**.
* Not SEO‑friendly/public‑friendly.

**Config**

```nginx
server {
  listen 443 ssl http2;          # public site
  server_name example.com;
  root /var/www/public;
  # ssl_certificate ...
}

server {
  listen 8443 ssl http2;         # admin portal
  server_name example.com;       # same host, different port
  auth_basic "Restricted";
  auth_basic_user_file /etc/nginx/.htpasswd;
  proxy_pass_request_headers on;
  location / { proxy_pass http://admin_backend; }
}
```

---

# 3) IP‑based virtual hosts (different IPs)

**When to use**

* Regulatory/legacy needs: **one cert per IP** without SNI (very old clients, rare now).
* Clean network isolation: each brand/client gets a **dedicated IP** for logging, ACLs, or firewall policies.
* Multiple TLS stacks that must not share ciphers/ALPN policies.

**Pros**

* Strong separation at the network layer.
* Simplifies per‑IP firewalling and DDoS mitigation rules.

**Cons**

* Requires extra public IPs (cost/scarcity).
* More DNS and routing to manage.

**Config**

```nginx
# bind to IP A
server {
  listen 203.0.113.10:443 ssl http2;
  server_name brandA.com;
  ssl_certificate     /etc/ssl/brandA/fullchain.pem;
  ssl_certificate_key /etc/ssl/brandA/privkey.pem;
  root /var/www/brandA;
}

# bind to IP B
server {
  listen 203.0.113.11:443 ssl http2;
  server_name brandB.com;
  ssl_certificate     /etc/ssl/brandB/fullchain.pem;
  ssl_certificate_key /etc/ssl/brandB/privkey.pem;
  root /var/www/brandB;
}
```

---

## Quick decision guide

| Need                                          | Pick           |
| --------------------------------------------- | -------------- |
| Normal public sites on 80/443                 | **Name‑based** |
| Separate admin/preview/testing without DNS    | **Port‑based** |
| Hard isolation, per‑IP firewalling/legacy TLS | **IP‑based**   |

---

## Bonus: combine with reverse proxying

Often your “site” is really a **proxy** to an app:

```nginx
server {
  listen 443 ssl http2;
  server_name api.example.com;

  location / {
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_pass http://backend_api;   # upstream cluster
  }
}
```

---

## Testing tips

* Simulate SNI host selection:

  ```bash
  curl -I http://127.0.0.1 -H "Host: site1.com"
  curl -I http://127.0.0.1 -H "Host: site2.com"
  ```
* See which server block answered:
  add a unique header per block:

  ```nginx
  add_header X-Site site1 always;
  ```

  then `curl -I https://site1.com`.

---

## Common pitfalls

* **Overlapping listens**: multiple `server {}` on the same `listen` need distinct `server_name`s; define a **`default_server`** to catch stray traffic.
* **Firewall/SELinux**: open ports (80/443/extra) and set SELinux booleans if on RHEL.
* **Certificates**: with name‑based HTTPS, ensure SNI is enabled (default) and the correct cert is set per block.

