# 🧪 Lab 6: Setting Up Reverse Proxy

## 📝 Task

> Run a simple backend app, place Nginx in front as a reverse proxy, and verify basic and advanced proxy features (headers, timeouts, health checks).

**Subtasks:**

1. **Task 6.1** – Create a Simple Backend Server
2. **Task 6.2** – Start the Backend Server
3. **Task 6.3** – Configure Nginx Reverse Proxy
4. **Task 6.4** – Enable and Test the Proxy
5. **Task 6.5** – Advanced Proxy Configuration
6. **Task 6.6** – Test Advanced Features

---

## ✅ Steps

1. Create and run a minimal backend (Flask) on port **3000** with `/`, `/api`, and `/health`.
2. Create an Nginx server block that **proxies** `http://<public-ip>` to `http://127.0.0.1:3000`.
3. Verify the proxy works from your browser and with `curl`.
4. Add advanced options (forwarded headers, timeouts, buffering) and re-test.

---

## 💻 Command(s)

```bash
# ========== Task 6.1: Create a Simple Backend Server ==========
# Install Python & pip if needed (Ubuntu)
sudo apt update
sudo apt install -y python3 python3-venv

# Create a folder for the app
mkdir -p ~/flask-backend && cd ~/flask-backend

# Create a virtual environment and install Flask
python3 -m venv .venv
source .venv/bin/activate
pip install flask

# Create app.py
cat > app.py << 'PY'
from flask import Flask, jsonify, request
app = Flask(__name__)

@app.route("/")
def home():
    return "<h1>Backend OK</h1><p>This is Flask on port 3000.</p>"

@app.route("/api")
def api():
    return jsonify({
        "message": "Hello from backend",
        "client_ip": request.headers.get("X-Real-IP"),
        "host": request.headers.get("Host"),
        "forwarded_for": request.headers.get("X-Forwarded-For")
    })

@app.route("/health")
def health():
    return "healthy", 200

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=3000)
PY
```

```bash
# ========== Task 6.2: Start the Backend Server ==========
# Run in the foreground for now
python3 app.py
# Leave this running while you test.
# (If you need another terminal: open a new SSH session.)
```


```bash
# ========== Task 6.3: Configure Nginx Reverse Proxy ==========
# New Nginx site
sudo vim /etc/nginx/sites-available/flask_proxy
```

Paste this minimal proxy:

```nginx
server {
    listen 80;
    server_name ec2-54-146-227-44.compute-1.amazonaws.com;

    # Basic reverse proxy to Flask on 127.0.0.1:3000
    location / {
        proxy_pass         http://localhost:3000;
        proxy_set_header   Host              $host;
        proxy_set_header   X-Real-IP         $remote_addr;
        proxy_set_header   X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Proto $scheme;
    }
}
```

Enable and reload:

```bash
sudo ln -s /etc/nginx/sites-available/flask_proxy /etc/nginx/sites-enabled/flask_proxy
sudo nginx -t
sudo systemctl reload nginx
```

![Flask Proxy](image.png)


```bash
# ========== Task 6.5: Advanced Proxy Configuration ==========
# Edit the same file and replace the server block with this richer version:
sudo nano /etc/nginx/sites-available/reverse_proxy
```

Paste:

```nginx
server {
    listen 80;
    server_name ec2-54-146-227-44.compute-1.amazonaws.com;

    # Increase proxy limits & pass real client info
    location / {
        proxy_pass                          http://localhost:3000;
        proxy_http_version                  1.1;
        proxy_set_header Host               $host;
        proxy_set_header X-Real-IP          $remote_addr;
        proxy_set_header X-Forwarded-For    $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto  $scheme;
        proxy_set_header Connection         "";

        # Timeouts (tune as needed)
        proxy_connect_timeout 5s;
        proxy_send_timeout    30s;
        proxy_read_timeout    30s;

        # Buffering (you can disable if streaming)
        proxy_buffering on;
        proxy_buffers 8 16k;
        proxy_buffer_size 16k;
    }

    # Health check passthrough (useful for load balancers)
    location /health {
        proxy_pass http://localhost:3000/health;
        proxy_set_header Host $host;
    }

    # Optional: serve static assets directly from Nginx (if you have any)
    # location /static/ {
    #     alias /var/www/static/;
    #     expires 7d;
    #     access_log off;
    # }
}
```

Apply the changes:

```bash
sudo nginx -t
sudo systemctl reload nginx
```

![API](image-1.png)
![Health Check](image-2.png)

