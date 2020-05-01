# Cleaning-Data
The complete purpose of this project was to collect, work with and clean a data set.

The dataset was provided by coursera at the following URL:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The data represents information collected from the Samgsung Galaxy S Smartphone. 
We can find the original information in the following URL:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Files:

1. CodeBook.md is a code book that describes the data, the variables and every single one of the transformations
used to clean up the data. It contains every important piece of information any reader must need to understand 
the realization of the project.

2. run_analysis.R is a Rscript that follows the instructions specified prior to the realization of the project.
It follows the next steps:
	- merges the training and the test sets to create one data set
	- extracts only the measurements on the mean and std for each measurement
	- uses descriptive activity names to name the activities within the datast
	- appropiately labels the data set with descriptive variable names
	- creates a tidy data set with the average of each variable for each activity and each subject

3. Final_Data.txt is the final data exported. Once the five steps mentioned above were accomplished,
a txt file was created to upload the tidy data set.
