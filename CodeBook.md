# CodeBook
This CodeBook will describe the variables, the data, and any transformations or work that I have performed to clean up the data.

## Overview
[original Data Source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## Data Info
  1. `features.txt`: contains the features combined with different kinds of measurement functions selected for this data set.
  2. `activity_labels`: contains the list of activities with their corresponding label numbers.
  3. `subject_test.txt` and `subject_train.txt`: contains the data of test subjects and trained subjects.
  4. `X_test.txt` and `X_train.txt`: contains the features data of test subjects and trained subjects.
  5. `y_test.txt` and `y_train.txt`: contains the corresponding activity labels of test data and trained data.
  
## Steps to Clean up this Data Set
  ### 1. Read each txt file and assign the data to different variables:
    * feature <- features.txt
    * activity <- activity_label.txt
    * subject_test <- subject_test.txt
    * X_test <- X_test.txt
    * test_label <- y_test.txt
    * subject_train <- subject_train.txt
    * X_train <- X_train.txt
    * train_label <- y_train.txt
  ### 2. Merge the training and test data sets to create on data set
    * X_features is created by merging X_test and X_train
    * activityLabel is created by merging test_label and train_label
    * subject is created by merging subject_test and subject_train
    * StepTwoData is the data set after executing the first goal of this project, which is created by merging X_features, activityLabel and subject.
  ### 3. 
