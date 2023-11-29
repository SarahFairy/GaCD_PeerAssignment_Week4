==================================================================

The script "run_analysis.R" produces a tidy data set saved in a txt file "summary_subj_activity.txt". The variables in this data set are as follows:

Subject: Numeric identifier of the person, takes integer values between 1 and 30

Activity: One of the 6 different activities that a subject is performing
	WALKING
	WALKING_UPSTAIRS
	WALKING_DOWNSTAIRS
	SITTING
	STANDING
	LAYING

Columns that show the mean value:
tBodyAcc_mean()_X/Y/Z
tGravityAcc_mean()_X/Y/Z
tBodyAccJerk_mean()_X/Y/Z
tBodyGyro_mean()_X/Y/Z
tBodyGyroJerk_mean()_X/Y/Z
tBodyAccMag_mean()tGravityAccMag_mean()
tBodyAccJerkMag_mean()
tBodyGyroMag_mean()tBodyGyroJerkMag_mean()
fBodyAcc_mean()_X/Y/Z
fBodyAccJerk_mean()_X/Y/Z
fBodyGyro_mean()_X/Y/Z
fBodyAccMag_mean()
fBodyBodyAccJerkMag_mean()fBodyBodyGyroMag_mean()
fBodyBodyGyroJerkMag_mean()

Columns that show the standard deviation:
tBodyAcc_std()_X/Y/Z
tGravityAcc_std()_X/Y/Z
tBodyAccJerk_std()_X/Y/Z
tBodyGyro_std()_X/Y/Z
tBodyGyroJerk_std()_X/Y/Z
tBodyAccMag_std()
tGravityAccMag_std()
tBodyAccJerkMag_std()
tBodyGyroMag_std()tBodyGyroJerkMag_std()
fBodyAcc_std()_X/Y/Z
fBodyAccJerk_std()_X/Y/Z
fBodyGyro_std()_X/Y/Z
fBodyAccMag_std()
fBodyBodyAccJerkMag_std()fBodyBodyGyroMag_std()
fBodyBodyGyroJerkMag_std()

Below information about above variables is taken from the "features_info.txt" file:

=========================================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
=========================================

==================================================================