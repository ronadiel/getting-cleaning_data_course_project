## Getting and Cleaning Data Project 

## Description of core steps in script

* First, the data is downloaded from the "Human Activity Recognition Using Smartphones Data Set", and then unzipped.
* The following datasets -- dataActivityTest, dataActivityTrain, dataSubjectTest, dataSubjectTrain, dataFeaturesTest and dataFeaturesTrain -- contain the data from the downloaded files.
* These files are then merged (pairing Train and Test) into: dataActivity, dataSubject, and dataFeatures.
* "activity" and "subject" names are then set to variables; and feature names are input from the features.txt
* Datasets are then merged one aside to the other to get a holistic data frame for all data.
* Next, only the measurements on the mean and standard deviation for each measurement are extracted.
* Descriptive activity names are used to name the activities in the dataset using activity_labels.txt
* the plyr package is used to simplify the analysis, e.g. using the aggregate() function.

### Finally, the tidy dataset Data_tidy is created by pooling only the required parameters, and this is writen into tidydata.txt

