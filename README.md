# Project 2 - Wafiakmal Miftah

## Introduction
Hi! In this second project for Data Engineering class, I will show my capability of cleaning and truncating data. These process is very important to help data scientist do a more efficient EDA and further analyzed the data!

## Project Overview
![alt text](https://imgur.com/FGWdsVs.png)

## Dataset & Commands
The dataset used in this project is "North Carolina Master Dataset of Arrests". This dataset aggregates all police records from the Stanford Open Policing Project from cities in North Carolina. It provides over 4.5 million records of police stops. Every row in this dataset represents a police stop, and it records information about the subject's location (city), demographics (sex, ethnicity), whether or not they were searched or arrested, if any contraband was found, and why they were stopped and why they were pulled over.

The final goal of this project is to split the main dataset by location of police stops in North Carolina.

### Download Dataset
```
./download_file.sh
```
### Pulling Initial Info from Master File
```
./info.sh final.csv
```
### Assigning Null Values to Blank Rows
```
./empty_cells final.csv
```
### Split Master File based on City
```
./split_city

final.csv split_city
```
### Split Master File based on Number of Files
```
./split_files

final.csv 10 split_files 
```
