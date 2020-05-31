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
  ### Preparing Step: Read each txt file and assign the data to different variables:
    * Variable 'feature' <- features.txt
    * Variable 'activity' <- activity_label.txt
    * Variable 'subject_test' <- subject_test.txt
    * Variable 'X_test' <- X_test.txt
    * Variable 'test_label' <- y_test.txt
    * Variable 'subject_train' <- subject_train.txt
    * Variable 'X_train' <- X_train.txt
    * Variable 'train_label' <- y_train.txt
  ### Step 1: Merge the training and test data sets to create on data set
    * Variable 'X_features' is created by merging 'X_test' and 'X_train'
    * Variable 'activityLabel' is created by merging 'test_label' and 'train_label'
    * Variable 'subject' is created by merging 'subject_test' and 'subject_train'
    * Data Frame 'StepOneData' is the data set after executing the first goal of this project, which is created by merging 'X_features', 'activityLabel' and 'subject'.
  ### Step 2: Extract only the measurements on the mean and standard deviation for each measurement
    * Data Frame 'StepTwoData' is created by slecting the subset that only contains columns 'subject','label' and features with measurements on the (mean) and (std) for each measurement.
  ### Step 3: Use descriptive activity names to name the activities in the data set
    * In 'StepTwoData', replace the activity label numbers in 'label' column by the corresponding activity names, according to the variable 'activity' created in Step 1.
  ### Step 4: Appropriately label the data set with descriptive variable names
    * Using the name function, the name of each column can be easily found. 
    * All substring 'ACC' changed to 'Accelerometer'
    * All substring 'Gyro' changed to 'Gyroscope'
    * All substring 'BodyBody' changed to 'Body'
    * All substring 'Mag' changed to 'Magnitude'
    * All substring '^t' changed to 'Time'
    * All substring '^f' and '-freq' changed to 'Frequency'
    * All substring 'tBody' changed to 'TimeBody'
    * All substring '-mean()' changed to 'Mean'
    * All substring '-std()' changed to 'STD'
    * All substring 'angle' changed to 'Angle'
    * All substring 'gravity' changed to 'Gravity'
  ### Step 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
    * Data Frame 'FinalData' is created by first grouping the subject and activity, then taking the means of each variable for each activity and each subject, and finally reordering the data frame from the 'StepTwoData'
    * Write this Data Frame into the file 'FinalData.txt'.
