---
title: "CODEBOOK"
output: html_document
---
###Coursera - Getting and Cleaning Data Course Project

### Wearable computer dataset
This is the codebook for the second (tidy) dataset asked for in the problem 
prompt. There are four columns of data, corresponding to the following table
using the below format:

**column name**  (class of data)  
- some description of the data
<ul>
    <li>allowed value 1
    <li>allowed value 2
    <li>or allowed range of values
    <li>... etc
</ul>

==============================================

**subjectNum** integer  
- identifier of the subject who carried out the experiment  
<ul>
    <li>1...30	
</ul>

**activityName** character  
- activity performed while wearing the smartphone  
<ul>
    <li>WALKING
    <li>WALKING_UPSTAIRS  
    <li>WALKING_DOWNSTAIRS  
    <li>SITTING 
    <li>STANDING  
    <li>LAYING
</ul>

**variable**  character  
- accelerometer and gyroscope 3-axial measurements. The 't' prefix indicates time domain signals and 'f' prefix indicates frequency domain signals
	<ul>
	<li>tBodyAcc-mean()-X  
	<li>tBodyAcc-mean()-Y  
	<li>tBodyAcc-mean()-Z  
	<li>tBodyAcc-std()-X  
	<li>tBodyAcc-std()-Y  
	<li>tBodyAcc-std()-Z  
	<li>tGravityAcc-mean()-X  
	<li>tGravityAcc-mean()-Y  
	<li>tGravityAcc-mean()-Z  
	<li>tGravityAcc-std()-X  
	<li>tGravityAcc-std()-Y  
	<li>tGravityAcc-std()-Z  
	<li>tBodyAccJerk-mean()-X  
	<li>tBodyAccJerk-mean()-Y  
	<li>tBodyAccJerk-mean()-Z  
	<li>tBodyAccJerk-std()-X  
	<li>tBodyAccJerk-std()-Y  
	<li>tBodyAccJerk-std()-Z  
	<li>tBodyGyro-mean()-X  
	<li>tBodyGyro-mean()-Y  
	<li>tBodyGyro-mean()-Z  
	<li>tBodyGyro-std()-X  
	<li>tBodyGyro-std()-Y  
	<li>tBodyGyro-std()-Z  
	<li>tBodyGyroJerk-mean()-X  
	<li>tBodyGyroJerk-mean()-Y  
	<li>tBodyGyroJerk-mean()-Z  
	<li>tBodyGyroJerk-std()-X  
	<li>tBodyGyroJerk-std()-Y  
	<li>tBodyGyroJerk-std()-Z  
	<li>tBodyAccMag-mean()  
	<li>tBodyAccMag-std()  
	<li>tGravityAccMag-mean()   
	<li>tGravityAccMag-std()  
	<li>tBodyAccJerkMag-mean()  
	<li>tBodyAccJerkMag-std()  
	<li>tBodyGyroMag-mean()  
	<li>tBodyGyroMag-std()  
	<li>tBodyGyroJerkMag-mean()  
	<li>tBodyGyroJerkMag-std()  
	<li>fBodyAcc-mean()-X  
	<li>fBodyAcc-mean()-Y  
	<li>fBodyAcc-mean()-Z  
	<li>fBodyAcc-std()-X  
	<li>fBodyAcc-std()-Y  
	<li>fBodyAcc-std()-Z  
	<li>fBodyAccJerk-mean()-X  
	<li>fBodyAccJerk-mean()-Y  
	<li>fBodyAccJerk-mean()-Z  
	<li>fBodyAccJerk-std()-X  
	<li>fBodyAccJerk-std()-Y  
	<li>fBodyAccJerk-std()-Z  
	<li>fBodyGyro-mean()-X  
	<li>fBodyGyro-mean()-Y  
	<li>fBodyGyro-mean()-Z  
	<li>fBodyGyro-std()-X  
	<li>fBodyGyro-std()-Y  
	<li>fBodyGyro-std()-Z  
	<li>fBodyAccMag-mean()  
	<li>fBodyAccMag-std()  
	<li>fBodyBodyAccJerkMag-mean()  
	<li>fBodyBodyAccJerkMag-std()  
	<li>fBodyBodyGyroMag-mean()  
	<li>fBodyBodyGyroMag-std()  
	<li>fBodyBodyGyroJerkMag-mean()  
	<li>fBodyBodyGyroJerkMag-std()  
	<li>angle(tBodyAccMean,gravity)  
	<li>angle(tBodyAccJerkMean),gravityMean)    
	<li>angle(tBodyGyroMean,gravityMean)    
	<li>angle(tBodyGyroJerkMean,gravityMean)  
	<li>angle(X,gravityMean)  
	<li>angle(Y,gravityMean)  
	<li>angle(Z,gravityMean)  
	</ul>
		
**calcMean**	numeric
	<ul>
	<li>ranges between [-0.99770, 0.97450]
	</ul>
