#library(reshape2)


# Download data set (Run this for the first time only)
#fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
#download.file(fileURL, "data1.zip", method="curl")
#unzip("data1.zip") 


# Load activity labels and features
mainLabel <- read.table("UCI HAR Dataset/activity_labels.txt")
mainLabel[,2] <- as.character(mainLabel[,2])
mainFeatures <- read.table("UCI HAR Dataset/features.txt")
mainFeatures[,2] <- as.character(mainFeatures[,2])


# Filter out data with mean and SD
featureIndex <- grep("mean|std", mainFeatures[,2])
featureNames <- mainFeatures[featureIndex,2]    #Filter out names
#Modify the feature name to be more visible
featureNames = gsub("-mean", "Mean", featureNames)
featureNames = gsub("-std", "Std", featureNames)
featureNames <- gsub("[-()]", "", featureNames)  #Final feature names


# Load train data
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
train <- read.table("UCI HAR Dataset/train/X_train.txt")[featureIndex]
train <- cbind(trainSubjects, trainActivities, train)
colnames(train) <- c("subject", "activity", featureNames)


# Load test data
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")[featureIndex]
test <- cbind(testSubjects, testActivities, test)
colnames(test) <- c("subject", "activity", featureNames)


# Combine train and test data
allData <- rbind(train, test)


# Create tidy dataset with 
allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)


#Export to text file
write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
