# Codebook for RunAnalysis.txt and AllData.txt
## Getting and Cleaning Data Assignment 1 (March 2015)
### by Butch Landingin (butchland@gmail.com)

#### allData.txt

__allData.txt__ contains all data from the UCI HAR data set combined into one data frame from both the test and training data sets.

The first two columns are:

* __subject__ - id of the subject conducting the activity. The data for this column comes from subject\_train.txt and subject\_test.txt files of the train and test folders  of the UCI HAR data set respectively.

* __activity__ - type of activity (based on the activity\_labels.txt from the UCI HAR data set). The data for this column comes from the y\_train.txt and y_test.txt files of the train and test folders of the UCI HAR data set respectively.

* The next columns contain the acceleration and gyroscopic measurements from the study and are named based on the features.txt file of the UCI HAR Data set except their names have been renamed: whenever the UCI HAR data set column name has a "()-" in the original column have been replaced by  "\_"(underscore) and all other "-" (dashes) have also been replaced by "\_"(underscore). For further information about the column names, please refer to features_info.txt file in the UCI HAR data set.

  For example, the original column name "__tBodyAcc-mean()-X__" has been replaced in the runAnalysis.txt and allData.txt datasets by the column name "**tBodyAcc\_mean\_X**". This was done primarily because R does not seem to accept "()" and "-" as valid parts of column names(and replaces them with "."(periods)).
  
  These columns constitutes the first 561 measurements in the allData.txt file. The data for these columns comes from the X\_train.txt and X\_test.txt of the train and test folders  of the UCI HAR data set respectively.

* The next set of columns in the allData.txt are the inertial data measurements and are formed as follows:

     The column name is composed of the acceleration type ("total\_acc","body\_gyro" or "body\_acc") plus the inertial axis ("x","y" or "z") and the index number of the vector ranging from 1 to 128, each part separated by an "_" (underscore).

     For example the measurement for total acceleration ("total\_acc") for the x axis ("x") for the first index is named "total\_acc\_x\_1".
     
     These inertial measurements constitute the next 1152 columns of the allData.txt data set.
 

All in all, there are 1715 columns (2 + 561 + 1152) in the allData.txt data set

#### runAnalysis.txt

__runAnalysis.txt__ contains a summarized subset of the allData.txt data set. It contains only the measurements of the mean and  standard deviations averaged per subject and activity.

* The first two columns are subject and activity, same as in allData.txt

* The next 48 columns are the mean and standard deviation measurements (columns with "mean" and "std" in their column names) averaged for each subject and activity. 

There are a total of 50 columns for the runAnalysis.txt data set.


