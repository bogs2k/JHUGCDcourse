Getting and Cleaning Data Course Project
========================================


## Introduction

This assignment uses data from
the http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Its purpose is to produce a tidy data subset from the original data.

* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">Human Activity Recognition Using Smartphones Data Set </a> [62Mb]

* <b>Abstract</b>: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

* <b>Description</b>: From the original data set, only measurements on the mean and standard deviation were kept. A new data set is created containing means of those measurements.

* <b>Features</b>: Original feature names were replaced with a more user-friendly version.

  
  

## Loading the data

The original folder name "UCI HAR Dataset" is supposed to be present in the working directory. If not, then the archivefile is looked for, and if found it is unzipped. If not found, it is downloaded from the original location and unzipped.
  
  

## Feature selection

The original features for the dataset consist of accelerometer and gyroscope 3-axial raw signals, together with time derivatives and Fast Fourier Transform applied to them; a total of 561 variables. From this set I kept only the ones that are mean and standard deviation of the raw measurements of the sensors, not of the transformations applied afterwards. The criteria to include variables is: to be a time signal (begins with "t") and to be either a mean (contains "mean()") or a standard deviation (contains "std()")


## Data aggregation

The data for the remaining set of variables was merged together (from the original training set and test set) and averages were computed with respect to each activity and subject.


## Varables renaming

To produce a more user-friendly name, the names of the variables was transformed to contain "time" at the beginning and no paranthesis or dashes in their names. Also the activities were ereplaced with their literal name and the persons were individualized. See [CodeBook.md](CodeBook.md) for complete reference.

*Please note that I used camelCase to enhance readability due to the length of the variables.*


## Final dataset

The final dataset contains 180 sets of 40 variables (30 persons, each with 6 activities).
  
    
## Script 
    
The script run_analysis.R reads the original data (or downloads it, as described above), merges the training and test data, removes the unneeded features, renames the variable names, makes the average and generates the tidy data set as described in the [CodeBook.md](CodeBook.md)
  
  
Here are the steps:
  
  
* checks for folder existence
* checks for zip file
* downloads if necessary
* unzips if needed
* reads the list of features
* reads the training data
* adds proper column labels 
* reads subject and activities corresponding to train data
* adds subject and activities to data set
* reads the test data
* adds proper column labels 
* reads subject and activities corresponding to test data
* adds subject and activities to train set
* merges the 2 sets
* keeps only the desired features from the whole group
* keeps only the data for the features selected
* discards the large unneeded data
* changes feature names to be more friendly
* aggregates the data/calculates the means of the variables
* saves the tidy dataset


