#!/bin/bash

source /home/pi/.venv/bin/activate
python3 /home/teamprojects/Desktop/YoloCode/Combined.py

cd /home/teamprojects/Desktop/capstoneAES

for filename in /home/teamprojects/Desktop/YoloCode/*.{jpg,jpeg,png}
do
    python3 capstoneAES.py /home/teamprojects/Desktop/YoloCode/$filename $filename.enc
    md5sum $filename.enc > $filename.md5
done