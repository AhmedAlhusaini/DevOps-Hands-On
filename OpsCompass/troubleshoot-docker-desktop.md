

# 🛠️ Docker Desktop Kubernetes Troubleshooting Script  
**Author:** Ahmed Elhossainy  
**Purpose:** Diagnose and resolve issues when Kubernetes cluster fails to start in Docker Desktop on Windows.

---

## 🔍 1. Check Port 6443 Usage
```powershell
netstat -ano | findstr :6443
```
> If you see `LISTENING` with a PID, identify the process:
```powershell
tasklist /FI "PID eq <PID>"
```
> Example:
```powershell
tasklist /FI "PID eq 5988"
```
If it's `com.docker.backend.exe`, that's expected. If it's another process, stop it:
```powershell
Stop-Process -Id <PID> -Force
```

---

## 🔄 2. Restart Docker Desktop
- Quit Docker Desktop from system tray.
- Wait 10–15 seconds.
- Relaunch Docker Desktop.

---

## 🧹 3. Reset Kubernetes Cluster
- Open Docker Desktop.
- Go to **Settings > Kubernetes**.
- Click **“Reset Kubernetes Cluster”**.

---

## 🧪 4. Verify Cluster Status
```powershell
kubectl cluster-info
```
If you get `EOF` errors, check your kubeconfig:
```powershell
kubectl config view
```

---

## 🧼 5. Regenerate Kubeconfig (if needed)
```powershell
cd $HOME\.kube
del config
```
> Restart Docker Desktop to regenerate the config.

---

## ✅ 6. Confirm Docker Engine Health
```powershell
docker info
```

---

## 🧠 Teaching Hook (for juniors)
> Think of port 6443 as the front door to your Kubernetes house. If someone else is sitting in that doorway, Kubernetes can’t get in. Restarting clears the mess, resetting rebuilds the blueprint, and checking the config ensures the front door knows where to knock.

---

Would you like this formatted as a downloadable file or turned into a bilingual teaching script with timestamps?Here’s a reusable troubleshooting script you can keep for future reference. It’s structured for clarity and repeatability, with commands grouped by purpose and teaching hooks embedded for juniors.

---

# 🛠️ Docker Desktop Kubernetes Troubleshooting Script  
**Author:** Ahmed Elhossainy  
**Purpose:** Diagnose and resolve issues when Kubernetes cluster fails to start in Docker Desktop on Windows.

---

## 🔍 1. Check Port 6443 Usage
```powershell
netstat -ano | findstr :6443
```
> If you see `LISTENING` with a PID, identify the process:
```powershell
tasklist /FI "PID eq <PID>"
```
> Example:
```powershell
tasklist /FI "PID eq 5988"
```
If it's `com.docker.backend.exe`, that's expected. If it's another process, stop it:
```powershell
Stop-Process -Id <PID> -Force
```

---

## 🔄 2. Restart Docker Desktop
- Quit Docker Desktop from system tray.
- Wait 10–15 seconds.
- Relaunch Docker Desktop.

---

## 🧹 3. Reset Kubernetes Cluster
- Open Docker Desktop.
- Go to **Settings > Kubernetes**.
- Click **“Reset Kubernetes Cluster”**.

---

## 🧪 4. Verify Cluster Status
```powershell
kubectl cluster-info
```
If you get `EOF` errors, check your kubeconfig:
```powershell
kubectl config view
```

---

## 🧼 5. Regenerate Kubeconfig (if needed)
```powershell
cd $HOME\.kube
del config
```
> Restart Docker Desktop to regenerate the config.

---

## ✅ 6. Confirm Docker Engine Health
```powershell
docker info
```

---

## 🧠 Teaching Hook (for juniors)
> Think of port 6443 as the front door to your Kubernetes house. If someone else is sitting in that doorway, Kubernetes can’t get in. Restarting clears the mess, resetting rebuilds the blueprint, and checking the config ensures the front door knows where to knock.

---

Would you like this formatted as a downloadable file or turned into a bilingual teaching script with timestamps? 🛠️ Docker Desktop Kubernetes Troubleshooting Script  
**Author:** Ahmed Elhossainy  
**Purpose:** Diagnose and resolve issues when Kubernetes cluster fails to start in Docker Desktop on Windows.

---

## 🔍 1. Check Port 6443 Usage
```powershell
netstat -ano | findstr :6443
```
> If you see `LISTENING` with a PID, identify the process:
```powershell
tasklist /FI "PID eq <PID>"
```
> Example:
```powershell
tasklist /FI "PID eq 5988"
```
If it's `com.docker.backend.exe`, that's expected. If it's another process, stop it:
```powershell
Stop-Process -Id <PID> -Force
```

---

## 🔄 2. Restart Docker Desktop
- Quit Docker Desktop from system tray.
- Wait 10–15 seconds.
- Relaunch Docker Desktop.

---

## 🧹 3. Reset Kubernetes Cluster
- Open Docker Desktop.
- Go to **Settings > Kubernetes**.
- Click **“Reset Kubernetes Cluster”**.

---

## 🧪 4. Verify Cluster Status
```powershell
kubectl cluster-info
```
If you get `EOF` errors, check your kubeconfig:
```powershell
kubectl config view
```

---

## 🧼 5. Regenerate Kubeconfig (if needed)
```powershell
cd $HOME\.kube
del config
```
> Restart Docker Desktop to regenerate the config.

---

## ✅ 6. Confirm Docker Engine Health
```powershell
docker info
```

---
