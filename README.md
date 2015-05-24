#Getting and Cleaning Data - Course Project

Repository for code related to the Getting and Cleaning Data course offered by
Coursera and Johns Hopkins University.


##Dataset

This project is based on the dataset linked below:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the dataset is available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Processing

Before running the analysis script, download and unzip the source file into a
local folder on your machine.

Open R Studio and execute setwd() to change your working directory to the main
folder "UCI HAR Dataset".

Place the script run_analysis.R inside the "UCI HAR Dataset" folder.

If the script is not at the correct place, it will not work, because it will
not find the input files.


## Output

The output is saved in two files placed in the "UCI HAR Dataset" folder:
* tidy_dataset.txt: Contains the complete tidy dataset created according with the project instructions.
* average_dataset.txt: Contains the dataset with only average of each variable for each activity and each subject.
