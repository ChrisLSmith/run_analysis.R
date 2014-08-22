# Code Book
## Original Data Set
The variables contained in the original data set were collected from 30 volunteers ranging in age from 19-48.  Each person performed the following six activities wearing a smartphone (Galaxy S II) on their waist:

1. Walking (Coded as: WALKING)
2. Walking Upstairs (Coded as: WALKING_UPSTAIRS)
3. Walking Downstairs (Coded as: WALKING_DOWNSTAIRS)
4. Sitting (Coded as: SITTING)
5. Standing (Coded as: STANDING)
6. Laying (Coded as: LAYING)

Using the smartphone's embedded accelerometer and gyroscope, the team captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data, and 30% were used for the test data.

## The dataset includes the following files:
* **README.txt**
* **features_info.txt**: Shows information about the variables used on the feature vector.
* **features.txt**: List of all features.
* **activity_labels.txt**: Links the class labels with their activity name.
* **train/X_train.txt**: Training set.
* **train/y_train.txt**: Training labels.
* **test/X_test.txt**: Test set.
* **test/y_test.txt**: Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

* **train/subject_train.txt**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* **train/Inertial Signals/total_acc_x_train.txt**: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* **train/Inertial Signals/body_acc_x_train.txt**: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* **train/Inertial Signals/body_gyro_x_train.txt**: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Tidy Data Script
The script 'run_analysis.R' transforms the original data into a specific tidy data set that includes only those features that have to do with the mean or standard deviation.  The script itself follows the following steps:

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

## Features
The following is a list of the features and a description of their individual meanings.

* **t**: Time domain
* **f**: Frequency domain
* **mean**: Average for the preceeding descriptors in the names.
* **std**: Standard Deviation for the preceeding descriptors in the names.
* **X,Y,Z**: Denotes 3-axial signals in the X, Y, and Z Directions
* **BodyAcc**: Measures the acceleration signal for the body of the participant.
* **GravityAcc**: Measures the gravity acceleration signals.
* **BodyAccJerk**: Measures the body linear acceleration jerk signals.
* **BodyGyroJerk**:  Measures the angular velocity jerk signals.
* **BodyAccMag**: The magnitude of body acceleration signals.
* **GravityAccMag**: Magnitude of body acceleration jerk signals.
* **BodyAccJerkMag**: Magnitude of body acceleration jerk signals.
* **BodyGyroMag**: Magnitude of body angular velocity signals.
* **BodyGyroJerkMag**: Magnitude of angular velocity jerk signals.
* **Activity**: Class labels of the activity subjects engaged in.
* **SubjectID**: Subject identifier for each of the participants


