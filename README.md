#Getting and Cleaning Data Course Project


This is the project for the 3rd course of the Data Science track on Coursera

##The data
The Data for this project came from [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "Data Link")

Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

##The files
* CodeBook.md : This document describes the variables, the data, and any transformations performed to clean up the dataset
* README.md : This document explain the project and the documents into it
* run_analysis.r : This document is the R script use to obtain the tidy dataset
 
##The goals
You should create one R script called run_analysis.R that does the following :

1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

##The steps
###First Goal : Merges the training and the test sets to create one data set

1. Read the test data
2. Merge the test data (With cbind)
3. Read the train data
4. Merge the train data (With cbind)
5. Merge the test and train data (With rbind)

###Seccond Goal : Extracts only the measurements on the mean and standard deviation for each measurement

1. Read the features text file
2. Extract mean and std from the feature file (Using Regular Expressions)
3. Extract measurements from the main data set (first goal)
 
###Third Goal : Uses descriptive activity names to name the activities in the data set

1. Read activity labels
2. Merging the name to the main data source
3. Cleaning the labels

###Fourth Goal : Appropriately labels the data set with descriptive variable names

1. Get the columns names
2. Clean the names
3. Change the columns names
 
###Fifth Goal : From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

1. Aggregate the data per subject and label
2. Convert to a .txt file
