# **Getting and Cleaning Data Course Project**



## It uses Human Activity Recognition Using Smartphones Dataset Version 1.0

- the data for the project [[data]()][https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]()
- A full description is available at the site where the data was obtained:[[description]()][http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]()

- First download the data set from the link and then set a working directory to **UCI HAR Dataset**
- needs **dplyr** , **data.table** , and **tidyverse**  packages
- uses **read.table()** to import the data sets.

### To Uses descriptive activity names to name the activities in the data set

- uses names() to describe the activity names of variables *feature*, *activities*

  

  ### To   **Merges the training and the test sets** to create one data set.

  - uses **rbind()** to merge Y_test and X_test, and store in **merged_activity **
  - it uses **merge()** and **cbind()** to create **total_Merged_Data**.

  ### To Extracts only the measurements on the mean and standard deviation for each measurement

  - uses grep("mean\\(\\)|std\\(\\)", features$feature_Label) to extract variables with **mean** and **std** on the column names
  - gsub("\\(|\\)", "", names(Merged_with_Mean_Std)) removes **()** from variable names

  ### To create independent tidy data set from the merged data set with mean and std variables

  - uses **tbl_df** function from dplyr package

  - uses **group_by** function to group the data set by **activity_Label**, **subject_Id**

  - Then, for each separted data set it summarizes all variables using **mean**

  - Finally, exports and save a data set with a name **tidy_mean_std.txt**


    

  

  

  

  







