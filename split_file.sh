#!/bin/bash

full_filename=$1
num_files=$2
split_folder=$3

mkdir -p $split_folder

filename=$(basename -- "$full_filename")
extension="${filename##*.}"
filename="${filename%.*}"

num_lines=`wc -l ${filename}.${extension} | awk '{print $1}'`
echo "$num_lines lines"

# Calculate lines per file
lines_per_file=`awk "BEGIN {print ($num_lines/$num_files)}"`
lines_per_file="${lines_per_file%.*}"

# Round up
lines_per_file=$((lines_per_file + 1))

echo "$lines_per_file lines per file"
echo "$num_lines total lines"

# Get the heading line.
heading=`sed -n '1p' < "$full_filename"`

echo "The following heading will be repeated in all files"
echo $heading

#num=$((num1 + num2))
from_line=2

# Write heading to a test file as well
echo $heading > "$split_folder/test_${filename}.${extension}"

for (( i=1; i<=$num_files; i++ ))
do
   split_name="${filename}_${i}.${extension}"
   if [ $i -eq $num_files ]
   then
     to_line=$num_lines
   else   
     to_line=$((from_line + lines_per_file - 1))
   fi
   
   # Write heding to file
   echo $heading > "$split_folder/$split_name"
   
   # Write the split lines from from_line to to_line
   sed -n "${from_line},${to_line}p" < "$full_filename" >> "$split_folder/$split_name"
   
   # Write to a test file to confirm that the splits add up to the original
   sed -n "${from_line},${to_line}p" < "$full_filename" >> "$split_folder/test_${filename}.csv"

   from_line=$((to_line + 1))
   echo $split_name
done
