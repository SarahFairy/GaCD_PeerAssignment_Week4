## Set directories
# Set working directory
# setwd("/YOURPATH/UCI HAR Dataset")
wd <- getwd()

# Get file paths for test and train folders that contain required data
path_test <- file.path(wd, "test")
path_train <- file.path(wd, "train")

## Functions
# function that uses the activity_labels.txt and overwrites the label to the activity name
activity <- read.table(file.path(wd, "activity_labels.txt"), header = FALSE)
label_activity <- function(x) {activity[x,2]}
# function that replaces space and dash by underscore
replace_space <- function(x) str_replace_all(x, c(" "="_", "-"="_"))

### Import 
# import features.txt which contains column names
col_names <- read.delim(file.path(wd, "features.txt"), header = FALSE)
col_names <- lapply(col_names[,"V1"], replace_space)
# convert list to a character vector
col_names_str <- unlist(col_names)

## Import of test data
# import activity labels of tests
test_label <- read.delim(file.path(path_test, "y_test.txt"), header = FALSE)
# replace the number of activity by the activity name
test_label <- lapply(test_label[,"V1"], label_activity)
# convert the list to a dataframe and re-name column
test_label <- do.call(rbind.data.frame, test_label)
names(test_label) <- "Activity"

# import subjects of tests and re-name column
test_subj <- read.delim(file.path(path_test, "subject_test.txt"), header = FALSE)
names(test_subj) <- "Subject"

# import results from tests
test <- read.table(file.path(path_test, "X_test.txt"), header = FALSE)
# re-name the columns of test data set by using string created from features file
names(test) <- col_names_str

# merge the activity and subjects to the left of the results table
test <- cbind(test_label, test)
test <- cbind(test_subj, test)


## Import of training data
# import activity labels of training
train_label <- read.delim(file.path(path_train, "y_train.txt"), header = FALSE)
# replace the number of activity by the activity name
train_label <- lapply(train_label[,"V1"], label_activity)
# convert the list to a dataframe and re-name column
train_label <- do.call(rbind.data.frame, train_label)
names(train_label) <- "Activity"

# import subjects of training and re-name column
train_subj <- read.delim(file.path(path_train, "subject_train.txt"), header = FALSE)
names(train_subj) <- "Subject"

# import results from training 
train <- read.table(file.path(path_train, "X_train.txt"), header = FALSE)
# re-name the columns of train data set by using string created from features file
names(train) <- col_names_str

# merge the activity and subjects on the left of the results table
train <- cbind(train_label, train)
train <- cbind(train_subj, train)

# merge test and train together
res <- rbind(test, train)

# clean up environment
rm(test, train, test_label, train_label, test_subj, train_subj)

# only filter for columns "Subject" and "Activity" and those that contain "mean()" or "std()"
# no filtering on columns that contain "mean" or "std" in the middle of the name
res <- select(res, contains("Subject") | contains("Activity") | contains("mean()") | contains("std()"))

# group the result by subject and activity and then take mean of every column by group
res_summary <- res %>%
  group_by(Subject,Activity) %>%
  summarise_all(mean)

# get rid off the numbers in front of column names
final_col <- names(res_summary)
final_col <- sub("[0-9]+_", "", final_col)
names(res_summary) <- final_col

# write summary dataframe to txt file
write.table(res_summary, file.path(wd, "summary_subj_activity.txt"), col.names = TRUE, row.names = FALSE)

# import of written txt file
# df_result <- read.table(file.path(wd, "summary_subj_activity.txt"), header = TRUE, check.names = FALSE)



