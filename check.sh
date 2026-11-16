#!/usr/bin/env bash

cd /cshome/aahnaras/lab-07

count=0
total=0
declare file1
declare file2
num=0
returnValue=$?
declare differenceFileName
declare differentFolderName

for testcases in /cshome/aahnaras/lab-07/Testcase*/; do
	if [[ $count -eq 0 ]]
	then 
		file1="${testcases%/}"
		((count++))
	fi

	if [[ $count -eq 1 ]]
	then
		file2="${testcases%/}"
		((count++))
	else
		count=0
	fi
	
	if [[ -f file1  && -d dir ]]
	then
		((total++))	
	#if testcase pass, total = total + 0, else if no fail then total=total+1
	fi

	echo "Testcase${count}: "
	if [[ $total -eq 0 ]]
	then
		echo "Pass"
	else
		echo "FAIL"
	fi
done
