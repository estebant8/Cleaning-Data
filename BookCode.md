# Book Code

## Downloading the Data Set
Following the steps learned in the videos from Johns Hopkins University the file was downloaded and unzipped in a folder called UCI HAR Dataset.

## Assigning data to variables
- features<- features.txt (561 rows, 2 cols)
they come from accelerometer and gyroscope
- activites<- activity_labels.txt (6 rows, 2 cols)
list of activities and its codes
- subjectTest<- test/subject_test.txt (2947 rows, 1 col)
test data of volunteer subjects
- xTest<- test/X_test.txt (2947 rows, 561 cols)
recorded features test data
- yTest<- test/y_test.txt  (2947 rows, 1 col)
test data of activitie´s code label
- subjectTrain<- train/subject_test.txt (7352 rows, 1 col)
train data of volunteer subjects
- xTrain<- train/X_train.txt (7352 rows, 561 cols)
recorded features train data
- yTrain<- train/y_train.txt (7352 rows, 1 col)
train data of activitie´s code label

## Merges the training and the test sets to create one data set
X (10299 rows, 561 col) was created by merging xTrain and xTest using rbind() function <br/>
Y (10299 rows, 1 col) was created by merging yTrain and yTest using rbind() function <br/>

Subject (10299 rows, 1 col) was created by merging subjectTrain and subjectTest using rbind() function <br/>
Merged_Info (10299 rows, 563 col) was created by merging Subject, Y and X using cbind() function

## Extracts the measurements on the mean and standard deviation for each measurement
TidyD (10299 rows, 88 columns) was created by subsetting Merged_Info, selecting only columns: subject, code and the measurements on the mean and std for each measurement

## Uses descriptive activity names to name the activities in the data set
Entire numbers in code column of the TidyD replaced with corresponding activity taken from second column of the activities variable

## Labels the data set with descriptive variable names
- code column in TidyData renamed into activities
- variable names were rearanged as following:
    Acc into Accelerometer
    Gyro into Gyroscope
    BodyBody into Body
    Mag into Magnitude
    characters starting in t renamed into Time
    characters starting in f renamed into Frequency
    characters starting in lower case reseted to start with upper case
    
## Tidy data set with the average of each variable for each activity and each subject
Final_Data (180 rows, 88 columns) was created by sumarizing TidyD taking the means of each variable for each activity and each subject, after groupped by subject and activity.
Finally, exported Final_Data into Final_Data.txt file.
