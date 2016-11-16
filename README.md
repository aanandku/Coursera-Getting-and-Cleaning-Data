# Coursera-Getting-and-Cleaning-Data

This is my final project for the getting and cleaning data course. The run_analysis.R is the R script I used for this project. 

##Part One

After downloading the zip-file to my working directory, I merged the training and test sets for X, y and subject.

##Part Two

I loaded the features set, subsetting on rows that had only std or mean mentioned, and subsetted the merged data set on it, to keep only columns that reflect a mean or standard deviation. 

I renamed the columns of the merged data set, using the names from features.

##Part Three

I loaded the activities set and replaced the rows of merged_y with the corresponding rows from activity.

##Part Four

Named the data set with descriptive variable names and combined all the merged data sets from Part One. 

##Part Five

I created another data set calculating the average of each variable for all activities and subjects. 
