#!/usr/bin/env bash

cd /cshome/aahnaras/lab-07

count=0
declare file1
declare file2
num=0
declare differenceFileName
declare differentFolderName
returnValue=$?

for testfile in Testcase*/; do #every item inside the folder
	for testcases in Testcases; do
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

	((num++))

	differentFolderName="Testcase${num}Diff"
	differenceFileName="Version${num}Diff.txt"

	rm -rf "$differentFolderName"

	diff -q file1 file2 > /dev/null

	if [[ $returnValue -ne 0 ]] # Files have different content
	then
		mkdir -p "$differentFolderName"
		diff -u file1 file2 > "$differentFolderName/$differenceFileName"
	fi
done
done
