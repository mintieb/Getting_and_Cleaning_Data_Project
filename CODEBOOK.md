# CODE BOOK
This code book describes all the variables and summaries calculated, along with units, and any other relevant information.

Original data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data used from the initial dataset: 
1. features.txt - includes list of all features measured
2. activity_labels.txt - links the class labels with their activity name
3. train/x_train.txt - includes the measurements of the features in the training set
4. train/y_train.txt - training labels
5. train/subject_train.txt - training subjects (who performed the activity for each window sample. Its range is from 1 to 30.)
6. test/x_test.txt - includes the measurements of the features in the testing set
7. test/y_test.txt - testing labels
8. test/subject_test.txt - testing subjects (who performed the activity for each window sample. Its range is from 1 to 30.)

## Steps to get and clean data
__Load data:__
* features - data from features.txt; 561 obs. of 2 variables
* activity_labels - data from activity_labels.txt; 6 obs. of 2 variables
* y_train - data from train/y_train.txt; 7352 obs. of 1 variable
* x_train - data from train/x_train.txt; 7352 obs. of 561 variables
* subject_train - data from train/subject_train.txt; 7352 obs. of 1 variable
* y_test - data from test/y_test.txt; 2947 obs. of 1 variable
* x_test - data from test/x_test.txt; 2947 obs. of 561 variables
* subject_test - data from test/subject_test.txt; 2947 obs. of 1 variable

__Merges training and the test sets to create one data set__
* train_data - combines all columns of training data set (subject_train, y_train, x_train); 7352 obs. of 563 variables
* test_data - combines all columns of testing data set (subject_test, y_test, x_test); 2947 obs. of 563 variables
* combined_data - combines all training data and testing data sets (train_data & test_data); 10299 obs. of 563 variables

__Extracts only the measurements on the mean and standard deviation for each measurement__
* mean_std_features - location of column names that include "mean" or "std"
* data_set - subset of data from combined_data, contains subject_id, activity_labels, and measurements on the mean and standard deviation; 10299 obs. of 81 variables

__Uses descriptive activity names to name the activities in the data set__
* data_set$activity_labels - converts numeric activity labels to characters, using the activity_labels data table

__Appropriately labels the data set with descriptive variable names.__
Updates columns names for data_set for following criteria:
* If beginning of name contains "t", then substitute "time"
* If beginning of name contains "f", then substitute "frequency"
* If name contains "Acc", the substitute "Accelerometer"
* If name contains "Gyro", the substitute "Gyroscope"
* If name contains "Mag", the substitute "Magnitude"

__From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.__
* tidy_data - group data_set by "activity_labels", then "subject_id", then apply mean (average) to all columns
* provide output of data in tidy_data.txt

## Variables in data_set
"subject_id": identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.   
"activity_labels": six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)  
__mean and standard deviation for each measurement (normalized and bounded within [-1,1])__
"timeBodyAccelerometer.mean...X"  
"timeBodyAccelerometer.mean...Y"  
"timeBodyAccelerometer.mean...Z"  
"timeBodyAccelerometer.std...X"  
"timeBodyAccelerometer.std...Y"  
"timeBodyAccelerometer.std...Z"  
"timeGravityAccelerometer.mean...X"  
"timeGravityAccelerometer.mean...Y"  
"timeGravityAccelerometer.mean...Z"  
"timeGravityAccelerometer.std...X"  
"timeGravityAccelerometer.std...Y"  
"timeGravityAccelerometer.std...Z"  
"timeBodyAccelerometerJerk.mean...X"  
"timeBodyAccelerometerJerk.mean...Y"  
"timeBodyAccelerometerJerk.mean...Z"  
"timeBodyAccelerometerJerk.std...X"  
"timeBodyAccelerometerJerk.std...Y"  
"timeBodyAccelerometerJerk.std...Z"  
"timeBodyGyroscope.mean...X"  
"timeBodyGyroscope.mean...Y"  
"timeBodyGyroscope.mean...Z"  
"timeBodyGyroscope.std...X"  
"timeBodyGyroscope.std...Y"  
"timeBodyGyroscope.std...Z"  
"timeBodyGyroscopeJerk.mean...X"  
"timeBodyGyroscopeJerk.mean...Y"  
"timeBodyGyroscopeJerk.mean...Z"  
"timeBodyGyroscopeJerk.std...X"  
"timeBodyGyroscopeJerk.std...Y"  
"timeBodyGyroscopeJerk.std...Z"  
"timeBodyAccelerometerMagnitude.mean.."  
"timeBodyAccelerometerMagnitude.std.."  
"timeGravityAccelerometerMagnitude.mean.."  
"timeGravityAccelerometerMagnitude.std.."  
"timeBodyAccelerometerJerkMagnitude.mean.."  
"timeBodyAccelerometerJerkMagnitude.std.."  
"timeBodyGyroscopeMagnitude.mean.."  
"timeBodyGyroscopeMagnitude.std.."  
"timeBodyGyroscopeJerkMagnitude.mean.."  
"timeBodyGyroscopeJerkMagnitude.std.."  
"frequencyBodyAccelerometer.mean...X"  
"frequencyBodyAccelerometer.mean...Y"  
"frequencyBodyAccelerometer.mean...Z"  
"frequencyBodyAccelerometer.std...X"  
"frequencyBodyAccelerometer.std...Y"  
"frequencyBodyAccelerometer.std...Z"  
"frequencyBodyAccelerometer.meanFreq...X"  
"frequencyBodyAccelerometer.meanFreq...Y"  
"frequencyBodyAccelerometer.meanFreq...Z"  
"frequencyBodyAccelerometerJerk.mean...X"  
"frequencyBodyAccelerometerJerk.mean...Y"  
"frequencyBodyAccelerometerJerk.mean...Z"  
"frequencyBodyAccelerometerJerk.std...X"  
"frequencyBodyAccelerometerJerk.std...Y"  
"frequencyBodyAccelerometerJerk.std...Z"  
"frequencyBodyAccelerometerJerk.meanFreq...X"  
"frequencyBodyAccelerometerJerk.meanFreq...Y"  
"frequencyBodyAccelerometerJerk.meanFreq...Z"  
"frequencyBodyGyroscope.mean...X"  
"frequencyBodyGyroscope.mean...Y"  
"frequencyBodyGyroscope.mean...Z"  
"frequencyBodyGyroscope.std...X"  
"frequencyBodyGyroscope.std...Y"  
"frequencyBodyGyroscope.std...Z"  
"frequencyBodyGyroscope.meanFreq...X"  
"frequencyBodyGyroscope.meanFreq...Y"  
"frequencyBodyGyroscope.meanFreq...Z"  
"frequencyBodyAccelerometerMagnitude.mean.."  
"frequencyBodyAccelerometerMagnitude.std.."  
"frequencyBodyAccelerometerMagnitude.meanFreq.."  
"frequencyBodyBodyAccelerometerJerkMagnitude.mean.."  
"frequencyBodyBodyAccelerometerJerkMagnitude.std.."  
"frequencyBodyBodyAccelerometerJerkMagnitude.meanFreq.."  
"frequencyBodyBodyGyroscopeMagnitude.mean.."  
"frequencyBodyBodyGyroscopeMagnitude.std.."  
"frequencyBodyBodyGyroscopeMagnitude.meanFreq.."  
"frequencyBodyBodyGyroscopeJerkMagnitude.mean.."  
"frequencyBodyBodyGyroscopeJerkMagnitude.std.."  
"frequencyBodyBodyGyroscopeJerkMagnitude.meanFreq.."  

## Variables in tidy_data
"activity_labels"  
"subject_id"  
__average of each variable for each activity and each subject__  
"timeBodyAccelerometer.mean...X"  
"timeBodyAccelerometer.mean...Y"  
"timeBodyAccelerometer.mean...Z"  
"timeBodyAccelerometer.std...X"  
"timeBodyAccelerometer.std...Y"  
"timeBodyAccelerometer.std...Z"  
"timeGravityAccelerometer.mean...X"  
"timeGravityAccelerometer.mean...Y"  
"timeGravityAccelerometer.mean...Z"  
"timeGravityAccelerometer.std...X"  
"timeGravityAccelerometer.std...Y"  
"timeGravityAccelerometer.std...Z"  
"timeBodyAccelerometerJerk.mean...X"  
"timeBodyAccelerometerJerk.mean...Y"  
"timeBodyAccelerometerJerk.mean...Z"  
"timeBodyAccelerometerJerk.std...X"  
"timeBodyAccelerometerJerk.std...Y"  
"timeBodyAccelerometerJerk.std...Z"  
"timeBodyGyroscope.mean...X"  
"timeBodyGyroscope.mean...Y"  
"timeBodyGyroscope.mean...Z"  
"timeBodyGyroscope.std...X"  
"timeBodyGyroscope.std...Y"  
"timeBodyGyroscope.std...Z"  
"timeBodyGyroscopeJerk.mean...X"  
"timeBodyGyroscopeJerk.mean...Y"  
"timeBodyGyroscopeJerk.mean...Z"  
"timeBodyGyroscopeJerk.std...X"  
"timeBodyGyroscopeJerk.std...Y"  
"timeBodyGyroscopeJerk.std...Z"  
"timeBodyAccelerometerMagnitude.mean.."  
"timeBodyAccelerometerMagnitude.std.."  
"timeGravityAccelerometerMagnitude.mean.."  
"timeGravityAccelerometerMagnitude.std.."  
"timeBodyAccelerometerJerkMagnitude.mean.."  
"timeBodyAccelerometerJerkMagnitude.std.."  
"timeBodyGyroscopeMagnitude.mean.."  
"timeBodyGyroscopeMagnitude.std.."  
"timeBodyGyroscopeJerkMagnitude.mean.."  
"timeBodyGyroscopeJerkMagnitude.std.."  
"frequencyBodyAccelerometer.mean...X"  
"frequencyBodyAccelerometer.mean...Y"  
"frequencyBodyAccelerometer.mean...Z"  
"frequencyBodyAccelerometer.std...X"  
"frequencyBodyAccelerometer.std...Y"  
"frequencyBodyAccelerometer.std...Z"  
"frequencyBodyAccelerometer.meanFreq...X"  
"frequencyBodyAccelerometer.meanFreq...Y"  
"frequencyBodyAccelerometer.meanFreq...Z"  
"frequencyBodyAccelerometerJerk.mean...X"  
"frequencyBodyAccelerometerJerk.mean...Y"  
"frequencyBodyAccelerometerJerk.mean...Z"  
"frequencyBodyAccelerometerJerk.std...X"  
"frequencyBodyAccelerometerJerk.std...Y"  
"frequencyBodyAccelerometerJerk.std...Z"  
"frequencyBodyAccelerometerJerk.meanFreq...X"  
"frequencyBodyAccelerometerJerk.meanFreq...Y"  
"frequencyBodyAccelerometerJerk.meanFreq...Z"  
"frequencyBodyGyroscope.mean...X"  
"frequencyBodyGyroscope.mean...Y"  
"frequencyBodyGyroscope.mean...Z"  
"frequencyBodyGyroscope.std...X"  
"frequencyBodyGyroscope.std...Y"  
"frequencyBodyGyroscope.std...Z"  
"frequencyBodyGyroscope.meanFreq...X"  
"frequencyBodyGyroscope.meanFreq...Y"  
"frequencyBodyGyroscope.meanFreq...Z"  
"frequencyBodyAccelerometerMagnitude.mean.."  
"frequencyBodyAccelerometerMagnitude.std.."  
"frequencyBodyAccelerometerMagnitude.meanFreq.."  
"frequencyBodyBodyAccelerometerJerkMagnitude.mean.."  
"frequencyBodyBodyAccelerometerJerkMagnitude.std.."  
"frequencyBodyBodyAccelerometerJerkMagnitude.meanFreq.."  
"frequencyBodyBodyGyroscopeMagnitude.mean.."  
"frequencyBodyBodyGyroscopeMagnitude.std.."  
"frequencyBodyBodyGyroscopeMagnitude.meanFreq.."  
"frequencyBodyBodyGyroscopeJerkMagnitude.mean.."  
"frequencyBodyBodyGyroscopeJerkMagnitude.std.."  
"frequencyBodyBodyGyroscopeJerkMagnitude.meanFreq.."  
