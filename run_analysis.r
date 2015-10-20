########################### STEP 1 ###########################
# 1. Merges the training and the test sets to create one data set.

## Downloading the data zip ##
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "Dataset.zip", method = "curl")

## Extracting the zip file
unzip("dataset.zip")

# TRAIN DATA
#reading the train data
TrainSet_x <- read.table("UCI HAR Dataset\\train\\X_train.txt", header = FALSE)
TrainSet_y <- read.table("UCI HAR Dataset\\train\\y_train.txt", header = FALSE)
TrainSet_subjects <- read.table("UCI HAR Dataset\\train\\subject_train.txt", header = FALSE)
#Merging x and y and subject info
TrainSet <- cbind(TrainSet_y, TrainSet_subjects, TrainSet_x )
rm(TrainSet_y, TrainSet_subjects, TrainSet_x)
# TEST DATA
#reading the test data
TestSet_x <- read.table("UCI HAR Dataset\\test\\X_test.txt", header = FALSE)
TestSet_y <- read.table("UCI HAR Dataset\\test\\y_test.txt", header = FALSE)
TestSet_subjects <- read.table("UCI HAR Dataset\\test\\subject_test.txt", header = FALSE)

#Merging x and y and subject info
TestSet <- cbind(TestSet_y, TestSet_subjects, TestSet_x)
rm(TestSet_y, TestSet_subjects, TestSet_x)
# Merging both
BothSets <- rbind(TrainSet, TestSet)
rm(TrainSet, TestSet)

########################### STEP 2 ###########################
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# read the variable names
features <- read.table("UCI HAR Dataset\\features.txt", header = FALSE)
features <- features[,2]
#getting only mean and std columns
MeanColumns <- grep("*mean()", features)  
StdColumns <- grep("*std()", features)  

# Getting only this columns
ResultTable <- BothSets[,1:2]  # the Activity id and the user id
ResultTable <- cbind(ResultTable, BothSets[,MeanColumns + 2])
ResultTable <- cbind(ResultTable, BothSets[,StdColumns] + 2)
rm(BothSets)

########################### STEP 4 ###########################
#4. Appropriately labels the data set with descriptive variable names
FeatureNames <- c(c("Activity"), c("Subject"), as.character(features[MeanColumns]), as.character(features[StdColumns]))
colnames(ResultTable) <- FeatureNames

########################### STEP 3 ###########################
#3. Uses descriptive activity names to name the activities in the data set
# read the activities
Activities <-read.table("UCI HAR Dataset\\activity_labels.txt", header = FALSE)

for (n in 1:dim(Activities)[1])
  ResultTable$Activity[ResultTable$Activity == n] <- as.character(Activities[n, 2])

########################### STEP 5 ###########################
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
SummaryData <- aggregate(ResultTable[,3:ncol(ResultTable)], by=list(subject = ResultTable$Subject, Activity = ResultTable$Activity), mean)

#Saving data to a file
write.table(format(SummaryData, scientific=T), "tidy2.txt",
            row.names=F, col.names=F)
