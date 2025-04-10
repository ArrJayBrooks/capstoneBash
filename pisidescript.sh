#!/bin/bash

source /home/pi/.venv/bin/activate
echo "Running Combined.py"
python3 /home/teamprojects/Desktop/YoloCode/Combined.py

echo "Combined.py complete. Changing directories."
cd /home/teamprojects/Desktop/capstoneAES

for filename in /home/teamprojects/Desktop/YoloCode/AllImages/CroppedTestImages/*.{jpg,jpeg,png}
do
	echo "Running on $filename"
	python3 AESenc.py /home/teamprojects/Desktop/YoloCode/AllImages/CroppedTestImages/*$filename $filename.enc
	echo "Encryption complete. Generating .md5 file"
	md5sum $filename.enc > $filename.md5
done
