🔧 A. Install Nginx
bash
sudo apt update
sudo apt install nginx -y


📁 B. Create your site directory and a simple page
bash
sudo mkdir -p /var/www/my_site
echo "<h1>Hello from Nginx!</h1>" | sudo tee /var/www/my_site/index.html

⚙️ C. Configure Nginx site
Create file: /etc/nginx/sites-available/my_site

server {
    listen 80;
    server_name mysite.local;

    root /var/www/my_site;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}

🔗 D. Enable it
bash

sudo ln -s /etc/nginx/sites-available/my_site /etc/nginx/sites-enabled/


sudo nginx -t         # test config
sudo systemctl reload nginx


🧪 E. Add to /etc/hosts (for local test)
bash
sudo echo "127.0.0.1 mysite.local" >> /etc/hosts

🌐 Open in browser:
http://mysite.local




Perfect! Since you already have IIS /Nginx running on port 80, you’ll want to run Nginx on a different port — like 888 — to avoid conflict.

Here’s a step-by-step guide to run Nginx on port 888 and show a custom "Welcome" page.

✅ 1. 📁 Create Your Website Directory
bash

sudo mkdir -p /var/www/nginx_welcome
echo "<h1>Welcome to Nginx on port 888 </h1>" | sudo tee /var/www/nginx_welcome/index.html


✅ 2. ⚙️ Configure a New Nginx Server Block
Create a file called:
bash
sudo nano /etc/nginx/sites-available/nginx_888


Paste this inside:
server {
    listen 888;
    server_name localhost;

    root /var/www/nginx_welcome;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}

✅ 3. 🔗 Enable the Config
bash
sudo ln -s /etc/nginx/sites-available/nginx_888 /etc/nginx/sites-enabled/
Test syntax:

bash
sudo nginx -t
Then reload Nginx:

bash
sudo systemctl reload nginx


✅ 4. 🧪 Test in Browser
Visit:
http://localhost:888
You should see:
Welcome to Nginx on port 888 🎉

✅ 5. 💡 Optional: Allow Port 888 in Firewall (If on Windows WSL or server)
If you're using UFW (Uncomplicated Firewall):

bash
sudo ufw allow 888/tcp
If on Windows:
Open Windows Defender Firewall
Add Inbound Rule to allow TCP port 888