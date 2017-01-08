The variables in the cleaned data files are self described, and are taken
directly from the downloaded file headings by matching the column headers to
the values found in the features.txt that is in the UCI HAR Dataset folder.  
They are either the means andstandard deviations ("meanandstdFinal.csv"), or 
means ("meanonlyFinal.csv") ofthe collected data from the 30 volunteers, with 
x, y and z denoting thedirection of the acceleration/force for the header 
described motion.


The "Subject" and "Activity" columns denote the individual that the row data
is associated with, as well as the activity performed while that data was
collected.  The activities are taken directly from the activity_list.csv file
that can be found in the UCI HAR Dataset folder.

After matching and binding the two data sets, the columns were averaged using
aggregate by Subject and Activity.  This gives an average of all the columns as
a function of both Subject and Activity, allowing a tidy way to view the data 
for each Activity for each Subject.

As per the attached information files found in the original zip file:

The features selected for this database come from the accelerometer and 
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals
(prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they
were filtered using a median filter and a 3rd order low pass Butterworth filter
with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration 
signal was then separated into body and gravity acceleration signals 
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter 
with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in 
time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the 
magnitude of these three-dimensional signals were calculated using the Euclidean
norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, 
tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain 
signals). 

These signals were used to estimate variables of the feature vector for each 
pattern:  

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

The set of variables that are collected in these tidy data sets are: 

mean(): Mean value
std(): Standard deviation >"meanandstdFinal.csv"

or simply

mean(): Mean value >"meanonlyFinal.csv"

Additional vectors obtained by averaging the signals in a signal window sample.
These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean