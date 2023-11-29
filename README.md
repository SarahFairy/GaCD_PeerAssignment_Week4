==================================================================

The script "run_analysis.R" assumes that the experiment data is downloaded to your computer. To make this script work, download the data and unzip it. Set your working directory to the parent folder of the downloaded data: setwd("/YOURPATH/UCI HAR Dataset"). Do not move any of the folders or files within "UCI HAR Dataset". Now, the code can be executed.

The code sets separate variables for the working directory "wd" and for the folders where test and train data is saved ("path_test" and "path_train", respectively).

It contains two functions:
1. label_activity: This function converts the activity number to the activity name by using "activity_labels.txt".
2. replace_space: This function replaces spaces and dashes in strings by underscores.

After introducing the functions, the "features.txt" file is imported. This file contains the column names. It is imported as a data frame, then the replace_space function is applied and the list is converted to a character vector "col_names_str".

The code does the following for both test and train data:
1. Read the activity labels from "y_test/train.txt" and convert the activity number to the actual activity name. It then converts the list to a data frame and re-names the column to "Activity".
2. Read the subjects from "subject_test/train.txt" and re-name the column to "Subject".
3. Read the results from "X_test/train.txt" and changes the columns V1, V2, ... to the above created character vector "col_names_str".
4. First, the activity names are added to the left of the results dataset and after that, the subjects are added to the left as well.

Once the above steps have been executed for both test and train data, both data frames are merged to one data frame "res". After that, the environment is cleaned up by removing large variables that are not required anymore.

The dataset "res" is then filtered on the columns "Subject", "Activity" and all columns that contain either "mean()" or "std()". It is explicitly filtering for these names, i.e. column names with "mean" in the middle of their names are filtered out. If necessary, this can be changed by omitting "()" in the "contains" statements.

To create the tidy dataset "res_summary", the data frame is grouped by "Subject" and "Activity" and the mean()-function is applied to all columns in the data frame. Now, this tidy dataset contains for each Subject-Activity combination the mean of all measurements that are showing the mean or standard deviation.

After tidying up the column names, the final dataset is written to a txt file in the working directory "wd" and it can be re-imported by: 
df_result <- read.table(file.path(wd, "summary_subj_activity.txt"), header = TRUE, check.names = FALSE)



The dataset includes the following files:
=========================================

- 'README.md'

- 'CodeBook.md': Contains information about the variables used in the tidy dataset

- 'run_analysis.R': R code to produce the tidy dataset

- 'summary_subj_activity.txt': Tidy dataset



