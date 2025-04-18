#!/bin/bash

cd /home/amnesia/capstone

for filename in *.enc
do
	if test -f $filename; then
		echo "Checksumming $filename"
		md5sum -c $filename.md5
		echo "Decrypting $filename"
		python3 capstoneAES/AESdec.py $filename $filename.png
		echo "Decryption Finished. Running red.py"
		python3 red.py
	fi
done
