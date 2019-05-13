library(reshape2)

filename <- "getdata_dataset.zip"

# Download data set
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  
# Unzip the dataset
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Load activity labels and features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Filter out data with mean and standard deviation
featuretoKeep <- grep(".*mean.*|.*std.*", features[,2])
featuretoKeep.names <- features[featuretoKeep,2]
featuretoKeep.names = gsub("-mean", "Mean", featuretoKeep.names)
featuretoKeep.names = gsub("-std", "Std", featuretoKeep.names)
featuretoKeep.names <- gsub("[-()]", "", featuretoKeep.names)

# Load train data
train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuretoKeep]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

# Load test data
test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuretoKeep]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# merge datasets
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", featuretoKeep.names)

# Convert activities & subjects into factors
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
allData$subject <- as.factor(allData$subject)

# Create tidy dataset that consists of the average of each variable for each subject & activity pair
allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
