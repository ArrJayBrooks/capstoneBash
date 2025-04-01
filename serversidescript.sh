#!/bin/bash

for filename in /home/teamprojects/Desktop/images/*.png
do
    md5sum -c $filename.md5
done