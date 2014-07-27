# You should create one R script called run_analysis.R that does the following: 
# - Merges the training and the test sets to create one data set.
# - Extracts only the measurements on the mean and standard deviation 
# for each measurement. 
# - Uses descriptive activity names to name the activities in the data set
# - Appropriately labels the data set with descriptive variable names. 
# - Creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject. 


# setwd("D://Google Drive//ubuntu-share//coursera-getData//getData_project")
setwd("~/Desktop/ubuntu-share/coursera-getData/getData_project")

###############################
## Import the data sets into R

## First name all the data
trainSetName <- "./UCI HAR Dataset/train/X_train.txt"
testSetName <- "./UCI HAR Dataset/test/X_test.txt"

train_yName <- "./UCI HAR Dataset/train/Y_train.txt"
test_yName <- "./UCI HAR Dataset/test/Y_test.txt"

train_subName <- "./UCI HAR Dataset/train/subject_train.txt"
test_subName <- "./UCI HAR Dataset/test/subject_test.txt"

activityName <- "./UCI HAR Dataset/activity_labels.txt"
featuresName <- "./UCI HAR Dataset/features.txt"

## Then read in the data
train_y <- read.table(train_yName, colClasses="integer"
                      , col.names = "activityNum")
test_y <- read.table(test_yName, colClasses="integer"
                     , col.names = "activityNum")

subject_train <- read.table(train_subName, colClasses="integer"
                            ,col.names = "subjectNum")
subject_test <- read.table(test_subName, colClasses="integer"
                           ,col.names = "subjectNum")

test <- read.table(testSetName, colClasses="numeric")
train <- read.table(trainSetName,colClasses="numeric")
## dim(train)
## 7352 561
## 561 columns matches the number of entries in features.txt

activity <- read.table(activityName, col.names = c("code", "activityName"))
# activity
# code        activityName
# 1    1            WALKING
# 2    2   WALKING_UPSTAIRS
# 3    3 WALKING_DOWNSTAIRS
# 4    4            SITTING
# 5    5           STANDING
# 6    6             LAYING

# using the raw features wording for the column names
# but separating the sections out to determine which columns
# to keep
prefeatures <- read.table(featuresName, sep = " ")
write.table(prefeatures[,2], file = "prefeatures.txt"
            , row.names = FALSE, col.names = FALSE
            , quote = FALSE
)
features <- read.table("prefeatures.txt"
                       , sep = "-", fill = TRUE
                       , col.names = c("signals", "variables", "dir"))

features$isSignalMean <- grepl("Mean", features$signals)
features$isMeanOrStd <- ifelse((features$variables == "std()") |
                                   (features$variables == "mean()")
                               , TRUE, FALSE)
features$include <- features$isSignalMean | features$isMeanOrStd
sum(features$include)
# 73
includedColNames <- t(prefeatures[features$include, 2])
#  write.table(as.character(includedColNames), file = "includedColNames.txt"
#              , row.names = FALSE, col.names = FALSE
#              , quote = FALSE)

###############################
## Give the measurement data (test_x and train_x) column labels
colnames(test) <- t(prefeatures[,2])
colnames(train) <- t(prefeatures[,2])

###############################
## Paste the tables together
test_all <- cbind(subject_test, test_y, test)
train_all <- cbind(subject_train, train_y, train)

## test that the columns have the same names
# setdiff(names(train_all), names(test_all))

train_test <- rbind(train_all, test_all)

###############################
## Convert the activity number into text and remove the number
train_test <- merge(train_test, activity, by.x="activityNum", by.y="code"
                , all.x = TRUE, sort = FALSE)
train_test$activityNum <- NULL



##################################
## Remove the measurement columns that are not mean
## or std. Need to account for the two columns at the
## beginning and end of the table that are not 
## measurements
train_test_reduced <- train_test[,c(TRUE, t(features$include), TRUE)]

## ==========================
# Creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject.
# install.packages("reshape2")
library(reshape2)

dfMelt <- melt(train_test_reduced, id=names(train_test_reduced)[c(1,75)]
               , measure.vars = names(train_test_reduced)[2:74])
names(dfMelt)
#[1] "subjectNum"   "activityName" "variable"     "value"   

## Take the mean for each variable type, grouping by subject number
## and activity name
library(plyr)
tidy <- ddply(dfMelt, .(subjectNum, activityName, variable)
              , summarise
              , calcMean = mean(value))

## Output this data
write.table(tidy, file = "tidyData.txt"
            , row.names = FALSE, col.names = TRUE
            , quote = FALSE
            , sep = ",")
