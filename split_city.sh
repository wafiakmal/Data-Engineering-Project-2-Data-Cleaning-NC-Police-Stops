#!/bin/bash

echo Splitting by first column, enter the filename and destination folder:
read filename folder

mkdir $folder
cd $folder

awk -F"," '{ print $0 >> "Data_"$1".csv"}' "../$filename"

header=$(head -n 1 Data_city.csv)

for file in *.csv
do
	{
		printf '%s\n' "$header"
		tail -n +2 "$file"
	} > Final_"$file"
done

rm -f Data*
rm -f Final_Data_city*
