# submitted by: Tedros Gebregergs

- [hahustat]{https://github.com/hahustat/Getting-and-Cleaning-Data}

## It uses Human Activity Recognition Using Smartphones Dataset Version 1.0

- the data for the project [data]{[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI HAR Dataset.zip)}

- A full description is available at the site where the data was obtained:[description]{http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones}

  

# Data Set description

- **activities** :  a data frame of 6 obs. of 2 variables.
  - activity_Id  : from 1-6.
  - activity_Label: 1=WALKING, 2=WALKING UPSTAIRS, 3=WALKING DOWNSTAIRS, 4= SITTING, 5=STANDING, 6=LAYING
- **merged_activity** : 'data.frame':  10299 obs. of 2 variables:
- **total_Merged_Data** : 'data.frame':  10299 obs. of 564 variables
- **data_mean_std** : a merged data set on measurements of mean and standard deviation, and combined the three columns of subject_id, activity_id and activity_Label. 10,299 x 69
- **features** : a data frame of 561 obs. of 2 variables
  -  feature_Id  : 1-561
  - feature_Label : 

- **Merged_data_with_Activity** :  a data frame of 10299 obs. of 69 variables: from **data_mean_std** and **merged_activity**
- **Merged_with_Mean_Std** : a merged data frame of 10299 obs. of 66 variables: without subject_id, activity_id and activity_Label.
- **tidy_mean_std** : data set of summary using groups of subject_id, activity_id from **Merged_with_Mean_Std**  , and is  35 x 69.
- **X_train** : 'data.frame':  7352 obs. of 561 variables:
- **Y_train** : 'data.frame':  7352 obs. of 1 variable:
- **Y_test** : 'data.frame':  2947 obs. of 1 variable:
- **subj_test** : 'data.frame':  2947 obs. of 1 variable:
- **subj_train** : 'data.frame':  7352 obs. of 1 variable
- **subject** : 'data.frame':  10299 obs. of 1 variable- a merged.