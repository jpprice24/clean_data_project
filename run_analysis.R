# Getting and Cleaning Data - Course Project
# Author: John Price
# Date: November 22, 2015

require(dplyr)

# Set locations of features and activity label files
featuresloc <- "_data/UCI HAR Dataset/features.txt"
activityloc <- "_data/UCI HAR Dataset/activity_labels.txt"

# Read in features list and adjust the feature name to remove
# the characters -, (, and ) so the names can be used as R
# variable names
features <- read.table(featuresloc,
                       col.names = c("feature_id", "feature_name"))
features$feature_label <- gsub("\\(\\)", "", features$feature_name)
features$feature_label <- gsub("-", "_", features$feature_label)

# Read in the activity labels
activity <- read.table(activityloc,
                       col.names = c("activity_id", "activity_label"))

################################################################################
## Create train data frame
################################################################################

# Set file locations
subjectloc <- "_data/UCI HAR Dataset/train/subject_train.txt"
Xloc <- "_data/UCI HAR Dataset/train/X_train.txt"
yloc <- "_data/UCI HAR Dataset/train/y_train.txt"

# Read in subject IDs
tmpsubject <- read.table(subjectloc,
                         col.names = "subject_id")

# Read in feature variables, set column names based on features
tmpX <- read.table(Xloc,
                   col.names = features$feature_label)

# Only use columns pertaining to a mean or standard deviation
# of a feature
tmpX <- tmpX[, grep("mean\\(\\)|std\\(\\)", features$feature_name)]

# Read in activities
tmpy <- read.table(yloc,
                   col.names = "activity_id")

# Combine activity, subject, and features
train <- cbind(tmpy, tmpsubject, tmpX)

# Add activity label
train <- merge(activity, train)

################################################################################
## Create test data frame
################################################################################

# Set file locations
subjectloc <- "_data/UCI HAR Dataset/test/subject_test.txt"
Xloc <- "_data/UCI HAR Dataset/test/X_test.txt"
yloc <- "_data/UCI HAR Dataset/test/y_test.txt"

# Read in subject IDs
tmpsubject <- read.table(subjectloc,
                         col.names = "subject_id")

# Read in feature variables, set column names based on features
tmpX <- read.table(Xloc,
                   col.names = features$feature_label)

# Only use columns pertaining to a mean or standard deviation
# of a feature
tmpX <- tmpX[, grep("mean\\(\\)|std\\(\\)", features$feature_name)]

# Read in activities
tmpy <- read.table(yloc,
                   col.names = "activity_id")

# Combine activity, subject, and features
test <- cbind(tmpy, tmpsubject, tmpX)

# Add activity label
test <- merge(activity, test)

################################################################################
## Combine training and test datasets
################################################################################

all_data <- rbind(train, test)

################################################################################
## Create summary dataset
################################################################################

# Group by subject and activity, summarize by taking the mean of each feature
# mean and standard deviation
summary_data <- all_data %>%
  select(subject_id, activity_label, tBodyAcc_mean_X:fBodyBodyGyroJerkMag_std) %>%
  group_by(subject_id, activity_label) %>%
  summarize_each(funs(mean))

write.table(summary_data, file = "summary_data.txt", row.names = FALSE)
