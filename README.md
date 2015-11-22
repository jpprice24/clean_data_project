# Getting and Cleaning Data - Course Project
## Author: John Price
## Date: November 22, 2015

This project uses data downloaded via the following link. The data is not contained in the GitHub repository.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This project processes and organizes the downloaded data in accordance with the assignment instructions. Theses instructions can be found on the Coursera site for the course.

## CodeBook.md
The codebook contains information regarding the original data from the above download along with the two datasets that are created by the run_analysis.R script.

## run_analysis.R
This R script processes the files from the downloaded .zip file. The code creates two datasets. The first dataset, *all_data*, contains all of the mean and standard deviation feature measurements from the training and testing data files. The second dataset, *summary_data*, contains the mean of the feature measurements grouped by subject and activity.
