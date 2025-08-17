# #!/usr/bin/bash
# 
# 
# # Create main project structure
# mkdir -p nginx-final-project/{docs,scripts,nginx/snippets,nginx/sites-available,nginx/sites-enabled,web/{corporate,admin,static/{css,js}},backend/{app1,app2,app3-backup},ops}
# 
# # Create README and markdown files
# touch nginx-final-project/README.md
# touch nginx-final-project/docs/{architecture.md,troubleshooting.md,maintenance.md}
# 
# # Create placeholder image
# touch nginx-final-project/docs/architecture-diagram.png
# 
# # Create sample scripts
# touch nginx-final-project/scripts/{nginx-log-summary.sh,nginx-health.sh,alert-on-fail.sh}
# 
# # Create Nginx config files
# touch nginx-final-project/nginx/snippets/security-headers.conf
# touch nginx-final-project/nginx/sites-available/{corporate.conf,api-gateway.conf,admin.conf,status.conf}
# touch nginx-final-project/nginx/nginx.conf.sample
# 
# # Create web content
# echo "<h1>Corporate Site</h1>" > nginx-final-project/web/corporate/index.html
# echo "<h1>Admin Panel</h1>" > nginx-final-project/web/admin/index.html
# touch nginx-final-project/web/static/css/style.css
# touch nginx-final-project/web/static/js/app.js
# 
# # Create backend apps
# touch nginx-final-project/backend/app1/{package.json,app.js}
# touch nginx-final-project/backend/app2/{package.json,app.js}
# touch nginx-final-project/backend/app3-backup/{package.json,app.js}
# 
# # Create ops files
# touch nginx-final-project/ops/{hosts-examples.txt,ufw-rules.txt,curl-tests.txt}
# 
# echo "Project structure created successfully."

#!/bin/bash

# 🕵️ Prompt for target directory
read -p "💻 Enter the full path where you want to initialize the nginx-final-project: " TARGET_DIR

# 🧠 Confirm and create
echo "🔍 Scanning target path..."
sleep 1
mkdir -p "$TARGET_DIR/nginx-final-project"/{docs,scripts,nginx/snippets,nginx/sites-available,nginx/sites-enabled,web/{corporate,admin,static/{css,js}},backend/{app1,app2,app3-backup},ops}
# 📄 Create files
touch "$TARGET_DIR/nginx-final-project"/README.md
touch "$TARGET_DIR/nginx-final-project"/docs/{architecture.md,troubleshooting.md,maintenance.md,architecture-diagram.png}
touch "$TARGET_DIR/nginx-final-project"/scripts/{nginx-log-summary.sh,nginx-health.sh,alert-on-fail.sh}
touch "$TARGET_DIR/nginx-final-project"/nginx/snippets/security-headers.conf
touch "$TARGET_DIR/nginx-final-project"/nginx/sites-available/{corporate.conf,api-gateway.conf,admin.conf,status.conf}
touch "$TARGET_DIR/nginx-final-project"/nginx/nginx.conf.sample
echo "<h1>Corporate Site</h1>" > "$TARGET_DIR/nginx-final-project"/web/corporate/index.html
echo "<h1>Admin Panel</h1>" > "$TARGET_DIR/nginx-final-project"/web/admin/index.html
touch "$TARGET_DIR/nginx-final-project"/web/static/css/style.css
touch "$TARGET_DIR/nginx-final-project"/web/static/js/app.js
touch "$TARGET_DIR/nginx-final-project"/backend/app1/{package.json,app.js}
touch "$TARGET_DIR/nginx-final-project"/backend/app2/{package.json,app.js}
touch "$TARGET_DIR/nginx-final-project"/backend/app3-backup/{package.json,app.js}
touch "$TARGET_DIR/nginx-final-project"/ops/{hosts-examples.txt,ufw-rules.txt,curl-tests.txt}

# 🎉 Final message
echo -e "\n🛡️ Mission Complete: nginx-final-project initialized at $TARGET_DIR"
echo "💣 All systems armed with configs, scripts, and backend payloads."
echo "🧠 Time to deploy your ops wizardry. Hack the planet 🌍"

