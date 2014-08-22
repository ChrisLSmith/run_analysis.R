run_analysis.R
==============

# Overview
This repository contains scripts and data for the Course Project that is part of Coursera's "Getting and Cleaning Data", taken August 2014.

# The Data
The zipped data used for this assignment is provided at the following location:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The original source of the data is the Human Activity Recognition Using Smartphones Data Set. It can be found here:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information
The dataset contains information collected from 30 volunteers ranging from ages 19-48.  Each person performed the following six activities while wearing a smartphone (Samsung Galaxy S II) on their wasit:

    1. Walking
    2. Walking Upstairs
    3. Walking Downstairs
    4. Sitting
    5. Standing
    6. Laying

Using the smartphone's embedded accelerometer and gyroscope, the team captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  The experiments were video-recorded to label the data manually.  The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data, and 30% were used for the test data.

More information about the data can be found in the codebook that is part of this repository, or via the README file from the original data set.

# Creating a Tidy Data Set
The goal of this analysis was simply to tidy the dataset and make it conform to tidy dataset parameters.  To accomplish this, I developed a processing script in R, which does the following:

1. Read data from raw text files into data frames using read.table()
2. Merge training and test data for measurements (X-files) into a merged data frame for measurements.
2. Rename the columns based on the features dataset provided (in features.txt)
3. Using grep, determine which columns in the X-files deal with the mean (looking for "mean()")
4. Using grep, determine which columns in the X-files deal with the standard deviation (looking for "std()")
5. Create a new dataframe based on the subset of the original with only the mean and std columns selected
6. Merge with the Y-files (which describe activities) and name the first column "Activity" since it is unnamed
7. Label the dataframe with the appropriate activity labels
8. Bind the resulting data frame with the columns from activities
9. Using the aggregate function to collate the data and place it into the tidy data frame
10. Rename the column names appropriately and write the tidy data to the FinalData.txt file
