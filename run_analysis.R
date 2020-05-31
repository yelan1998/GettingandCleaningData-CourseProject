#library used
library(dplyr)

#load the data set 
#part one: features and activity labels
feature <- read.table("UCI HAR Dataset/features.txt",col.names = c("no.","function"))
activity <- read.table("UCI HAR Dataset/activity_labels.txt",col.names = c("act_label","activity"))

#part two: test data set
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
test_label <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "label")


#part three: trained data set
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
train_label <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "label")

#First step: Merge test data and trained data
subject <- rbind(subject_train, subject_test)
activityLabel <- rbind(train_label,test_label)
X_features <- rbind(X_train,X_test)
colnames(X_features) <- t(feature[2])

StepOneData <- cbind(subject,activityLabel,X_features)

#Second Step: Extracts only the measurements on the mean and standard deviation for each measurement
StepOneData <- StepOneData[ , !duplicated(colnames(StepOneData))]
StepTwoData <- StepOneData %>% select(subject, label, contains("mean"), contains("std"))

#Third Step: Uses descriptive activity names to name the activities in the data set
StepTwoData$label <- activity[StepTwoData$label,2]


#Fourth Step: Appropriately labels the data set with descriptive variable names
names(StepTwoData)<-gsub("Acc", "Accelerometer", names(StepTwoData))
names(StepTwoData)<-gsub("Gyro", "Gyroscope", names(StepTwoData))
names(StepTwoData)<-gsub("BodyBody", "Body", names(StepTwoData))
names(StepTwoData)<-gsub("Mag", "Magnitude", names(StepTwoData))
names(StepTwoData)<-gsub("^t", "Time", names(StepTwoData))
names(StepTwoData)<-gsub("^f", "Frequency", names(StepTwoData))
names(StepTwoData)<-gsub("tBody", "TimeBody", names(StepTwoData))
names(StepTwoData)<-gsub("-mean()", "Mean", names(StepTwoData), ignore.case = TRUE)
names(StepTwoData)<-gsub("-std()", "STD", names(StepTwoData), ignore.case = TRUE)
names(StepTwoData)<-gsub("-freq()", "Frequency", names(StepTwoData), ignore.case = TRUE)
names(StepTwoData)<-gsub("angle", "Angle", names(StepTwoData))
names(StepTwoData)<-gsub("gravity", "Gravity", names(StepTwoData))

#Final Step: Creates a second, independent tidy data set with the average of each variable for each activity and each subject
FinalData <- aggregate(. ~subject + label, StepTwoData, mean)
FinalData <- FinalData[order(FinalData$subject,FinalData$label),]
write.table(FinalData, "FinalData.txt", row.name=FALSE)