# Getting and Cleaning Data: Course Project
## Project Goals
You should create one R script called run_analysis.R that does the following.

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to run this project
  1. Download the data set from [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Unzip this file and you will get a folder called `"UCI HAR Dataset"`.
  2. Run the script "run_analysis.R" in the `parent folder of UCI HAR Dataset`. It will automatically generate a file called `"FinalData.txt"`, which is the clean and tidy data set after executing all the above steps mentioned in the Project Goals.
 
## Cautions
  1. R script "run_analysis.R" depends on packages "dplyr". Make sure you have installed it. 
  2. Other informations about the variables and code implemention will be explained in `CodeBook.md`.
