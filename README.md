# getdata_assign1
## Getting and Cleaning Data Assignment 1 (March 2015)
### by Butch Landingin (butchland@gmail.com)

This is my github repo for the course assignment for the [**Getting and Cleaning Data**](https://www.coursera.org/course/getdata) course on Coursera (March 2015 edition)

It contains the R file [**run_analysis.R**](https://raw.githubusercontent.com/butchland/getdata_assign1/master/run_analysis.R) program which should be run on the same directory as the Samsung data files from [UCI HAR Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The Samsung database is from the study on Smartphones study [1].

Running the run_analysis.R program generates two(2) data files, **allData.txt** and **runAnalysis.txt**.

The **allData.txt** file contains the combined data from the Samsung training and test data sets combined so that all the different measurements are in one data frame.

The **runAnalysis.txt** summary data file contains the data for the mean and standard deviation measurements from the allData.txt averaged for each activity and subject.

The file [**codebook.md**](https://github.com/butchland/getdata_assign1/blob/master/codebook.md) in this repo contains the column descriptions for each column in both the allData.txt and runAnalysis.txt data sets (however, the runAnalysis.txt data set contains only a subset of all the columns from the allData.txt data set -- it contains only those columns for the mean and standard deviations averaged across each subject and activity)

####References:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 


