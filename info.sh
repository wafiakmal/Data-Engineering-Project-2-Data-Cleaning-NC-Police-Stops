#!/bin/bash

echo "Enter filename"
read -p 'File: ' FILENAME

filesize=$(ls -lh $FILENAME | awk '{print  $5}')
lines=$(wc -l < $FILENAME)
columns=$(head -n 1 < $FILENAME)

echo "$FILENAME file size is $filesize with $lines lines of data."
echo "These are the column names:"
echo "$columns"
