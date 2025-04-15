#!/bin/bash

for filename in *.enc
do
	if test -f $filename; then
		echo "Checksumming $filename"
		md5sum -c $filename.md5
		echo "Decrypting $filename"
		python3 AESdec.py $filename $filename.dec
	fi
done
