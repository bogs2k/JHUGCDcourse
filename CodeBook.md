Getting and Cleaning Data Course Project Codebook
========================================


## Study design
The original Human Activity Recognition database was built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. The complete original data is here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 




## Variables
The original set consists of 561 features, as described [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)

The features were normalized and bounded within [-1,1]

From the original set of 561 variables I kept only the ones that are mean and standard deviation of the raw measurements of the sensors which represent raw signals from the accelerometer and the gyroscope. The tidy set kept averages of these features aggregated for each person and each activity. The names were changed to a more user-friendly format, removing any paranthesis and dashes, and using camelCase to enhance readability. There are 40 features for 180 observations.



## CodeBook

* person: 1..30
* activity: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying
* Body Acceleration
 * timeBodyAccelerationMeanX
 * timeBodyAccelerationMeanY
 * timeBodyAccelerationMeanZ
 * timeBodyAccelerationStandardDeviationX
 * timeBodyAccelerationStandardDeviationY
 * timeBodyAccelerationStandardDeviationZ
 * timeBodyAccelerationJerkMeanX
 * timeBodyAccelerationJerkMeanY
 * timeBodyAccelerationJerkMeanZ
 * timeBodyAccelerationJerkStandardDeviationX
 * timeBodyAccelerationJerkStandardDeviationY
 * timeBodyAccelerationJerkStandardDeviationZ
 * timeBodyAccelerationMagnitudeMean
 * timeBodyAccelerationMagnitudeStandardDeviation
 * timeBodyAccelerationJerkMagnitudeMean
 * timeBodyAccelerationJerkMagnitudeStandardDeviation
* Gravity Acceleration
 * timeGravityAccelerationMeanX
 * timeGravityAccelerationMeanY
 * timeGravityAccelerationMeanZ
 * timeGravityAccelerationStandardDeviationX
 * timeGravityAccelerationStandardDeviationY
 * timeGravityAccelerationStandardDeviationZ
 * timeGravityAccelerationMagnitudeMean
 * timeGravityAccelerationMagnitudeStandardDeviation
* Body Gyroscope
 * timeBodyGyroscopeMeanX
 * timeBodyGyroscopeMeanY
 * timeBodyGyroscopeMeanZ
 * timeBodyGyroscopeStandardDeviationX
 * timeBodyGyroscopeStandardDeviationY
 * timeBodyGyroscopeStandardDeviationZ
 * timeBodyGyroscopeJerkMeanX
 * timeBodyGyroscopeJerkMeanY
 * timeBodyGyroscopeJerkMeanZ
 * timeBodyGyroscopeJerkStandardDeviationX
 * timeBodyGyroscopeJerkStandardDeviationY
 * timeBodyGyroscopeJerkStandardDeviationZ
 * timeBodyGyroscopeMagnitudeMean
 * timeBodyGyroscopeMagnitudeStandardDeviation
 * timeBodyGyroscopeJerkMagnitudeMean
 * timeBodyGyroscopeJerkMagnitudeStandardDeviation



