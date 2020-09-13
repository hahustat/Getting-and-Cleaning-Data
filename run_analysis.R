  # Assignment of Getting and Cleaning Data of Week 4 
  # Name Tedros Gebregergs
  
     setwd("C:\\Users\\mu\\Desktop\\Tedros_2020_R_Ass\\UCI HAR Dataset")
     library(tidyverse)
   library(dplyr)
   library(data.table)
  run_analysis <- function(){   
  
     
     subj_train <- read.table("train\\subject_train.txt")     #vector of the subjects(1-30))
        Y_train <- read.table("train\\Y_train.txt")     #vector of Activities(1-6)
        X_train <- read.table("train\\X_train.txt")  #data frame of 561 features
      subj_test <-read.table("test\\subject_test.txt")   #vector of the subjects(1-30))
         Y_test <-read.table("test\\Y_test.txt")      #vector of Activities(1-6)
        X_test <-read.table("test\\X_test.txt")  # Results with 561 Columns
     features <- read.table("features.txt")  # data frame of 561*2
         #Q3:3.	Uses descriptive activity names to name the activities in the data set
  names(features)=c("feature_Id", "feature_Label")    #labeling names
  activities <- read.table("activity_labels.txt") # data farme of 6*2
  names(activities)<-c("activity_Id", "activity_Label")
 
  activities$activity_Label<-as.character(activities$activity_Label)
  activities$activity_Label <- gsub("_", " ", activities$activity_Label)  #//Space


       subject <- rbind(subj_test, subj_train)  #  Merged vector of subjects(1-30)==>10299*1
names(subject) <- "subject_Id"  # named after merged
merged_dataset <- rbind(X_test, X_train)   #data frame of 10299*561
#Q4.	Appropriately labels the data set with descriptive variable names
   colnames(merged_dataset)<-features$feature_Label  # assigning the 561 features measurement to  variable colomn
      #Q1 To Merge the date set
   merged_activity <- rbind(Y_test, Y_train)  # 102999*1==>1-6
  names(merged_activity) <- "activity_Id"
  merged_activity<-merge(merged_activity,activities,by.x="activity_Id") #10299*2
  
  total_Merged_Data<-cbind(subject,merged_activity,merged_dataset)  # 10299*564(subject_id,activity_id,activity_label)
 
 #Question2. Extracts only the measurements on the mean and standard deviation for each measurement.  

    #extract mean and std from features
           extract_Mean_Std <- grep("mean\\(\\)|std\\(\\)", features$feature_Label) #==> indexces, value=T
              Merged_Data_1 <-total_Merged_Data[,-c(1,2,3)]
       Merged_with_Mean_Std <- Merged_Data_1[, extract_Mean_Std]   # columns with mean and std , and a total of 66 variables
names(Merged_with_Mean_Std) <- gsub("\\(|\\)", "", names(Merged_with_Mean_Std)) #  To remove ()

   #Q3.	Uses descriptive activity names to name the activities in the data set
   #     already in the above the activity names are described but here again combined to step2.
   Merged_data_with_Activity<-cbind(subject,merged_activity,Merged_with_Mean_Std)  #'data.frame':   10299 obs. of  69 variables:
   write.table( Merged_data_with_Activity," Merged_data.txt",row.names=FALSE)
      #Q   5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      
               data_mean_std<-tbl_df(Merged_data_with_Activity)
                  tidy_mean_std<-data_mean_std %>%
                        group_by(activity_Label,subject_Id) %>%
                        summarize_each(funs(mean))
                        write.table(tidy_mean_std,"tidy_mean_std.txt") 
                        
                      #   # total_Merged_Data<-tbl_df(total_Merged_Data)
#                          #tidy_total<-total_Merged_Data %>%
#                          #           group_by(activity_Label,subject_Id) %>%
#                          #        summarize_each(funs(mean))
#                         # write.table(tidy_total,"tidy_total.txt") 
                        

}

run_analysis()

