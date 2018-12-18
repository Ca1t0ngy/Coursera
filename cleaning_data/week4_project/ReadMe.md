## Coursera R Clearning Data Project
### Introduction
This folder contains threes files:

- Data_Analysis.R : R script for data cleaning 
- CodeBook.md : Describes the variables, the data, and any transformations or work that performed to clean up the data 
- ReadMe.md : General introduction to the data set and how to run the script 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[Mobile Phone Data Source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project:

[Download data here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The R script run_analysis.R  does the following.

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### How to run the script