##Coursera Getting and Cleaning - Course Project

Tamas Ruscsak
21.06.2015

## Study design
Raw data have been collected with a group of 30 volunteers. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist.
A full description is available here how the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

##Introduction
* `run_analysis.R` performs the steps written in the course project
* Similar data were binded with `cbind`,`rbind` or with the `merge` function
* `colnames`,`names` Name settings
* Those columns were kept where the mean or std functions were performed,name corrections were performed
* `grep` , `gsub` pattern matching and string replacement
* Data frame convertions were performed because of the merge function's requirement -> subset delete
* `Merge` There are 6 different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
and these activities were identified by a unique key, so it had to be matched together
* `melt`and `dcast` creates a second Independent tidy data set with the average of each variable for each activity and each subject
* dimension check, `dim` 
* Independent tidy data set was uploaded in the repository directory `Final_result.txt file` with the help of the `write.table` function

My dataset is an independent tidy data set
* Each variable is in one column
* Each different observation of that variable in a different row

Dataset has descriptive names


##Variables
* `Training_subject`,`Training_X`,`Training_Y`,`Test_subject`,`Test_X`,`Test_Y`,`Activity_labels` contain the data from the downloaded files
* `Training`,`Test`,`Dataset` are the binded datasets for further work
* `Activity_Subject` contains the Activity and Subject rows
* `meanstd` contains the functions what we need to keep for further analysis(mean and standard deviation for each measurement)
* `Dataset2` binded dataset with the Activity and Subject rows


