#FINAL PROJECT 

# download data
if(!file.exists("./data")) dir.create("./data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "smartphones.csv")


#FIRST PART, MERGING TRAINING AND TEST SETS
train_data <- read.table("./data/train/X_train.txt")
test_data <- read.table("./data/test/X_test.txt")
y_train <- read.table("./data/train/y_train.txt")
y_test <- read.table("./data/test/y_test.txt")
subject_train <- read.table("./data/train/subject_train.txt")
subject_test <- read.table("./data/test/subject_test.txt")

merged_data <- rbind(train_data, test_data)
merged_subject <- rbind(subject_train, subject_test)
merged_y <- rbind(y_train, y_test)


#SECOND PART, EXTRACTING THE MEAN AND STD FOR EACH MEASUREMENT

features <- read.table("features.txt")
head(features)

mean_std <- grep("mean\\(\\)|std\\(\\)", features[, 2])
#the code above just selects all the rows from features that have "std" or "mean" mentioned. 
#will use this to subset merged_data on...(only care about rows that have std or mean mentioned)

merged_data <- merged_data[, mean_std]
names(merged_data) <- features[mean_std, 2] #correcting the column names
names(merged_data) <- gsub("\\(\\)", "", features[mean_std, 2]) #getting rid of the () cause it looks ugly!



#THIRD PART, NAMING ACTIVITIES IN THE DATA SET

activity <- read.table("activity_labels.txt")
head(activity)
merged_y[, 1] <- activity[merged_y[, 1], 2]
names(merged_y) <- "ACTIVITY"


#FOURTH PART, NAMING DATA SET WITH DESCRIPTIVE VARIABLE NAMES

names(merged_subject) <- "SUBJECT"
#now, i'm going to combine all the data
data_all <- cbind(merged_data, merged_y, merged_subject)

#FIFTH STEP, CREATE A SECOND INDEPENDENT TIDY DATA SET WITH AVGS OF EACH VARIABLE..for ALL ACTIVITY AND SUBJECT

library(plyr)
averages <- ddply(data_all, .(ACTIVITY, SUBJECT), function(x) colMeans(x[, 1:66]))
write.table(averages, "averages.txt", row.name=FALSE)

