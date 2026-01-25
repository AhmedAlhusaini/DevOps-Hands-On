# Old Instructor One
=======================
 
# #!/bin/bash 
# 
# cd /tmp
# wget https://github.com/prometheus/prometheus/releases/download/v2.35.0/prometheus-2.35.0.linux-amd64.tar.gz
# 
# sudo useradd --no-create-home --shell /bin/false prometheus
# 
# 
# tar -xzf prometheus-2.35.0.linux-amd64.tar.gz
# sudo mv prometheus-2.35.0.linux-amd64/prometheus /usr/local/bin/
# sudo mv prometheus-2.35.0.linux-amd64/promtool /usr/local/bin/
# 
# sudo chown prometheus:prometheus /usr/local/bin/prometheus
# sudo chown prometheus:prometheus /usr/local/bin/promtool
# 
# sudo mkdir /etc/prometheus
# sudo mkdir /var/lib/prometheus
# sudo chown prometheus:prometheus /etc/prometheus
# sudo chown prometheus:prometheus /var/lib/prometheus
# 
# 
# sudo mv prometheus-2.35.0.linux-amd64/console* /etc/prometheus
# sudo mv prometheus-2.35.0.linux-amd64/prometheus.yml /etc/prometheus
# sudo chown -R prometheus:prometheus /etc/prometheus
# 
# sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml
# 
# sudo tee /etc/systemd/system/prometheus.service <<EOF
# [Unit]
# Description=Prometheus
# Wants=network-online.target
# After=network-online.target
# 
# [Service]
# User=prometheus
# Group=prometheus
# Type=simple
# ExecStart=/usr/local/bin/prometheus \
#     --config.file /etc/prometheus/prometheus.yml \
#     --storage.tsdb.path /var/lib/prometheus/ \
#     --web.console.templates=/etc/prometheus/consoles \
#     --web.console.libraries=/etc/prometheus/console_libraries
# 
# [Install]
# WantedBy=multi-user.target
# EOF
# 
# sudo systemctl daemon-reload
# sudo systemctl start prometheus
# 
# sudo apt-get install -y apt-transport-https
# sudo apt-get install -y software-properties-common wget
# 
# sudo systemctl daemon-reload
# sudo systemctl start prometheus
# sudo systemctl enable prometheus
# 
# # Node Expoeter 
# 
# wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
# sudo useradd --no-create-home --shell /bin/false node_exporter
# 
# tar -xvf node_exporter-1.3.1.linux-amd64.tar.gz
# cd node_exporter-1.3.1.linux-amd64
# 
# sudo mv node_exporter /usr/local/bin/
# sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
# 
# sudo tee /etc/systemd/system/node_exporter.service <<EOF
# [Unit]
# Description=Node Exporter
# After=network.target
# 
# [Service]
# User=node_exporter
# Group=node_exporter
# Type=simple
# ExecStart=/usr/local/bin/node_exporter
# 
# [Install]
# WantedBy=multi-user.target
# EOF
# 
# sudo systemctl daemon-reload
# sudo systemctl start node_exporter
# sudo systemctl enable node_exporter
# 
# echo "Prometheus and Node Exporter has been installed and started."



# Recent Script 
Prometheus → v3.9.1 (your latest version).
Node Exporter → v1.10.2 (latest release).

================

#!/bin/bash -e
# Prometheus + Node Exporter installation script for Linux (EC2/Amazon Linux/Ubuntu)
# Installs Prometheus v3.9.1 and Node Exporter v1.10.2
# Sets up directories, users, and systemd services.
# Logs written to /var/log/prometheus-install.log


LOGFILE="/var/log/prometheus-install.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "=== Starting Prometheus + Node Exporter installation at $(date) ==="

cd /tmp

# -------------------------------
# Step 1: Download Prometheus
# -------------------------------
echo "[INFO] Downloading Prometheus v3.9.1..."
wget https://github.com/prometheus/prometheus/releases/download/v3.9.1/prometheus-3.9.1.linux-amd64.tar.gz \
  || curl -LO https://github.com/prometheus/prometheus/releases/download/v3.9.1/prometheus-3.9.1.linux-amd64.tar.gz

if [ ! -f prometheus-3.9.1.linux-amd64.tar.gz ]; then
  echo "[ERROR] Prometheus tarball not downloaded!"
  exit 1
fi

# -------------------------------
# Step 2: Create Prometheus user
# -------------------------------
if id "prometheus" &>/dev/null; then
  echo "[INFO] User prometheus already exists."
else
  sudo useradd --no-create-home --shell /bin/false prometheus
  echo "[INFO] User prometheus created."
fi

# -------------------------------
# Step 3: Extract Prometheus
# -------------------------------
echo "[INFO] Extracting Prometheus..."
tar -xzf prometheus-3.9.1.linux-amd64.tar.gz

# -------------------------------
# Step 4: Install Prometheus binaries
# -------------------------------
echo "[INFO] Installing Prometheus binaries..."
sudo cp prometheus-3.9.1.linux-amd64/prometheus /usr/local/bin/
sudo cp prometheus-3.9.1.linux-amd64/promtool /usr/local/bin/
sudo chown prometheus:prometheus /usr/local/bin/prometheus /usr/local/bin/promtool

# -------------------------------
# Step 5: Config + data directories
# -------------------------------
echo "[INFO] Setting up Prometheus directories..."
sudo mkdir -p /etc/prometheus /var/lib/prometheus
sudo cp prometheus-3.9.1.linux-amd64/prometheus.yml /etc/prometheus/
sudo chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus

# -------------------------------
# Step 5b: Append Node Exporter  job
# -------------------------------
echo "[INFO] Adding Node Exporter  job to prometheus.yml..."
sudo tee -a /etc/prometheus/prometheus.yml > /dev/null <<EOF

  - job_name: 'Self Node Exporter'
    static_configs:
      - targets: ['localhost:9100']
EOF


# -------------------------------
# Step 6: Prometheus systemd service
# -------------------------------
echo "[INFO] Creating Prometheus systemd service..."
sudo tee /etc/systemd/system/prometheus.service > /dev/null <<EOF
[Unit]
Description=Prometheus Monitoring
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \\
  --config.file=/etc/prometheus/prometheus.yml \\
  --storage.tsdb.path=/var/lib/prometheus/

Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# -------------------------------
# Step 7: Download Node Exporter
# -------------------------------
echo "[INFO] Downloading Node Exporter v1.10.2..."
wget https://github.com/prometheus/node_exporter/releases/download/v1.10.2/node_exporter-1.10.2.linux-amd64.tar.gz \
  || curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.10.2/node_exporter-1.10.2.linux-amd64.tar.gz

if [ ! -f node_exporter-1.10.2.linux-amd64.tar.gz ]; then
  echo "[ERROR] Node Exporter tarball not downloaded!"
  exit 1
fi

# -------------------------------
# Step 8: Create Node Exporter user
# -------------------------------
if id "node_exporter" &>/dev/null; then
  echo "[INFO] User node_exporter already exists."
else
  sudo useradd --no-create-home --shell /bin/false node_exporter
  echo "[INFO] User node_exporter created."
fi

# -------------------------------
# Step 9: Extract + install Node Exporter
# -------------------------------
echo "[INFO] Extracting Node Exporter..."
tar -xzf node_exporter-1.10.2.linux-amd64.tar.gz
sudo cp node_exporter-1.10.2.linux-amd64/node_exporter /usr/local/bin/
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

# -------------------------------
# Step 10: Node Exporter systemd service
# -------------------------------
echo "[INFO] Creating Node Exporter systemd service..."
sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOF
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# -------------------------------
# Step 11: Reload systemd + start services
# -------------------------------
echo "[INFO] Starting services..."
sudo systemctl daemon-reload
sudo systemctl restart prometheus
sudo systemctl enable prometheus node_exporter
sudo systemctl start prometheus node_exporter

sleep 3

# Validate services
if systemctl is-active --quiet prometheus; then
  echo "[SUCCESS] Prometheus is running."
else
  echo "[ERROR] Prometheus failed to start!"
  sudo journalctl -u prometheus --no-pager | tail -20
fi

if systemctl is-active --quiet node_exporter; then
  echo "[SUCCESS] Node Exporter is running."
else
  echo "[ERROR] Node Exporter failed to start!"
  sudo journalctl -u node_exporter --no-pager | tail -20
fi

echo "=== Installation completed successfully at $(date) ==="
echo "[INFO] Logs available at $LOGFILE"













## Version 02 To aviod Temp Limit Space 


#!/bin/bash -e
# Prometheus + Node Exporter installation script for Linux (EC2/Amazon Linux/Ubuntu)
# Installs Prometheus v3.9.1 and Node Exporter v1.10.2
# Sets up directories, users, and systemd services.
# Logs written to /var/log/prometheus-install.log

LOGFILE="$HOME/prometheus-install.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "=== Starting Prometheus + Node Exporter installation at $(date) ==="

WORKDIR="/opt/installers"
sudo mkdir -p $WORKDIR
cd $WORKDIR

# -------------------------------
# Step 1: Download Prometheus
# -------------------------------
echo "[INFO] Downloading Prometheus v3.9.1..."
wget -q https://github.com/prometheus/prometheus/releases/download/v3.9.1/prometheus-3.9.1.linux-amd64.tar.gz \
  || curl -sLO https://github.com/prometheus/prometheus/releases/download/v3.9.1/prometheus-3.9.1.linux-amd64.tar.gz

if [ ! -f prometheus-3.9.1.linux-amd64.tar.gz ]; then
  echo "[ERROR] Prometheus tarball not downloaded!"
  exit 1
fi

echo "[INFO] Extracting Prometheus..."
tar -xzf prometheus-3.9.1.linux-amd64.tar.gz

# -------------------------------
# Step 2: Create Prometheus user
# -------------------------------
id prometheus &>/dev/null || sudo useradd --no-create-home --shell /bin/false prometheus

# -------------------------------
# Step 3: Install Prometheus binaries
# -------------------------------
echo "[INFO] Installing Prometheus binaries..."
sudo cp prometheus-3.9.1.linux-amd64/prometheus /usr/local/bin/
sudo cp prometheus-3.9.1.linux-amd64/promtool /usr/local/bin/
sudo chown prometheus:prometheus /usr/local/bin/prometheus /usr/local/bin/promtool

# -------------------------------
# Step 4: Config + data directories
# -------------------------------
echo "[INFO] Setting up Prometheus directories..."
sudo mkdir -p /etc/prometheus /var/lib/prometheus
sudo cp prometheus-3.9.1.linux-amd64/prometheus.yml /etc/prometheus/
sudo chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus

# Add Node Exporter scrape job
echo "[INFO] Adding Node Exporter job to prometheus.yml..."
sudo tee -a /etc/prometheus/prometheus.yml > /dev/null <<EOF

  - job_name: 'Self Node Exporter'
    static_configs:
      - targets: ['localhost:9100']
EOF

# -------------------------------
# Step 5: Prometheus systemd service
# -------------------------------
echo "[INFO] Creating Prometheus systemd service..."
sudo tee /etc/systemd/system/prometheus.service > /dev/null <<EOF
[Unit]
Description=Prometheus Monitoring
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
ExecStart=/usr/local/bin/prometheus \\
  --config.file=/etc/prometheus/prometheus.yml \\
  --storage.tsdb.path=/var/lib/prometheus/
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# -------------------------------
# Step 6: Download Node Exporter
# -------------------------------
echo "[INFO] Downloading Node Exporter v1.10.2..."
wget -q https://github.com/prometheus/node_exporter/releases/download/v1.10.2/node_exporter-1.10.2.linux-amd64.tar.gz \
  || curl -sLO https://github.com/prometheus/node_exporter/releases/download/v1.10.2/node_exporter-1.10.2.linux-amd64.tar.gz

if [ ! -f node_exporter-1.10.2.linux-amd64.tar.gz ]; then
  echo "[ERROR] Node Exporter tarball not downloaded!"
  exit 1
fi

echo "[INFO] Extracting Node Exporter..."
tar -xzf node_exporter-1.10.2.linux-amd64.tar.gz

# -------------------------------
# Step 7: Create Node Exporter user
# -------------------------------
id node_exporter &>/dev/null || sudo useradd --no-create-home --shell /bin/false node_exporter

# -------------------------------
# Step 8: Install Node Exporter binary
# -------------------------------
sudo cp node_exporter-1.10.2.linux-amd64/node_exporter /usr/local/bin/
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

# -------------------------------
# Step 9: Node Exporter systemd service
# -------------------------------
echo "[INFO] Creating Node Exporter systemd service..."
sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOF
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
ExecStart=/usr/local/bin/node_exporter
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# -------------------------------
# Step 10: Reload systemd + start services
# -------------------------------
echo "[INFO] Starting services..."
sudo systemctl daemon-reload
sudo systemctl enable prometheus node_exporter
sudo systemctl start prometheus node_exporter

sleep 3

# Validate services
if systemctl is-active --quiet prometheus; then
  echo "[SUCCESS] Prometheus is running."
else
  echo "[ERROR] Prometheus failed to start!"
  sudo journalctl -u prometheus --no-pager | tail -20
fi

if systemctl is-active --quiet node_exporter; then
  echo "[SUCCESS] Node Exporter is running."
else
  echo "[ERROR] Node Exporter failed to start!"
  sudo journalctl -u node_exporter --no-pager | tail -20
fi

echo "=== Installation completed successfully at $(date) ==="
echo "[INFO] Logs available at $LOGFILE"






#version 3
#!/bin/bash -e
# Prometheus + Node Exporter installation script (no sudo required)
# Installs Prometheus v3.9.1 and Node Exporter v1.10.2 in $HOME
# Runs them as background processes with configs in $HOME/prometheus

LOGFILE="$HOME/prometheus-install.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "=== Starting Prometheus + Node Exporter installation at $(date) ==="

WORKDIR="$HOME/installers"
mkdir -p $WORKDIR
cd $WORKDIR

# -------------------------------
# Step 1: Download Prometheus
# -------------------------------
echo "[INFO] Downloading Prometheus v3.9.1..."
wget -q https://github.com/prometheus/prometheus/releases/download/v3.9.1/prometheus-3.9.1.linux-amd64.tar.gz \
  || curl -sLO https://github.com/prometheus/prometheus/releases/download/v3.9.1/prometheus-3.9.1.linux-amd64.tar.gz

tar -xzf prometheus-3.9.1.linux-amd64.tar.gz

# -------------------------------
# Step 2: Setup Prometheus directories
# -------------------------------
echo "[INFO] Setting up Prometheus directories..."
mkdir -p $HOME/prometheus/data
cp prometheus-3.9.1.linux-amd64/prometheus.yml $HOME/prometheus/

# Add Node Exporter scrape job
cat >> $HOME/prometheus/prometheus.yml <<EOF

  - job_name: 'Self Node Exporter'
    static_configs:
      - targets: ['localhost:9100']
EOF

# -------------------------------
# Step 3: Download Node Exporter
# -------------------------------
echo "[INFO] Downloading Node Exporter v1.10.2..."
wget -q https://github.com/prometheus/node_exporter/releases/download/v1.10.2/node_exporter-1.10.2.linux-amd64.tar.gz \
  || curl -sLO https://github.com/prometheus/node_exporter/releases/download/v1.10.2/node_exporter-1.10.2.linux-amd64.tar.gz

tar -xzf node_exporter-1.10.2.linux-amd64.tar.gz

# -------------------------------
# Step 4: Start Node Exporter
# -------------------------------
echo "[INFO] Starting Node Exporter..."
nohup $WORKDIR/node_exporter-1.10.2.linux-amd64/node_exporter > $HOME/node_exporter.log 2>&1 &

# -------------------------------
# Step 5: Start Prometheus
# -------------------------------
echo "[INFO] Starting Prometheus..."
nohup $WORKDIR/prometheus-3.9.1.linux-amd64/prometheus \
  --config.file=$HOME/prometheus/prometheus.yml \
  --storage.tsdb.path=$HOME/prometheus/data \
  --web.listen-address=:9090 > $HOME/prometheus.log 2>&1 &

sleep 3

echo "[SUCCESS] Prometheus running on port 9090"
echo "[SUCCESS] Node Exporter running on port 9100"
echo "=== Installation completed successfully at $(date) ==="
echo "[INFO] Logs available at $LOGFILE"
