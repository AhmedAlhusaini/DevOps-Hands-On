#!/usr/bin/bash
touch secret.txt
ls -l
chmod g-r-w secret.txt
 ls -l
chmod a-r-w secret.txt
 ls -l
chmod 700 secret.txt
 ls -l
echo -e '#!/bin/bash\n\necho "Hello, welcome to Linux"' > hello.sh
ls
./hello.sh
./hello.sh: Permission denied
chmod o+x
chmod o+x hello.sh
./hello.sh
chmod u+x hello.sh
./hello.sh
#Hello, welcome to Linux

groups ahmed 
id ahmed 
grep "^ahmed:" /etc/group
