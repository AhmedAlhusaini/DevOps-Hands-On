
### 🔧 System Update
```bash
sudo yum update -y
```
- Always start by updating packages to the latest versions.

---

### ☕ Install Java (required for Jenkins agent)
```bash
sudo yum install -y java-1.8.0-openjdk
```
or for Java 11:
```bash
sudo yum install -y java-11-openjdk
# Update package metadata
sudo dnf update -y

# Install Java 17 (default available in AL2023)
sudo dnf install -y java-17-amazon-corretto

# Or install Java 21 (latest LTS)
sudo dnf install -y java-21-amazon-corretto

```
- Jenkins agents need Java to run.

---

### 🐙 Install Git (for source code checkout)
```bash
sudo yum install -y git
```

---

### 🐳 Install Docker (if your builds need it)
```bash
sudo yum install -y docker
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user
```

---

### 📦 Install Maven (optional, for Java builds)
```bash
sudo yum install -y maven
```

---

### 🛠 Other useful tools
```bash
sudo yum install -y wget curl unzip
```

---

### ✅ Verify installation
```bash
java -version
git --version
docker --version
mvn -version
```

