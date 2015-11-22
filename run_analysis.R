# Getting and Cleaning Data - Course Project
require(dplyr)

featuresloc <- "_data/UCI HAR Dataset/features.txt"
activityloc <- "_data/UCI HAR Dataset/activity_labels.txt"


features <- read.table(featuresloc,
                       col.names = c("feature_id", "feature_label"))
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
tmpX <- tmpX[, grep("mean\\(\\)|std\\(\\)", features$feature_label)]

# Read in activities
tmpy <- read.table(yloc,
                   col.names = "activity_id")

# Combine activity, subject, and features
train <- cbind(tmpy, tmpsubject, tmpX)

# Add activity label
train <- merge(activity, train)

