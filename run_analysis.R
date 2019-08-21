library(data.table)
library(dplyr)

# download and unzip the dataset file, using a current directory as the work.
setwd(".")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "./Dataset.zip")
unzip("./Dataset.zip")

# the zip file is extracted into <working_directory>.
DATASET_DIR <- paste(getwd(), "UCI HAR Dataset", sep = "/")

# Step 1: Merges the training and the test sets to create one data set.

## subject_train: id of volunteers.
subject_train <- fread(paste(DATASET_DIR, "train/subject_train.txt", sep = "/"), sep = " ")
colnames(subject_train) <- c("Subject")

### x_train: 561 feature vectors, y_train: activity label.
x_train <- fread(paste(DATASET_DIR, "train/X_train.txt", sep = "/"), sep = " ")
colnames(x_train) <- paste("x", seq(1:561), sep = "")

y_train <- fread(paste(DATASET_DIR, "train/Y_train.txt", sep = "/"),
                 sep = " ", colClasses = "character")
colnames(y_train) <- c("Activity")

### signal data: 1 row = 128 data 
total_acc_x_train <- fread(
  paste(DATASET_DIR, "train/Inertial Signals/total_acc_x_train.txt", sep = "/"),
  sep = " ")
colnames(total_acc_x_train) <- paste("total_acc_x", seq(1:128), sep = "")

total_acc_y_train <- fread(
  paste(DATASET_DIR, "train/Inertial Signals/total_acc_y_train.txt", sep = "/"), sep = " ")
colnames(total_acc_y_train) <- paste("total_acc_y", seq(1:128), sep = "")

total_acc_z_train <- fread(
  paste(DATASET_DIR, "train/Inertial Signals/total_acc_z_train.txt", sep = "/"), sep = " ")
colnames(total_acc_z_train) <- paste("total_acc_z", seq(1:128), sep = "")

acc_x_train <- fread(
  paste(DATASET_DIR, "train/Inertial Signals/body_acc_x_train.txt", sep = "/"), sep = " ")
colnames(acc_x_train) <- paste("acc_x", seq(1:128), sep = "")

acc_y_train <- fread(
  paste(DATASET_DIR, "train/Inertial Signals/body_acc_y_train.txt", sep = "/"), sep = " ")
colnames(acc_y_train) <- paste("acc_y", seq(1:128), sep = "")

acc_z_train <- fread(
  paste(DATASET_DIR, "train/Inertial Signals/body_acc_z_train.txt", sep = "/"), sep = " ")
colnames(acc_z_train) <- paste("acc_z", seq(1:128), sep = "")

gyro_x_train <- fread(
  paste(DATASET_DIR, "train/Inertial Signals/body_gyro_x_train.txt", sep = "/"), sep = " ")
colnames(gyro_x_train) <- paste("gyro_x", seq(1:128), sep = "")

gyro_y_train <- fread(
  paste(DATASET_DIR, "train/Inertial Signals/body_gyro_y_train.txt", sep = "/"), sep = " ")
colnames(gyro_y_train) <- paste("gyro_y", seq(1:128), sep = "")

gyro_z_train <- fread(
  paste(DATASET_DIR, "train/Inertial Signals/body_gyro_z_train.txt", sep = "/"), sep = " ")
colnames(gyro_z_train) <- paste("gyro_z", seq(1:128), sep = "")

# create a train data.table with all variables in one row.
TRAIN_RECORDS <- data.table(
  subject_train,
  y_train,
  x_train, 
  total_acc_x_train, total_acc_y_train, total_acc_z_train,
  acc_x_train, acc_y_train, acc_z_train,
  gyro_x_train, gyro_y_train, gyro_z_train)

# read test data files.
subject_test <- fread(paste(DATASET_DIR, "test/subject_test.txt", sep = "/"), sep = " ")
colnames(subject_test) <- c("Subject")

x_test <- fread(paste(DATASET_DIR, "test/X_test.txt", sep = "/"), sep = " ")
colnames(x_test) <- paste("x", seq(1:561), sep = "")

y_test <- fread(paste(DATASET_DIR, "test/Y_test.txt", sep = "/"),
                sep = " ", colClasses = "character")
colnames(y_test) <- c("Activity")

total_acc_x_test <- fread(
  paste(DATASET_DIR, "test/Inertial Signals/total_acc_x_test.txt", sep = "/"), sep = " ")
colnames(total_acc_x_test) <- paste("total_acc_x", seq(1:128), sep = "")

total_acc_y_test <- fread(
  paste(DATASET_DIR, "test/Inertial Signals/total_acc_y_test.txt", sep = "/"), sep = " ")
colnames(total_acc_y_test) <- paste("total_acc_y", seq(1:128), sep = "")

total_acc_z_test <- fread(
  paste(DATASET_DIR, "test/Inertial Signals/total_acc_z_test.txt", sep = "/"), sep = " ")
colnames(total_acc_z_test) <- paste("total_acc_z", seq(1:128), sep = "")

acc_x_test <- fread(
  paste(DATASET_DIR, "test/Inertial Signals/body_acc_x_test.txt", sep = "/"), sep = " ")
colnames(acc_x_test) <- paste("acc_x", seq(1:128), sep = "")

acc_y_test <- fread(
  paste(DATASET_DIR, "test/Inertial Signals/body_acc_y_test.txt", sep = "/"), sep = " ")
colnames(acc_y_test) <- paste("acc_y", seq(1:128), sep = "")

acc_z_test <- fread(
  paste(DATASET_DIR, "test/Inertial Signals/body_acc_z_test.txt", sep = "/"), sep = " ")
colnames(acc_z_test) <- paste("acc_z", seq(1:128), sep = "")

gyro_x_test <- fread(
  paste(DATASET_DIR, "test/Inertial Signals/body_gyro_x_test.txt", sep = "/"), sep = " ")
colnames(gyro_x_test) <- paste("gyro_x", seq(1:128), sep = "")

gyro_y_test <- fread(
  paste(DATASET_DIR, "test/Inertial Signals/body_gyro_y_test.txt", sep = "/"), sep = " ")
colnames(gyro_y_test) <- paste("gyro_y", seq(1:128), sep = "")

gyro_z_test <- fread(
  paste(DATASET_DIR, "test/Inertial Signals/body_gyro_z_test.txt", sep = "/"), sep = " ")
colnames(gyro_z_test) <- paste("gyro_z", seq(1:128), sep = "")

TEST_RECORDS <- data.table(
  subject_test,
  x_test, y_test, 
  total_acc_x_test, total_acc_y_test, total_acc_z_test,
  acc_x_test, acc_y_test, acc_z_test,
  gyro_x_test, gyro_y_test, gyro_z_test)

## merge TRAIN_RECORDS and TEST_RECORDS in one large table.
##   - measurements are still character vector with multiple values.
ALL_RECORDS <- rbind(TRAIN_RECORDS, TEST_RECORDS)


# Step 2: Extracts only the measurements on the mean and 
# standard deviation for each measurement.

# features: each row contains "feature code" and "feature".
#   - select features whose name (column 2) contains mean().
features <- fread(paste(DATASET_DIR, "features.txt", sep = "/"), sep = " ")
colnames(features) <- c("code", "feature")
features_mean <- subset(
  features, sapply(features$feature, function(m){grep("*.mean().*", m)}) == 1)
features_std <- subset(
  features, sapply(features$feature, function(s){grep("*.std().*", s)}) == 1)

# subset - subject:activity:means
mean_columns <- sapply(features_mean[,1], function(m) { paste("x", m, sep="")})
std_columns <- sapply(features_std[,1], function(s) { paste("x", s, sep="")})
tidy_data <- select(ALL_RECORDS, Subject, Activity, mean_columns, std_columns)


# Step 3: Uses descriptive activity names to name the activities in the data set

# activity_labels: each row contains "activity code" and "label".
activity_labels <- fread(
  paste(DATASET_DIR, "activity_labels.txt", sep = "/"),
  sep = " ", colClasses = c("character", "character"))
colnames(activity_labels) <- c("code", "activity")

# replace activity 'code' with 'labels'.
tidy_data <- tidy_data[, Activity := as.character(Activity)]
for (i in 1:nrow(activity_labels)) {
  code <- activity_labels[i, code]
  label <- activity_labels[i, activity]
  tidy_data[Activity == as.character(code), Activity := label]
}


# Step 4: Appropriately labels the data set with descriptive variable names.
colnames(tidy_data) <- c("subject", "activity",
                         unlist(rbind(features_mean[,2], features_std[,2])))


# Step 5: From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity 
# and each subject.
summary_mean <- tidy_data %>% group_by(subject, activity) %>% summarise_all(mean)
write.table(summary_mean, paste(getwd(), "summary_dataset.txt", sep = "/"), row.names = FALSE)
