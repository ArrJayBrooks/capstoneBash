#!/bin/bash

source /home/pi/.venv/bin/activate
echo "Running Combined.py"
python3 /home/teamprojects/Desktop/YoloCode/Combined.py

echo "Combined.py complete. Changing directories."
cd /home/teamprojects/Desktop/YoloCode/AllImages/IdentifiedDeathStar

for filename in *.png
do
	if test -f $filename; then
		echo "Running on $filename"
		python3 /home/teamprojects/Desktop/capstoneAES/AESenc.py $filename /home/teamprojects/Desktop/CompletedFiles/$filename.enc
	fi
done

for filename in *.jpg
do
	if test -f $filename; then
        	echo "Running on $filename"
        	python3 /home/teamprojects/Desktop/capstoneAES/AESenc.py $filename /home/teamprojects/Desktop/CompletedFiles/$filename.enc
	fi
done

echo "Encryptions finished. Generating .md5 files"
cd /home/teamprojects/Desktop/CompletedFiles
for filename in *.enc
do
	if test -f $filename; then
		echo "Checksumming $filename"
		md5sum $filename > $filename.md5
	fi
done
