## Step 1 : Merges the training and the test sets to create one data set.
# Read Test Data
testLabels <- read.table("test/y_test.txt", col.names="label")
testSubjects <- read.table("test/subject_test.txt", col.names="subject")
testData <- read.table("test/X_test.txt")

# Merge test data	
testAllData <- cbind(testSubjects, testLabels, testData)

# Read train data
trainLabels <- read.table("train/y_train.txt", col.names="label")
trainSubjects <- read.table("train/subject_train.txt", col.names="subject")
trainData <- read.table("train/X_train.txt")

# Merge train data
trainAllData <- cbind(trainSubjects, trainLabels, trainData)

# Merge train and test data
data <- rbind(testAllData,trainAllData)


## Step 2 : Extracts only the measurements on the mean and standard deviation for each measurement. 
# Read features
features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)

# Extract mean and std from the features
featuresMeanStd <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]

# Extract measurements for mean and std only
dataMeanStd <- data.frame(data[,c(1,2,featuresMeanStd$V1+2)])


## Step 3 : Uses descriptive activity names to name the activities in the data set
# Read Activity Names
activityNames <- read.table("activity_labels.txt", stringsAsFactors=FALSE)

# Merge to get names
dataMeanStd <- merge(dataMeanStd,activityNames,by.x="label",by.y="V1")

# Cleaning (remove label + rename label + reorder data
dataMeanStd <- dataMeanStd[,2:69]
colnames(dataMeanStd)[68] <-"label"
dataMeanStd <- dataMeanStd[c(1,68,2:67)]

## Step 4 : Appropriately labels the data set with descriptive variable names. 
# Get Good Col Names
goodColnames <- c("subject", "label", featuresMeanStd$V2)

# To lowercase and remove unused caracters
 goodColnames <- tolower(gsub("[^[:alpha:]]", "", goodColnames))

# Change columns names
colnames(dataMeanStd) <- goodColnames

## Step 5 : From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
aggData <-  aggregate(dataMeanStd[, 3:ncol(dataMeanStd)],by=list(subject = dataMeanStd$subject, label = dataMeanStd$label),mean)

# Convert to .txt file
write.table(format(aggData, scientific=T), "tidyData.txt",row.names=F, col.names=F, quote=2)
