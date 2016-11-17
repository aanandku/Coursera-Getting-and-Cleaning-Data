#Description of what I did in run_analysis. 

##First Part

First I downloaded the zip file to my working directory, loaded the test and training sets into R:

train_data is the X_train text file from the train folder
test_data is teh X_test text file from the test folder
y_train is the y_train text file from the train folder
y_test is the y_test text file from the test folder
subject_test is the subect_test text file from the test folder
subject_train is the subject_train text file from the train folder. 

merged_data is train_data and test_data merged
merged_subject is subject_train and subject_test merged
merged_y is y_train and y_test merged

##Second Part

features is the the features text file from the downloaded zip file 

mean_std : I extracted the columns from features that contained "mean" or std" in them and assigned it as mean_std

transformed merged_data by subsetting on mean_std columns....thereby limiting it to columns that contain only mean or std. 

Then, I replaced the column names of merged_data with the correct column names from features..these correct column names are as follows:

 tBodyAcc-mean()-X           tBodyAcc-mean()-Y           tBodyAcc-mean()-Z           tBodyAcc-std()-X           
 tBodyAcc-std()-Y            tBodyAcc-std()-Z            tGravityAcc-mean()-X        tGravityAcc-mean()-Y       
 tGravityAcc-mean()-Z        tGravityAcc-std()-X         tGravityAcc-std()-Y         tGravityAcc-std()-Z        
 tBodyAccJerk-mean()-X       tBodyAccJerk-mean()-Y       tBodyAccJerk-mean()-Z       tBodyAccJerk-std()-X       
 tBodyAccJerk-std()-Y        tBodyAccJerk-std()-Z        tBodyGyro-mean()-X          tBodyGyro-mean()-Y         
 tBodyGyro-mean()-Z          tBodyGyro-std()-X           tBodyGyro-std()-Y           tBodyGyro-std()-Z          
 tBodyGyroJerk-mean()-X      tBodyGyroJerk-mean()-Y      tBodyGyroJerk-mean()-Z      tBodyGyroJerk-std()-X      
 tBodyGyroJerk-std()-Y       tBodyGyroJerk-std()-Z       tBodyAccMag-mean()          tBodyAccMag-std()          
 tGravityAccMag-mean()       tGravityAccMag-std()        tBodyAccJerkMag-mean()      tBodyAccJerkMag-std()      
 tBodyGyroMag-mean()         tBodyGyroMag-std()          tBodyGyroJerkMag-mean()     tBodyGyroJerkMag-std()     
 fBodyAcc-mean()-X           fBodyAcc-mean()-Y           fBodyAcc-mean()-Z           fBodyAcc-std()-X           
 fBodyAcc-std()-Y            fBodyAcc-std()-Z            fBodyAccJerk-mean()-X       fBodyAccJerk-mean()-Y      
fBodyAccJerk-mean()-Z       fBodyAccJerk-std()-X        fBodyAccJerk-std()-Y        fBodyAccJerk-std()-Z       
fBodyGyro-mean()-X          fBodyGyro-mean()-Y          fBodyGyro-mean()-Z          fBodyGyro-std()-X          
fBodyGyro-std()-Y           fBodyGyro-std()-Z           fBodyAccMag-mean()          fBodyAccMag-std()          
fBodyBodyAccJerkMag-mean()  fBodyBodyAccJerkMag-std()   fBodyBodyGyroMag-mean()     fBodyBodyGyroMag-std()     
fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std() 

Then, I removed the () from all the column names for aesthetic purposes. 

##Third Part

activity is the activity_labels text file. 
replaced the first column of merged_y with the activities that corresponded to the indices from merged_y
renamed the column of merged_y as ACTIVITY

##Foruth and Fifth Parts

named merged_subject column as SUBJECT.
data_all is the combination of merged_data, merged_y and merged_subject

averages is the average of each variable for all subjects and activities. 

saved it as a text file called averages.txt


