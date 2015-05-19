# Downloading the Samsung data:
if(!file.exists("./data_Sam")){dir.create("./data_Sam")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data_Sam/data_Samsung.zip")

# Unziping the UCI HAR Dataset:
unzip(zipfile="./data_Sam/data_Samsung.zip",exdir="./data_Sam")
path_file <- file.path("./data_Sam" , "UCI HAR Dataset")
  ### files <- list.files(path_file, recursive=TRUE)
  ### files

# Read the Activity files: Test and Train:
dataActivityTest  <- read.table(file.path(path_file, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(path_file, "train", "Y_train.txt"),header = FALSE)
# Read the Subject files: Test and Train:
dataSubjectTest  <- read.table(file.path(path_file, "test" , "subject_test.txt"),header = FALSE)
dataSubjectTrain <- read.table(file.path(path_file, "train", "subject_train.txt"),header = FALSE)
# Read the Features files: Test and Train:
dataFeaturesTest  <- read.table(file.path(path_file, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(path_file, "train", "X_train.txt"),header = FALSE)

  ### str(dataActivityTest)
  ### str(dataActivityTrain)
  ### str(dataSubjectTest)
  ### str(dataSubjectTrain)
  ### str(dataFeaturesTest)
  ### str(dataFeaturesTrain)

# Merging the Test and Train datasets one below the other: 
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

# Setting names to variables:
names(dataActivity) <- c("activity")
names(dataSubject) <- c("subject")
data_FeaturesNames <- read.table(file.path(path_file, "features.txt"),head=FALSE)
names(dataFeatures) <- data_FeaturesNames$V2

# Merging all datasets one aside to the other to get a holistic data frame for all data: 
data_interim <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, data_interim)
  ### str(Data)

# Extracting only the measurements on the mean and standard deviation for each measurement:
subdata_FeaturesNames <- data_FeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", data_FeaturesNames$V2)]
selectedNames <- c(as.character(subdata_FeaturesNames), "subject", "activity" )
Data <- subset(Data, select = selectedNames)
  ### str(Data)

# Using descriptive activity names to name the activities in the data set:
activityLabels <- read.table(file.path(path_file, "activity_labels.txt"),header = FALSE)
  ### head(activityLabels)
Data[, "activity"] <- activityLabels[Data[, "activity"], 2]
  ### head(Data$activity,30)

# Appropriately labeling the data set with descriptive variable names -- Names of Features 
    # are labelled using descriptive variable names.

names(Data) <- gsub("^t", "time", names(Data))
names(Data) <- gsub("^f", "frequency", names(Data))
names(Data) <- gsub("Acc", "Accelerometer", names(Data))
names(Data) <- gsub("Gyro", "Gyroscope", names(Data))
names(Data) <- gsub("Mag", "Magnitude", names(Data))
names(Data) <- gsub("BodyBody", "Body", names(Data))
names(Data)

# Creating a second,independent tidy data set and outputing it:
install.packages("plyr")
library(plyr)

Data_tidy <- aggregate(. ~subject + activity, Data, mean)
Data_tidy <- Data_tidy[order(Data_tidy$subject,Data_tidy$activity),]
  ### head(Data_tidy)
write.table(Data_tidy, file = "tidydata.txt",row.name=FALSE)



