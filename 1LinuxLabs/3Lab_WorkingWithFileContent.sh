#!/usr/bin/bash
ls
touch intro.txt && ( echo "I am Ahmed Alhusainy" ; echo " I am Studying Devops " ) >> intro.txt
tree 
cat intro.txt
printf '\n New Line By Print F Command \n' >> intro.txt
cat intro.txt
printf '\n =============Adding By VIM ===========  \n' >> intro.txt

nano 
# The Most Import Part in my setup is to read about nano to see how to apply M Keys
nano intro.txt
# Press Ctrl + O to save and Ctrl + X to exit
cat intro.txt	
less intro.txt
more intro.txt
# Press q to exit less or more
# Press space to go to the next page in less or more
# Press b to go back in less or more
# Press / to search for a string in less or more
# Press n to go to the next occurrence of the search string in less or more
# Press N to go to the previous occurrence of the search string in less or more
# Press g to go to the beginning of the file in less or more
# Press G to go to the end of the file in less or more
# Press h to see the help in less or more
# Press :q to quit less or more		

nano --linenumbers intro.txt


