## SCRIPT: check_run.R
## calls and runs the run_analysis script, then looks at a few test cases
## to see if everything looks ok

## ------ Set working directory -----------------------------
## Set the working directory appropriately for the system
# setwd("D://Google Drive//ubuntu-share//coursera-getData//getData_project")
setwd("~/Desktop/ubuntu-share/coursera-getData/getData_project")

## ------- Run the analysis script --------------------------
source("run_analysis.R")

## ------- Run some checks ---------------------------
## Assumes that the R session still has all the data from the analysis loaded

## 30 subjects, with 6 activity types. If everyone has done every activity,
## then all 180 subject-activity combinations should have 73 measurements
numMeasPerSubj <- table(tidy$subjectNum, tidy$activityName)
test73 <- (73 == numMeasPerSubj)
sum(test73)
# 180

## ---------- check using subject 1, variable = tBoddAcc-mean()-X --------
sub1_std <- subset(dfMelt, ((subjectNum == 1) 
                            & (variable =="tBodyAcc-mean()-X")))
summary(sub1_std)
# subjectNum             activityName              variable       value        
# Min.   :1    LAYING            :50    tBodyAcc-mean()-X:347   Min.   :-0.3612  
# 1st Qu.:1    SITTING           :47    tBodyAcc-mean()-Y:  0   1st Qu.: 0.2552  
# Median :1    STANDING          :53    tBodyAcc-mean()-Z:  0   Median : 0.2775  
# Mean   :1    WALKING           :95    tBodyAcc-std()-X :  0   Mean   : 0.2657  
# 3rd Qu.:1    WALKING_DOWNSTAIRS:49    tBodyAcc-std()-Y :  0   3rd Qu.: 0.2889  
# Max.   :1    WALKING_UPSTAIRS  :53    tBodyAcc-std()-Z :  0   Max.   : 0.4699  
#                                       (Other)          :  0     
tidy[1,]
# subjectNum activityName          variable  calcMean
# 1          1       LAYING tBodyAcc-mean()-X 0.2215982

mean((subset(sub1_std, activityName == "LAYING", value))$value, na.rm=TRUE)
# [1] 0.2215982

## ------ check using whatever is on row 2000 --------
tidy[2000,]
#      subjectNum activityName              variable   calcMean
# 2000          5      WALKING tBodyGyroJerk-std()-Y -0.5714381

sub5_line2000 <- subset(dfMelt, ((subjectNum == 5) 
                              & (variable =="tBodyGyroJerk-std()-Y")
                              & (activityName == "WALKING")), )
summary(sub5_line2000)
# subjectNum             activityName                  variable      value        
# Min.   :5    LAYING            : 0    tBodyGyroJerk-std()-Y:56   Min.   :-0.7357  
# 1st Qu.:5    SITTING           : 0    tBodyAcc-mean()-X    : 0   1st Qu.:-0.6259  
# Median :5    STANDING          : 0    tBodyAcc-mean()-Y    : 0   Median :-0.5636  
# Mean   :5    WALKING           :56    tBodyAcc-mean()-Z    : 0   Mean   :-0.5714  
# 3rd Qu.:5    WALKING_DOWNSTAIRS: 0    tBodyAcc-std()-X     : 0   3rd Qu.:-0.5077  
# Max.   :5    WALKING_UPSTAIRS  : 0    tBodyAcc-std()-Y     : 0   Max.   :-0.4314  
#                                       (Other)              : 0                    
