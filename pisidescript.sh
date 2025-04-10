#!/bin/bash

source /home/pi/.venv/bin/activate
echo "Running Combined.py"
python3 /home/teamprojects/Desktop/YoloCode/Combined.py

echo "Combined.py complete. Changing directories."
cd /home/teamprojects/Desktop/YoloCode/AllImages/IdentifiedDeathStar

for filename in *.png
do
	echo "Running on $filename"
	python3 /home/teamprojects/Desktop/capstoneAES/AESenc.py $filename /home/teamprojects/Desktop/CompletedFiles/$filename.enc
done

for filename in *.jpg
do
        echo "Running on $filename"
        python3 /home/teamprojects/Desktop/capstoneAES/AESenc.py $filename /home/teamprojects/Desktop/CompletedFiles/$filename.enc
done

echo "Encryptions finished. Generating .md5 files"
cd /home/teamprojects/Desktop/CompletedFiles
for filename in *.enc
do
	md5sum $filename > $filename.md5
done
