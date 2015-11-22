#Data Code Book

## Original Documentation

This project uses the **Human Activity Recognition Using Smartphones Data Set** from the *UCI Machine Learning Repository* located at the link below. The original documentation is located in the *Original_Docs* folder.

Link: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]  

## Data Description from Original Documentation

*The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.*

*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.*

## All Data (all_data)

### Variables
- activity_id - Code indicating the activity being performed
- activity_label - The descriptive label for the activity
- subject_id - Unique identifier for the subject performing the activity
- All remaining variables represent the mean and standard deviation for the following list of accelerometer and gyroscope readings from the feature vector. Any variable with '-XYZ' in the name indicates there are separate reading for each axial X, Y, and Z. *Note: Features are normalized and bounded within [-1,1], therefore there are no units to these adjusted values.*
  - tBodyAcc-XYZ
  - tGravityAcc-XYZ
  - tBodyAccJerk-XYZ
  - tBodyGyro-XYZ
  - tBodyGyroJerk-XYZ
  - tBodyAccMag
  - tGravityAccMag
  - tBodyAccJerkMag
  - tBodyGyroMag
  - tBodyGyroJerkMag
  - fBodyAcc-XYZ
  - fBodyAccJerk-XYZ
  - fBodyGyro-XYZ
  - fBodyAccMag
  - fBodyAccJerkMag
  - fBodyGyroMag
  - fBodyGyroJerkMag

### Processing Steps
- I used the original features and activity labels contained in the provided data.
- For the train and test data, the subject, activity, and feature vector data were read in separately and then column binding together.
- The feature vectors were subset to only the mean and standard deviation calculations.
- The train and test data were then row binded together to form the all_data table. The activity labels were merged in based on the activity code.

## Summary Data (summary_data)

### Variables
- The variables are the same as above with the removal of the activity_id.

### Processing Steps
- The data was grouped by the subject_id and activity_label.
- Each group was then summarized by the mean value of the feature vector.
