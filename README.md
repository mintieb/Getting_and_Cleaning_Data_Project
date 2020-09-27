# Getting_and_Cleaning_Data_Project
Getting and Cleaning Data Project, week 4 peer-graded assignment

The purpose of the project is to demonstrate ability to collect, work with, and clean a data set. 

the data linked to the project are collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data used from the initial dataset: 
1. features.txt - includes list of all features measured
2. activity_labels - links the class labels with thier activity name
3. train/x_train.txt - includes the measurements of the features in the training set
4. train/y_train.txt - training labels
5. train/subject_train.txt - training subjects (who performed the activity for each window sample. Its range is from 1 to 30.)
6. test/x_test.txt - includes the measurements of the features in the testing set
7. test/y_test.txt - testing labels
8. test/subject_test.txt - testing subjects (who performed the activity for each window sample. Its range is from 1 to 30.)


The script, "run_analysis.R" does the following: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.