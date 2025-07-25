# 🧪 Lab 17: Network File Transfer

## 📝 Task

> Practice downloading and transferring files:
> - Use `wget` to download a sample file from the internet  
> - Use `curl` to fetch just the headers of a website  
> - Create a simple text file and practice moving it between directories  
> - Check the file size before and after operations  

---

## ✅ Steps

1. Download a sample file with `wget`.  
2. Fetch HTTP headers only using `curl -I`.  
3. Create a small text file with `echo`.  
4. Move that file into a new directory.  
5. Use `stat` (or `ls -lh`) to display file sizes before and after.  

---

## 💡 Bonus

- Use `rsync -av --progress` to synchronize or verify transfers incrementally.  
- Try downloading multiple files in parallel with `&` or `xargs`.  
- For large downloads, add `--limit-rate=100k` to throttle bandwidth.  
- Senior tip: use `scp` or `sftp` for secure remote transfers when practicing beyond localhost.  


---

## 💻 Command(s)

```bash
devops_ninja@Ahmed-Hossainy:/home$ wget https://gisoverflow.com -O ~/sample.txt
--2025-07-25 15:00:00--  https://gisoverflow.com 
Resolving gisoverflow.com (gisoverflow.com)... 93.184.216.34
Connecting to gisoverflow.com|93.184.216.34|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1234 (1.2K) [text/plain]
Saving to: ‘/home/devops_ninja/sample.txt’

100%[======================================>] 1,234       --.-K/s   in 0s

2025-07-25 15:00:00 (10.2 MB/s) - ‘/home/devops_ninja/sample.txt’ saved [1234/1234]

devops_ninja@Ahmed-Hossainy:/home$ curl -I https://gisoverflow.com
HTTP/1.1 200 OK
Date: Fri, 25 Jul 2025 15:00:01 GMT
Content-Type: text/html; charset=UTF-8
Connection: keep-alive
...

devops_ninja@Ahmed-Hossainy:/home$ echo "This is a test file." > ~/testfile.txt
devops_ninja@Ahmed-Hossainy:/home$

devops_ninja@Ahmed-Hossainy:/home$ mkdir -p ~/transfer_dest
devops_ninja@Ahmed-Hossainy:/home$

devops_ninja@Ahmed-Hossainy:/home$ mv ~/testfile.txt ~/transfer_dest/
devops_ninja@Ahmed-Hossainy:/home$
# No output means success; verify:
devops_ninja@Ahmed-Hossainy:/home$ ls transfer_dest
testfile.txt

devops_ninja@Ahmed-Hossainy:/home$ stat -c 'Size of sample.txt: %s bytes' ~/sample.txt
Size of sample.txt: 1234 bytes

devops_ninja@Ahmed-Hossainy:/home$ stat -c 'Size of transfer_dest/testfile.txt: %s bytes' ~/transfer_dest/testfile.txt
Size of transfer_dest/testfile.txt: 21 bytes

# Bonus with rsync:
devops_ninja@Ahmed-Hossainy:/home$ mkdir -p ~/transfer_backup
devops_ninja@Ahmed-Hossainy:/home$ rsync -av --progress ~/transfer_dest/ ~/transfer_backup/
sending incremental file list
testfile.txt
         21 100%    0.00kB/s    0:00:00 (xfr#1, to-chk=0/1)

sent 95 bytes  received 45 bytes  280.00 bytes/sec
total size is 21  speedup is 0.14

##Key takeaway: file size is purely a function of how many bytes of data the file contains. Different content ⇒ different size. Moving or copying (on the same disk) doesn’t alter that.