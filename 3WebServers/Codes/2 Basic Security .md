

# What the snippet is doing (concept first)

1. **Hide Nginx version**

* `server_tokens off;`
* Removes the “nginx/1.x.x” banner from error pages & the `Server` header.
* Purpose: reduce info‑leakage for attackers fingerprinting your stack.

2. **Security headers (browser safeguards)**
   These are HTTP response headers. They don’t secure your server by themselves, but they tell the **browser** to behave more safely.

* `X-Frame-Options "SAMEORIGIN"`
  Blocks clickjacking by preventing your pages from being embedded in iframes on other sites (only your own origin can frame it).

* `X-Content-Type-Options "nosniff"`
  Tells browsers **not** to guess MIME types. If you say a file is `text/css`, the browser won’t try to treat it as JS. Prevents some injection tricks.

* `X-XSS-Protection "1; mode=block"`
  Legacy header for old IE/Edge engines. Modern Chromium/Firefox rely on CSP instead. Harmless to keep; consider CSP for real XSS mitigation.

* `Referrer-Policy "no-referrer-when-downgrade"`
  Controls how much of the URL is sent as the `Referer` to other sites. This policy sends referrer only over HTTPS→HTTPS (not to HTTP). Safer options today are often `strict-origin-when-cross-origin` or `no-referrer`.

> Tip: For modern apps, add a **Content-Security-Policy (CSP)** header too. It’s the strongest browser-side defense against XSS.

3. **Rate limiting (protect your origin)**

* `limit_req_zone` defines a **shared memory zone** and a rule: “how many requests per key per second are allowed.”
* `limit_req` **applies** that rule inside a `server` or `location`.

In the slide:

* `limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;`

  * Key: `$binary_remote_addr` (client IP), efficient binary form
  * Zone name: `api`
  * Zone size: `10m` (\~160k states; plenty for many IPs)
  * Rate: `10 requests/second` per IP
* `limit_req zone=api burst=20 nodelay;`

  * Allows short bursts above the rate (queue up to 20)
  * `nodelay` processes queued requests immediately until the burst is exhausted; without it, requests are smoothed/delayed

---

# Where do these lines go?

Nginx has **scopes (contexts)**. The correct placement matters.

* **`http { ... }`**: global HTTP settings; affect all virtual hosts (best place for defaults).
* **`server { ... }`**: per‑site settings (your domain).
* **`location { ... }`**: per‑path or API endpoint settings.

Recommended placement:

```nginx
# /etc/nginx/nginx.conf  (or in a file included from it)

http {
  # 1) Hide version (global)
  server_tokens off;

  # 2) Security headers (global defaults)
  # Using 'always' ensures headers are added even on 4xx/5xx responses.
  add_header X-Frame-Options "SAMEORIGIN" always;
  add_header X-Content-Type-Options "nosniff" always;
  add_header X-XSS-Protection "1; mode=block" always;
  add_header Referrer-Policy "no-referrer-when-downgrade" always;

  # (Optional but recommended) A basic CSP starter:
  # add_header Content-Security-Policy "default-src 'self';" always;

  # 3) Define a rate-limit zone (global)
  limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;

  # Include your sites (Debian/Ubuntu style)
  include /etc/nginx/sites-enabled/*;
}
```

Then, inside a specific **site**:

```nginx
# /etc/nginx/sites-available/my-site.conf
server {
  listen 80;
  server_name example.com;
  root /var/www/example;

  # Apply the API rate limit only to /api
  location /api/ {
    limit_req zone=api burst=20 nodelay;
    proxy_pass http://backend_api;
  }

  # If you need different headers for this site or location,
  # you can add/override add_header here too.
}
```

> Why not put `limit_req_zone` in `server {}`?
> Because it must be defined **once** at `http {}` scope to create the shared zone. Then you attach it with `limit_req` wherever you need it.

---

# Common gotchas (save you time)

* **Header inheritance**: `add_header` does **not** inherit into sub‑blocks unless repeated. If you set headers in `server {}`, and then create a `location {}` with its own `add_header`, you must re‑add the defaults or they’ll disappear for that location. Putting defaults at `http {}` is safer.
* **`always` flag**: Without `always`, headers are only added to **successful** responses (2xx/3xx). Use `always` so errors also carry the headers.
* **Order of includes**: On Debian/Ubuntu, `nginx.conf` includes `sites-enabled/*` inside the `http {}`. On RHEL/CentOS (nginx.org packages), you may use `conf.d/*.conf` instead.
* **Rate limits per IP**: Beware of proxies/CDNs. If you’re behind a reverse proxy, make sure `$binary_remote_addr` really tracks client IP (configure `real_ip_module` / `X-Forwarded-For` first).

---

# Quick copy‑paste templates

## Minimal global hardening

```nginx
http {
  server_tokens off;

  add_header X-Frame-Options "SAMEORIGIN" always;
  add_header X-Content-Type-Options "nosniff" always;
  add_header X-XSS-Protection "1; mode=block" always;
  add_header Referrer-Policy "no-referrer-when-downgrade" always;

  # Rate limit definition (10 rps per IP)
  limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;

  include /etc/nginx/sites-enabled/*;
}
```

## Apply rate limit only to /api

```nginx
server {
  listen 80;
  server_name example.com;

  location /api/ {
    limit_req zone=api burst=20 nodelay;
    proxy_pass http://backend_api;
  }
}
```