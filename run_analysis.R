library(dplyr)

myfile<- "Course_Evaluation.zip"

if(!file.exists(myfile)){
  URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(URL,myfile)
}

if(!file.exists("UCI HAR Dataset")){
  unzip(myfile)
}

features<- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activites<- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subjectTest<- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
xTest<- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
yTest<- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subjectTrain<- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
xTrain<- read.table("UCI HAR Dataset/train/X_train.txt",col.names = features$functions)
yTrain<- read.table("UCI HAR Dataset/train/y_train.txt", col.names= "code")


X<- rbind(xTest, xTrain)
Y<- rbind(yTest, yTrain)
Subject<- rbind(subjectTest, subjectTrain)
Merged_Info<- cbind(Subject, Y,X)

TidyD<- Merged_Info %>% select(subject,code, contains("mean"), contains("std"))

TidyD$code<- activites[TidyD$code,2]


names(TidyD)[2]="activity"
names(TidyD)<-gsub("Acc", "Accelerometer", names(TidyD))
names(TidyD)<-gsub("Gyro","Gyroscope" ,names(TidyD))
names(TidyD)<-gsub("BodyBody", "Body", names(TidyD))
names(TidyD)<-gsub("Mag","Magnitude", names(TidyD))
names(TidyD)<-gsub("^t","Time", names(TidyD))
names(TidyD)<-gsub("^f", "Frequency", names(TidyD))
names(TidyD)<-gsub("tBody","TimeBody", names(TidyD))
names(TidyD)<-gsub("-mean","Mean", names(TidyD), ignore.case = TRUE)
names(TidyD)<-gsub("-std","StandardDeviation", names(TidyD), ignore.case = TRUE)
names(TidyD)<-gsub("-freq","Frequency", names(TidyD), ignore.case = TRUE)
names(TidyD)<-gsub("angle","Angle", names(TidyD))
names(TidyD)<-gsub("gravity","Gravity", names(TidyD))

Final_Data<- TidyD %>% 
  group_by(subject,activity)%>%
  summarize_all(funs(mean))
write.table(Final_Data, "Final_Data.txt", row.name=FALSE)
