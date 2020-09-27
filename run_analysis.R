## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, 
##    independent tidy data set with the average of each variable for each activity and each subject.


library(dplyr)
if(!file.exists("./data")) {dir.create("./data")}
## download zip file
zipUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipUrl, destfile="./data/UCI_HAR_Dataset.zip", method="curl")

## unzip file
if(file.exists("./data/UCI_HAR_Dataset.zip")) {unzip("./data/UCI_HAR_Dataset.zip", exdir = "./data")}

## load list of all features
features <- read.table("./data/UCI HAR Dataset/features.txt", col.names = c("number", "list"))
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("number", "label"))

## load data from training set
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names = "activity_labels")
x_train <- read.table("./data/UCI HAR Dataset/train/x_train.txt", col.names = features$list)
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject_id")

## load data from test set
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names = "activity_labels")
x_test <- read.table("./data/UCI HAR Dataset/test/x_test.txt", col.names = features$list)
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject_id")

## 1. Merges the training and the test sets to create one data set.
train_data <- cbind(subject_train, y_train, x_train)
test_data <- cbind(subject_test, y_test, x_test)
combined_data <- rbind(train_data, test_data)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
mean_std_features <- grep("mean|std", features$list)
data_set <- cbind(combined_data[, 1:2], combined_data[, mean_std_features+2])

## 3. Uses descriptive activity names to name the activities in the data set
data_set$activity_labels = activity_labels[data_set$activity_labels, 2]

## 4. Appropriately labels the data set with descriptive variable names.
names(data_set) <- gsub("^t", "time", names(data_set))
names(data_set) <- gsub("^f", "frequency", names(data_set))
names(data_set) <- gsub("Acc", "Accelerometer", names(data_set))
names(data_set) <- gsub("Gyro", "Gyroscope", names(data_set))
names(data_set) <- gsub("Mag", "Magnitude", names(data_set))

## 5. From the data set in step 4, creates a second, 
##    independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- data_set %>% group_by(activity_labels, subject_id) %>% summarize_all(mean, na.rm=TRUE)
write.table(tidy_data, "./data/tidy_data.txt", row.names = FALSE)
