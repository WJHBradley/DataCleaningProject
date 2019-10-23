# This script will summarize data from the UCI HAR Dataset
# To fulfill the assignment this script will do the following:
      # 1 - Download the data files from the .zip folder
      # 2 - Merge the test and train datasets into one data set
      # 3 - select columns that represent mean() and std() measurements
      # 4 - Use descriptive names for activities represented by the data
      # 5 - Create variable names for the data set
      # 6 - Use the new data set to create a tidy independent data set
              # a - The tidy data set will have an average of each variable for 
              #     each activity and each subject

library(dply)

setwd("C:/Users/wbradley/Desktop/datasciencecoursera/") #sets working directory for my personal comp

#### 1 Download Files ####

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "getdata_projectfiles_UCI HAR Dataset.zip")

#the next command unzips the file, pulling out only the relevant files for this exercise
unzip("getdata_projectfiles_UCI HAR Dataset.zip",
        files = c("UCI HAR Dataset/features.txt","UCI HAR Dataset/activity_labels.txt",  #two files with labeling information
                  "UCI HAR Dataset/test/subject_test.txt","UCI HAR Dataset/test/X_test.txt",
                  "UCI HAR Dataset/test/y_test.txt",    #three files for test subjects
                  "UCI HAR Dataset/train/subject_train.txt","UCI HAR Dataset/train/X_train.txt",
                  "UCI HAR Dataset/train/y_train.txt"
                  )
      )

#as an intermediate step the two files with labeling information will be pulled into the environment

cnames <- read.table("UCI HAR Dataset/features.txt") #V2 of this table contains the column names
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt") #this will be used to label the activities later

#### 2 Merge test and train groups ####

#two datasets will be created to merge - testdata and traindata

testdata <- cbind(
                read.table("UCI HAR Dataset/test/subject_test.txt",col.names = "Subject"),
                read.table("UCI HAR Dataset/test/y_test.txt", col.names = "ActivityLabel"),
                read.table("UCI HAR Dataset/test/X_test.txt", col.names = cnames$V2)
)

traindata <- cbind(
                read.table("UCI HAR Dataset/train/subject_train.txt",col.names = "Subject"),
                read.table("UCI HAR Dataset/train/y_train.txt", col.names = "ActivityLabel"),
                read.table("UCI HAR Dataset/train/X_train.txt", col.names = cnames$V2)
)

#Then the combination into one data set

fulldata <- rbind(testdata,traindata)

#### 3 Condense to mean() and std() measures #####

#first, columns are identified for mean and std values
#search for mean() and std() among the original column names, which are listed as mean and standard deviation
#adding 2 to offset for the added columns of subject and activity

measures <- grep("mean\\(\\)|std\\(\\)",cnames$V2) +2

relevantdata <- select(fulldata, Subject, ActivityLabel, measures)

#### 4 Descriptors ####


