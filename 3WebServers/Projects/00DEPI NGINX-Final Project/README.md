# Nginx Final Lab Project

This project is a complete example of an Nginx setup on Ubuntu (EC2).  
It includes multiple websites, load balancing for backend apps, security settings, and monitoring scripts.

---

Here’s a clean and professional Markdown section for your project layout:

---

## 📂 Project Structure

The following structure outlines the organization of the `00DEPI NGINX-Final Project` directory, including assets, backend services, documentation, configuration files, operational scripts, and web content.

```plaintext
00DEPI NGINX-Final Project/
├── Assets/                        # Screenshots and visual references
│   ├── Admin.png
│   ├── API Health.png
│   ├── API Local-1.png
│   ├── API Local-2.png
│   ├── corp.png
│   ├── status.png
│   └── TestSecurityHeader.png
├── backend/                       # Node.js backend apps
│   ├── app1/
│   │   ├── app.js
│   │   └── package.json
│   ├── app2/
│   │   ├── app.js
│   │   └── package.json
│   └── app3-backup/
│       ├── app.js
│       └── package.json
├── docs/                          # Architecture and maintenance documentation
│   ├── architecture-diagram.png
│   ├── architecture.md
│   ├── maintenance.md
│   └── troubleshooting.md
├── etc/
│   └── hosts                     # Custom host mappings
├── nginx/                         # Nginx configuration files
│   ├── nginx.conf.sample
│   ├── sites-available/
│   │   ├── admin.conf
│   │   ├── api-gateway.conf
│   │   ├── corporate.conf
│   │   └── status.conf
│   ├── sites-enabled/
│   └── snippets/
│       └── security-headers.conf
├── ops/                           # Operational notes and firewall rules
│   ├── curl-tests.txt
│   ├── hosts-examples.txt
│   └── ufw-rules.txt
├── README.md                      # Project overview and instructions
├── scripts/                       # Monitoring and alerting scripts
│   ├── alert-on-fail.sh
│   ├── nginx-health.sh
│   └── nginx-log-summary.sh
├── web/                           # Frontend static content
│   ├── admin/
│   │   ├── index.css
│   │   ├── index.html
│   │   └── index.js
│   ├── corporate/
│   │   ├── index.css
│   │   ├── index.html
│   │   └── index.js
│   └── static/
│       ├── css/
│       │   └── style.css
│       └── js/
│           └── app.js
├── Production Style Nginx.md      # Deployment and configuration notes
└── Project Stamp Creator.sh       # Utility script for project stamping
```
---

## 🚀 Quick Start
1. Copy the web content to `/var/www/`
2. Copy configs into `/etc/nginx/sites-available/`
3. Enable sites using symlinks → `/etc/nginx/sites-enabled/`
4. Start Node.js backend apps (`node app.js`)
5. Reload Nginx and test with browser or `curl`

---

## ✅ Features
- **Multiple virtual hosts** (corporate site, admin, API gateway)
- **Load balancing** across Node.js apps (with backup server)
- **Security headers** and **rate limiting**
- **Monitoring scripts** for logs and health checks
- **Optional SSL/TLS** demo

---

## 📚 Documentation
- [`docs/architecture.md`](docs/architecture.md) → system design and diagram
- [`docs/maintenance.md`](docs/maintenance.md) → daily operations, updates, backups
- [`docs/troubleshooting.md`](docs/troubleshooting.md) → fixing common problems

