## 🛠️ Hosting a Static Website in Docker

### **Option 1: Bind Mount (fastest for development)**
- You don’t copy files into the container; you just “mount” your local folder.
- Any changes in your local folder reflect immediately inside the container.

**Command:**
```bash
docker run -d --name stylish-website -p 10000:80 \
  -v "D:/Enterprise Solutions/01 CloudAndDevOps/devops-docker-foundry/deploy-webpage-with-nginx/Stylish:/usr/share/nginx/html" \
  nginx
```

✅ Pros: Quick, no Dockerfile needed.  
❌ Cons: Tied to your local filesystem; not portable.

---

### **Option 2: Named Volume + Copy Files (portable, but manual)**
- Create a Docker volume.
- Copy your files into it using `docker cp`.

**Steps:**
```bash
# Create container with a named volume
docker run -d --name stylish-website -p 10000:80 -v stylish-data:/usr/share/nginx/html nginx

# Copy files into the container
docker cp ./Stylish/. stylish-website:/usr/share/nginx/html
```

✅ Pros: Files live inside Docker volume.  
❌ Cons: Manual copy each time you update.

---

### **Option 3: Enter Container and Copy Files (not recommended)**
- Start container, then `docker exec` into it and manually copy files.
- Example:
```bash
docker exec -it stylish-website bash
# inside container
cp /tmp/index.html /usr/share/nginx/html/
```

✅ Works, but ❌ not reproducible. Avoid for real projects.

---

### **Option 4: Dockerfile (best practice for deployment)**
- Build a custom image that **includes your website files**.
- Portable, reproducible, sharable.

**Dockerfile:**
```dockerfile
FROM nginx:latest
COPY Stylish/ /usr/share/nginx/html
```

**Build & Run:**
```bash
docker build -t stylish-website .
docker run -d --name stylish-website -p 10000:80 stylish-website
```

✅ Pros: Clean, portable, production-ready.  
❌ Cons: Requires rebuild when files change.

---

## 🧪 How to Test

1. **Check container is running:**
   ```bash
   docker ps
   ```
2. **Open in browser:**
   ```
   http://localhost:10000
   ```
   → You should see your Stylish `index.html`.
3. **Test via curl (no browser needed):**
   ```bash
   curl http://localhost:10000
   ```
   → Should print your HTML content.
4. **Logs (if something fails):**
   ```bash
   docker logs stylish-website
   ```

---

## 🔑 Summary
- **For quick dev:** Use **bind mount** (Option 1).  
- **