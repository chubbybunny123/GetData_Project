---
title: "README"
output: html_document
---
##Coursera - Getting/Cleaning Data Course Project

###Instructions from the assigment:
> You should create one R script called run_analysis.R that does the following: 
> <ul>
> <li> Merges the training and the test sets to create one data set.
> <li> Extracts only the measurements on the mean and standard deviation 
> for each measurement. 
> <li> Uses descriptive activity names to name the activities in the data set
> <li> Appropriately labels the data set with descriptive variable names. 
> <li> Creates a second, independent tidy data set with the average of each 
> variable for each activity and each subject.
> </ul>

###Dataset background:
The raw data can be obtained from  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
and a description of the research project at  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
  
Within the zip file are several explanatory files as well:  

+ README.txt -- A brief description of the experiments and the data files included
in the raw data set.

+ features_info.txt -- This describes the features (otherwise known as
measurements) are collected in this dataset. The many of the individual 
measurements are broken up  into components (X,Y,Z) and given as summary 
stats. 

###Assumptions made:

+ The working directory includes a copy of the UCI data archive. It has 
**not** been uploaded to this Github repository since it is rather large 
(~60MB).

+ The order of the rows given in the "_y", "_x", and "subject_" files are 
the same.

+ The order of the columns given in the "_x" are the same as the rows in the
features.txt file.

+ The subject numbers for the test and the train data set correspond to the
same subjects, i.e. subject 10 from the train data set is the same person as
subject 10 in the test data set.

+ The features (columns) are labeled in a 3-segment fashion. We will keep the
columns that have "Mean" in the first segment or ["mean()" or "std()"] in the
third segment
    - tBodyAcc, etc
    - -X. -Y, or -Z, or some ?angle?
    - mean(), std(), mad(), max(), min(), etc

+ The tidy data set uploaded corresponds to the filtered (std and mean only) 
and averaged set referred to in part 5 of the instructions.
  

###Raw data table construction:
(1.0299 &times; 10<sup>4</sup> rows x 563 columns)

```
    subjectNum      activityName    |   561 columns labeled with features.txt
    ---------------------------------------------------------------------------
    subject_train  | y_train.txt    |            x_train.txt
      .txt         |  translated to |       (7352 rows)
                   |  text using    |
                   |  activity_     |
                   |  labels.txt    |
                   |                |
    subject_test   | y_test.txt     |            x_test.txt
      .txt         |  translated to |       (2947 rows)
                   |  text using    |
                   |  activity_     |
                   |  labels.txt    |
                   |                |     
```

###Output: 
A comma-separated file of 4 columns, as described in the codebook.md, named
tidyData.txt.

