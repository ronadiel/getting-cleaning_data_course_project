## CodeBook for the tidy dataset

## Data source
### This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here (with description): http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Feature Selection 
### Refer to the README and features_info files in the original dataset to learn more about the feature selection for this dataset. The following description is taken from these files:
### The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

### Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

### Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

### Per the assignment's requirements only the measurements on the mean and standard deviation for each measurement were extracted. 

## Variables
###  The dataset - names of features - were appropriately labeled  with descriptive variable names from the "activity_labels.txt".
* dataActivityTest, dataActivityTrain, dataSubjectTest, dataSubjectTrain, dataFeaturesTest and dataFeaturesTrain contain the data from the downloaded files.
* The "Data"" dataset merges the previous datasets to further analysis.
* Data_tidy contains the relevant averages which will be later stored in a  .txt  file.  
* The plyr package is used to apply  aggregate() function.

