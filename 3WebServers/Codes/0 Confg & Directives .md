
# Lesson 1 

## **1️⃣ Know the Nginx Config Hierarchy**

Nginx configuration is like a tree:

```
main (nginx.conf)
├── events { }
└── http {
    ├── server { }
    │   ├── location { }
    │   └── location { }
    └── server { }
}
```

🔑 **Why this matters**:
Directives only work in certain **contexts**.
Example:

* `worker_processes` → main context only
* `listen` → server context only
* `proxy_pass` → location context only



## **2️⃣ Understand Directive Types**

* **Simple directives** → single line: `name value;`
* **Block directives** → contain other directives:

  ```nginx
  server {
      listen 80;
      ...
  }
  ```

This helps you quickly **read configs** and know what’s a setting vs. what’s a container.



## **3️⃣ Learn the Core `server {}` Directives**

As a junior, you **must** know these inside-out:

**Binding**

* `listen`
* `server_name`

**Files**

* `root`
* `index`
* `alias` (and difference from root)

**Routing**

* `location` patterns (exact, prefix, regex)
* `try_files`
* `proxy_pass` (reverse proxy basics)

**Logs**

* `access_log`
* `error_log`

**Security**

* `ssl_certificate`, `ssl_certificate_key`
* `add_header`
* `return` for redirects
* `allow` / `deny` for IP control

If you master just these, you can handle **90% of real Nginx configs**.



## **4️⃣ Learn the "include" System**

Nginx doesn’t put all config in one file — it uses `include` statements to **split configuration into multiple files** for easier management.

Example:

```nginx
include /etc/nginx/conf.d/*.conf;
include /etc/nginx/sites-enabled/*;
```

🔑 **Why it matters**:

* On **Ubuntu/Debian** → `sites-available/` (store configs) + `sites-enabled/` (symlinks to active sites)
* On **CentOS/RHEL** → often uses `conf.d/*.conf` instead.



## **5️⃣ Know How Nginx Loads Config**

1. Reads `/etc/nginx/nginx.conf`
2. Includes other files
3. Validates syntax:

   ```bash
   sudo nginx -t
   ```
4. Reloads without downtime:

   ```bash
   sudo systemctl reload nginx
   ```



## **6️⃣ Understand Matching Order**

When a request comes in, Nginx decides:

1. Which `server {}` matches (port + `server_name`)
2. Which `location {}` inside that server matches
3. Which directive inside that location decides the response

📌 **Important**: Regex locations have different priority than prefix matches.
Example:

```nginx
location = /about { }    # exact match, highest priority
location /about { }      # prefix match
location ~* \.php$ { }   # regex match, lowest priority (unless exact match is missing)
```



## **7️⃣ Use Best Practices for Manageable Configs**

* **One site per file** inside `sites-available/`
* Always test before reload:

  ```bash
  sudo nginx -t && sudo systemctl reload nginx
  ```
* Comment important lines (`# this enables HTTPS redirect`)
* Use variables like `$host`, `$uri`, `$remote_addr` to make configs flexible
* Keep SSL settings in a shared file and include it in all HTTPS sites.



## **8️⃣ Practice With Common Tasks**

You should be comfortable writing configs for:

* Serving a **static website**
* Reverse proxy to a backend app
* Redirect HTTP → HTTPS
* Restrict access to `/admin`
* Add caching for static assets
* Custom error pages



## **9️⃣ Learn How to Debug**

* Use `nginx -T` to dump full loaded config.
* Check logs:

  ```bash
  tail -f /var/log/nginx/error.log
  tail -f /var/log/nginx/access.log
  ```
* Use `curl -I` to check headers and confirm your rules are applied.



## **🔟 Build a Mental Model**

Think of Nginx config as **a set of rules arranged in layers**:

* **Global layer**: global behavior & performance tuning.
* **HTTP layer**: applies to all websites.
* **Server layer**: rules for one domain/site.
* **Location layer**: rules for specific URLs or files.


# Lesson 2
## **1️⃣ Big Picture: What is a Directive?**

Think of Nginx as a **machine** that can be programmed by writing rules in its config files.

* Each **directive** is a single **command** or **instruction** that tells Nginx how to behave.
* It’s like a **sentence** in the Nginx "language."



## **2️⃣ Structure of a Directive**

A directive in Nginx has three parts:

| Part           | What It Is                                                     | Example  | Meaning                                       |
| -- | -- | -- |  |
| **Name**       | The keyword that tells Nginx what setting you want to control. | `listen` | “I want to tell you which port to listen on.” |
| **Parameters** | Values or arguments for that setting.                          | `80`     | “Listen on port 80.”                          |
| **Terminator** | Usually a semicolon (`;`) for single-line directives.          | `;`      | Marks the end of the instruction.             |

Example:

```nginx
listen 80;
```

* **`listen`** → directive name
* **`80`** → parameter (port number)
* **`;`** → ends the instruction



## **3️⃣ Types of Directives**

There are **two main types**:

### 1. **Simple directives**

* One line: `name parameter;`
* Used for straightforward settings.
* Example:

```nginx
server_tokens off;
```

Means: “Hide the Nginx version number.”



### 2. **Block directives**

* Name + parameters + `{ ... }` block that contains **other directives** inside.
* Used for settings that group related rules together.
* Example:

```nginx
server {
    listen 80;
    server_name example.com;
}
```

Here:

* `server` → block directive name.
* `{ ... }` → contains **child directives** (`listen`, `server_name`).



## **4️⃣ Contexts: Where a Directive Can Be Used**

Directives can only appear in certain **contexts** (scopes).
Think of contexts like **folders** in a hierarchy — each context can hold certain directives.

The main Nginx contexts:

| **Context**          | **Purpose**                     | **Example Directives**                |
|----------------------|----------------------------------|----------------------------------------|
| **main** (top level) | Global settings for Nginx.       | `worker_processes`, `pid`             |
| **events**           | How Nginx handles connections.   | `worker_connections`                  |
| **http**             | All HTTP-related settings.       | `server`, `gzip`, `log_format`        |
| **server**           | Virtual host/site settings.      | `listen`, `server_name`, `root`       |
| **location**         | URL/path-specific rules.         | `proxy_pass`, `try_files`             |




## **5️⃣ How Nginx Reads Directives**

When you start or reload Nginx:

1. It opens `nginx.conf`.
2. Reads directives **top to bottom**.
3. Applies them **in context order**:

   * `main` → `events` → `http` → `server` → `location`
4. Merges child directives with parent contexts if allowed.



## **6️⃣ Real Example With Tear Down**

```nginx
http {                                # HTTP context
    server {                          # Server block
        listen 80;                    # Simple directive: listen on port 80
        server_name example.com;      # Simple directive: respond to this domain
        root /var/www/html;           # Simple directive: serve files from this folder

        location /images/ {           # Location block directive
            autoindex on;             # Simple directive: show directory listing
        }
    }
}
```

**Hierarchy here:**

* `http` block contains → `server` block
* `server` block contains → `listen`, `server_name`, `root`, `location`
* `location` block contains → `autoindex`



## **7️⃣ Why Directives Matter**

* They are the **building blocks** of your configuration.
* Each one changes **one aspect** of how Nginx works.
* Understanding the name, parameters, and where it’s allowed is the key to mastering Nginx configs.



## **8️⃣ Mental Model**

Think of **directives** as:

* **Name** → what you want to change
* **Parameters** → how you want to change it
* **Context** → where it applies
* **Block/Simple** → whether it contains other rules or not



Alright — let’s **zoom in** specifically on the **`server` block** in Nginx and fully tear it down into its **core directives** and **common sub-directives**, so you get the *full concept* plus examples.



## **1️⃣ The Server Block — Big Picture**

A **`server` block** in Nginx defines a **virtual host** — basically, the rules for **one website/app** that Nginx serves.
Inside a `server` block, you tell Nginx:

* **Where** to listen (IP/port/protocol)
* **Which domains** this config applies to
* **Where** to find the website’s files
* **How** to handle different paths/URLs
* **Special settings** like redirects, SSL certs, caching



## **2️⃣ Core Directives in a `server` block**

### **`listen`**

* **Purpose:** Define which IP/port this server responds to.
* **Forms:**

  ```nginx
  listen 80;                 # HTTP on all IPs
  listen 443 ssl;            # HTTPS with SSL
  listen 192.168.1.10:8080;  # Specific IP and port
  listen [::]:80;            # IPv6
  ```
* **Notes:**

  * You can add `default_server` to catch all unmatched requests.
  * For HTTPS, add `ssl` and SSL cert directives.



### **`server_name`**

* **Purpose:** Match the domain(s) for this block.
* **Forms:**

  ```nginx
  server_name example.com www.example.com;
  server_name *.example.com;       # wildcard subdomains
  server_name ~^shop\d+\.example\.com$;  # regex
  server_name _;                   # catch-all
  ```
* **Notes:** Used for **name-based virtual hosting**.



### **`root`**

* **Purpose:** Define the base directory for serving files.
* **Example:**

  ```nginx
  root /var/www/example;
  ```
* **Notes:**

  * Affects file lookups in this `server` or a `location` (unless overridden).
  * Combined with `index` to choose default file.



### **`index`**

* **Purpose:** Sets the default file when a directory is requested.
* **Example:**

  ```nginx
  index index.html index.htm;
  ```
* **Notes:**
  If `/` is requested and `/index.html` exists, it’s served automatically.



## **3️⃣ Common Sub-Directives / Child Settings**

These often appear **inside `server`** or inside **`location` blocks** within `server`.



### **`location`**

* **Purpose:** Match a specific URL path or pattern and apply settings to it.
* **Forms:**

  ```nginx
  location /images/ { ... }        # Prefix match
  location = /favicon.ico { ... }  # Exact match
  location ~* \.jpg$ { ... }       # Regex match, case-insensitive
  ```
* **Inside location** you can:

  * Override `root` or `index`
  * Use `proxy_pass` to send to a backend
  * Set caching or security headers
  * Restrict access



### **`error_page`**

* **Purpose:** Custom error handling.
* **Example:**

  ```nginx
  error_page 404 /custom_404.html;
  error_page 500 502 503 504 /50x.html;
  ```



### **`access_log` / `error_log`**

* **Purpose:** Control logging for this server.
* **Example:**

  ```nginx
  access_log /var/log/nginx/example_access.log;
  error_log /var/log/nginx/example_error.log warn;
  ```



### **`ssl_certificate` / `ssl_certificate_key`**

* **Purpose:** HTTPS/TLS configuration.
* **Example:**

  ```nginx
  listen 443 ssl http2;
  ssl_certificate     /etc/ssl/example/fullchain.pem;
  ssl_certificate_key /etc/ssl/example/privkey.pem;
  ```



### **`rewrite`**

* **Purpose:** Redirect/rewrite URLs.
* **Example:**

  ```nginx
  rewrite ^/old-page$ /new-page permanent;
  ```



### **`return`**

* **Purpose:** Immediately return a status code and optional text/redirect.
* **Example:**

  ```nginx
  return 301 https://$host$request_uri;   # Force HTTPS
  return 444;  # Close connection (security trick)
  ```



### **`limit_req` / `limit_conn`**

* **Purpose:** Limit rate or connections per client.
* **Example:**

  ```nginx
  limit_req zone=api burst=10 nodelay;
  ```



### **`add_header`**

* **Purpose:** Add HTTP response headers.
* **Example:**

  ```nginx
  add_header X-Frame-Options "SAMEORIGIN" always;
  ```



## **4️⃣ Example Complete `server` Block**

```nginx
server {
    listen 80;
    server_name example.com www.example.com;
    root /var/www/example;
    index index.html index.htm;

    access_log /var/log/nginx/example_access.log;
    error_log  /var/log/nginx/example_error.log warn;

    location / {
        try_files $uri $uri/ =404;
    }

    location /images/ {
        expires 30d;
        add_header Cache-Control "public";
    }

    error_page 404 /custom_404.html;
    location = /custom_404.html {
        internal;
    }
}
```



# Lesson 3 
## **5️⃣ How It Fits Into Nginx’s Hierarchy**

```
http {
    server {                   # This is one site
        listen ...
        server_name ...
        root ...
        location { ... }       # Handle a specific URL pattern
    }
    server { ... }             # Another site
}
```





# **Nginx `server {}` Full Tear-Down**



## **Top Layer — Horizontal Overview**

Inside a `server` block, you can group directives into **5 main categories**:

| **Category**                 | **Purpose**                                              | **Common Directives**                                                              |
|-----------------------------|----------------------------------------------------------|-------------------------------------------------------------------------------------|
| **Binding**                 | Tell Nginx which IP/port/protocol to listen on           | `listen`, `server_name`                                                            |
| **Document Root & Defaults**| Where files are stored and which is the default file     | `root`, `index`, `alias`                                                           |
| **Logging & Monitoring**    | Where to log traffic and errors                          | `access_log`, `error_log`, `log_format`                                            |
| **Content Handling**        | How to handle requests for certain paths                 | `location`, `try_files`, `proxy_pass`, `rewrite`, `return`                         |
| **Security & Limits**       | Headers, HTTPS, rate limits, access controls             | `ssl_certificate`, `ssl_certificate_key`, `add_header`, `limit_req`, `allow`, `deny` |



## **Vertical Zoom-In: Each Category in Detail**



### **1️⃣ Binding**

Defines how Nginx matches incoming requests to this `server` block.

#### **`listen`**

```nginx
listen 80;                 # HTTP
listen 443 ssl http2;      # HTTPS
listen 192.168.1.10:8080;  # Specific IP and port
listen [::]:80;            # IPv6
listen 80 default_server;  # Catch unmatched requests
```

📌 **Tip**: For HTTPS, add `ssl` and link your cert.

#### **`server_name`**

```nginx
server_name example.com www.example.com;   # Exact domains
server_name *.example.com;                 # Wildcard subdomains
server_name ~^shop\d+\.example\.com$;      # Regex match
server_name _;                             # Catch-all
```

📌 **Use case**: Name-based hosting — one IP, many domains.



### **2️⃣ Document Root & Defaults**

Where Nginx finds files.

#### **`root`**

```nginx
root /var/www/example;
```

Serves files from `/var/www/example`.

#### **`index`**

```nginx
index index.html index.htm index.php;
```

Default file served when only a directory is requested.

#### **`alias`**

```nginx
location /downloads/ {
    alias /data/files/;
}
```

📌 Difference from `root`: `alias` replaces the full location path.



### **3️⃣ Logging & Monitoring**

Control what’s recorded.

#### **`access_log`**

```nginx
access_log /var/log/nginx/example_access.log;
```

📌 Tracks every request (IP, time, URL, status code, etc.).

#### **`error_log`**

```nginx
error_log /var/log/nginx/example_error.log warn;
```

📌 Logs issues (missing files, permission errors, upstream errors).

#### **`log_format`**

```nginx
log_format custom '$remote_addr - $host [$time_local] "$request" $status';
access_log /var/log/nginx/example_access.log custom;
```

📌 Create a custom log layout.



### **4️⃣ Content Handling**

Tells Nginx how to respond to different requests.

#### **`location`**

```nginx
location / {
    try_files $uri $uri/ =404;
}
location /images/ {
    expires 30d;
}
location ~* \.php$ {
    fastcgi_pass unix:/run/php/php7.4-fpm.sock;
}
```

📌 Match by prefix, exact path, or regex.

#### **`try_files`**

```nginx
try_files $uri $uri/ /index.php?$query_string;
```

📌 Check multiple files before falling back.

#### **`proxy_pass`**

```nginx
location /api/ {
    proxy_pass http://backend_server;
}
```

📌 Sends request to another server (reverse proxy).

#### **`rewrite`**

```nginx
rewrite ^/old$ /new permanent;
```

📌 Change URL path before processing.

#### **`return`**

```nginx
return 301 https://$host$request_uri;
```

📌 Immediately send a response (redirect or status).



### **5️⃣ Security & Limits**

Protect your site.

#### **HTTPS/TLS**

```nginx
listen 443 ssl http2;
ssl_certificate     /etc/ssl/example/fullchain.pem;
ssl_certificate_key /etc/ssl/example/privkey.pem;
```

#### **`add_header`**

```nginx
add_header X-Frame-Options "SAMEORIGIN" always;
add_header X-Content-Type-Options "nosniff" always;
```

#### **`limit_req`**

```nginx
limit_req zone=api burst=10 nodelay;
```

📌 Rate limit requests per IP.

#### **Access Control**

```nginx
allow 192.168.1.0/24;
deny all;
```

📌 Restrict by IP.



## **6️⃣ Full Example Server Block with All Concepts**

```nginx
server {
    listen 80;
    server_name example.com www.example.com;
    root /var/www/example;
    index index.html index.htm;

    access_log /var/log/nginx/example_access.log;
    error_log  /var/log/nginx/example_error.log warn;

    # Security Headers
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;

    # Main site content
    location / {
        try_files $uri $uri/ =404;
    }

    # Static content optimization
    location /images/ {
        expires 30d;
        add_header Cache-Control "public";
    }

    # Reverse proxy for API
    location /api/ {
        proxy_pass http://backend_server;
    }

    # Custom error page
    error_page 404 /custom_404.html;
    location = /custom_404.html {
        internal;
    }
}
```



## **7️⃣ Horizontal + Vertical View**

If you imagine this like a **tree**:

```
server
├── Binding
│   ├── listen
│   └── server_name
├── Root & Defaults
│   ├── root
│   ├── index
│   └── alias
├── Logging
│   ├── access_log
│   ├── error_log
│   └── log_format
├── Content Handling
│   ├── location
│   │   ├── try_files
│   │   ├── proxy_pass
│   │   ├── rewrite
│   │   └── return
├── Security & Limits
│   ├── ssl_certificate / ssl_certificate_key
│   ├── add_header
│   ├── limit_req
│   └── allow / deny
```



# Lesson 4

## **Basic Secturity**  what the snippet does

```nginx
# Allow specific IPs only
location /admin {
  allow 192.168.1.0/24;
  allow 10.0.0.0/8;
  deny  all;
}

# Deny bad user agents
if ($http_user_agent ~* (nmap|wget|curl)) {
  return 403;
}
```

## 1) `location /admin { ... }`

A **location block** that applies rules to `/admin` URLs.

### `allow` / `deny`

* **What:** Simple ACL by client IP/CIDR.
* **How Nginx evaluates:** first matching **allow** wins; if no allow matched, the final `deny all;` blocks everyone else.
* **Why:** Lock down sensitive paths (admin panels, health endpoints) to known networks.

**Common variations to add & when:**

```nginx
# Allow specific public IPs (e.g., office or VPN egress IPs)
allow 203.0.113.15;
allow 198.51.100.0/24;
deny  all;  # always finish with this
```

* **Use when:** You know the fixed egress IPs of your org/VPN.

```nginx
# IPv6 too
allow 2001:db8:abcd::/48;
deny  all;
```

* **Use when:** Your clients use IPv6.

```nginx
# Private internal-only section (inside an internal LB/VPN)
allow 10.0.0.0/8;
allow 172.16.0.0/12;
allow 192.168.0.0/16;
deny  all;
```

* **Use when:** Only internal networks should reach it.

```nginx
# Combine with auth (two gates)
auth_basic "Restricted";
auth_basic_user_file /etc/nginx/.htpasswd;
allow 203.0.113.15;
deny  all;      # IP gate + password gate
```

* **Use when:** You want **IP allowlist + password** (belt & suspenders).

```nginx
# Rate-limit on admin to slow brute force
limit_req zone=login burst=10 nodelay;  # zone defined in http{}
```

* **Use when:** Protect admin forms/APIs from abuse.

> Tip: Put `allow/deny` **early** in the `location` to save work before proxying.



## 2) `if ($http_user_agent ~* (nmap|wget|curl)) { return 403; }`

* **What:** If the **User‑Agent** header matches the regex (case‑insensitive), return **403 Forbidden**.
* **Why:** Block obvious scanners/scrapers.
* **Caveat:** The `if` directive inside `location` is OK for **simple returns**, but don’t build complex logic with `if` (Nginx “if is evil” pitfalls). Use `map` for larger rules.

**Safer, scalable pattern using `map`:**

```nginx
# in http {}
map $http_user_agent $block_ua {
  default 0;
  ~*(nmap|dirbuster|nikto|curl|wget) 1;
}

# in server or location
if ($block_ua) { return 403; }
```

* **Use when:** You have a growing list of bad UAs and want to manage it cleanly.

**Add-ons you’ll often want:**

```nginx
# Return 444 (drop connection) to be stealthier than 403
if ($block_ua) { return 444; }
```

* **Use when:** You want to silently drop obvious scanners.



# Other highly useful access‑control directives (what to add, why, when)

## A) `satisfy any` (mix IP allowlist + basic auth)

```nginx
location /admin {
  satisfy any;                     # either rule can pass
  allow 203.0.113.15;              # IP allow
  deny  all;

  auth_basic "Restricted";         # OR valid password
  auth_basic_user_file /etc/nginx/.htpasswd;
}
```

* **Why:** Let employees in from office IP without password; everyone else needs a password.
* **When:** Convenience for trusted networks.

## B) `auth_request` (delegate auth to SSO/Portal)

```nginx
location /admin/ {
  auth_request /_auth_check;       # subrequest to check login/session
  proxy_pass http://admin_backend;
}

location = /_auth_check {
  internal;
  proxy_pass http://auth_service/verify;
}
```

* **Why:** Centralize auth with a microservice or SSO.
* **When:** Enterprises, SSO/OAuth/OpenID workflows.

## C) Block by country / IP lists (`geo`, `map`)

```nginx
# with a GeoIP data source or a static list
geo $block_country {
  default 0;
  CN 1;
  RU 1;
}
server {
  if ($block_country) { return 403; }
}
```

* **Why:** Compliance or attack mitigation.
* **When:** You must allow/deny by region.

## D) Real client IP behind a proxy/CDN (`real_ip` module)

```nginx
# http {}
set_real_ip_from  103.21.244.0/22;    # Cloudflare, etc.
real_ip_header    X-Forwarded-For;
real_ip_recursive on;
```

* **Why:** So `allow/deny` and rate limits use the **real client IP**, not the CDN/LB IP.
* **When:** You’re behind Cloudflare/ALB/NGINX reverse proxy.

## E) Rate & connection limits for hot paths

```nginx
# http {}
limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;
limit_conn_zone $binary_remote_addr zone=perip:10m;

# server/location
location /api/ {
  limit_req  zone=api burst=20 nodelay;
  limit_conn zone=perip 20;
}
```

* **Why:** Throttle abusive clients, protect backends.
* **When:** APIs, login endpoints, search endpoints.

## F) Quick “private mode” for a site

```nginx
# server-wide lockdown
allow 203.0.113.0/24;
deny  all;
```

* **Why:** Staging sites, pre‑launch environments.
* **When:** Only testers/office should see it.



# Where to place these

* Global definitions (zones, maps, real\_ip, big UA lists): **`http {}`** in `nginx.conf` (or a file included from it).
* Path/site rules (allow/deny, auth\_basic, limit\_req application): **inside the target `server {}` or `location {}`**.
* Always test & reload:

```bash
sudo nginx -t && sudo systemctl reload nginx
```



# Practical mini‑recipes (copy/paste)

**Lock down `/admin` to office IP + password for others**

```nginx
location /admin {
  satisfy any;
  allow 203.0.113.15;
  deny  all;

  auth_basic "Restricted";
  auth_basic_user_file /etc/nginx/.htpasswd;
}
```

**Block basic scanners globally**

```nginx
# http {}
map $http_user_agent $block_ua {
  default 0;
  ~*(nmap|nikto|dirbuster|acunetix|curl|wget) 1;
}
server {
  if ($block_ua) { return 444; }
}
```

**Harden `/api/` with rate limiting**

```nginx
# http {}
limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;

# server/location
location /api/ {
  limit_req zone=api burst=20 nodelay;
  proxy_pass http://backend;
}
```




