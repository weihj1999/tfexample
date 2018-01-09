#!/bin/bash
for num in 1 2 3 4 5 6 
do 
	source nor$num.rc
	nova list | awk -F "|" '{print $2}' > temp.txt
	awk 'NR>=4 && NR<104' temp.txt > list$num.txt
	true > temp.txt
	echo "=========nor$num begin========" >> pwd.txt
	while read line ; do  
    	   echo $line >> pwd.txt
    	   nova get-password $line  ~/.ssh/id_rsa >> pwd.txt
	done < list$num.txt
	echo "=========nor$num end========" >> pwd.txt
done
