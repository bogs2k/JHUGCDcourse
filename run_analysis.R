setwd("~/wk/R/3-Getting and Cleaning Data/project/")


# check for folder existence
if (!file.exists("UCI HAR Dataset")){

  # check for zip file
  if (!file.exists("getdata-projectfiles-UCI HAR Dataset.zip")){

    # download if necessary
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",method="wget")
  }

  # unzip if needed
  unzip("getdata-projectfiles-UCI HAR Dataset.zip")
}		


# read the list of features
features <- read.table("UCI HAR Dataset/features.txt", comment.char = "")
colnames(features)=c("id","feature")

# read the training data
dataTrain <- read.table("UCI HAR Dataset/train/X_train.txt", comment.char = "", colClasses="numeric")

# add proper column labels 
colnames(dataTrain) = features$feature

# read subject and activities corresponding to train data
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
activityTrain <- read.table("UCI HAR Dataset/train/y_train.txt")

colnames(subjectTrain) = c("subject")
colnames(activityTrain) = c("activity")

# add subject and activities to data set
d1 = cbind(subjectTrain,activityTrain,dataTrain)

rm(dataTrain)

#read the test data
dataTest <- read.table("UCI HAR Dataset/test/X_test.txt", comment.char = "", colClasses="numeric")

# addd proper column labels 
colnames(dataTest) = features$feature

# read subject and activities corresponding to test data
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
activityTest <- read.table("UCI HAR Dataset/test/y_test.txt")

colnames(subjectTest) = c("subject")
colnames(activityTest) = c("activity")

# add subject and activities to train set
d2 = cbind(subjectTest,activityTest,dataTest )

rm(dataTest)

# merge the 2 sets
data <- rbind(d1,d2)

rm(d1,d2)

#keep only the desired features from the whole group
featuresGood <-subset(features, grepl("^t", features$feature) & (grepl("-mean", features$feature) | grepl("-std", features$feature)) ,)

# shift for the 2 extra columns
featuresGoodIds <- featuresGood$id + 2

# keep only the data for the features selected
data2= subset(data,,c(1,2,featuresGoodIds))

# discard the large unneeded data
rm(data)

# change feature names to be more friendly
newnames <- colnames(data2)
newnames <- gsub("^t","time",newnames,ignore.case=F,perl=T)
newnames <- gsub("-mean","Mean",newnames,ignore.case=F,perl=T)
newnames <- gsub("-std","StandardDeviation",newnames,ignore.case=F,perl=T)
newnames <- gsub("Acc","Acceleration",newnames,ignore.case=F,perl=T)
newnames <- gsub("Gyro","Gyroscope",newnames,ignore.case=F,perl=T)
newnames <- gsub("Mag","Magnitude",newnames,ignore.case=F,perl=T)
newnames <- gsub("[^a-z.]","",newnames,ignore.case=T,perl=T)
colnames(data2) <- newnames

# aggregates the data/calculates the means of the variables
finalData <- aggregate(data2, by = list("subject"=data2$subject, "activity"=data2$activity),mean) 

# adds descriptive names for subjects and activities
finalData$subject <- paste("Person ",finalData$subject)

activities = read.table("UCI HAR Dataset/activity_labels.txt")
activities$V2 <- gsub("_"," ",activities$V2)

finalData$activity <- activities[finalData$activity,2]

finalData2 <- subset(finalData,,-c(3,4))

# saves the tidy dataset
write.table(finalData2, file="tidydata.txt",sep="\t", row.names=F)
