library(data.table)
library(plyr)
# some constants to make it
# easier to manipulate filenames

DATA_SET_PREFIXES <- c("test","train")
DATA_SET_TYPES <- c("y","X","subject")
INERTIAL_FOLDER <- "/Inertial Signals/"
ACCEL_MEASURE_TYPES <- c("total_acc","body_gyro","body_acc")
INERTIAL_AXES <- c("x","y","z")
FIELD_NBRS <- 1:128

# loads main data sets - to be used for subject, y and X (for test and train data sets)
loadMainData <- function(data_set_prefix,data_set_type,sep=" ",strip.white=TRUE,...){
      fileName <- paste(data_set_prefix,"/",
                        data_set_type,"_",data_set_prefix,".txt",sep="")
      read.table(fileName,sep=sep,strip.white=strip.white,...)
      
}

# loads inertial data sets for diff accel types and axes (for test and train data sets)
loadInertialData <- function(data_set_prefix,
                             accel_measure_type,inertial_axis,sep="",strip.white=TRUE,...) {
        fileName <- paste(data_set_prefix,
                          INERTIAL_FOLDER,
                          accel_measure_type,"_",inertial_axis,"_",
                          data_set_prefix,".txt",sep="")
        read.table(fileName,sep=sep,strip.white=strip.white,...)
}

# (4.a) label descriptive variable names for columns
makeFeatureNames <- function() {
        features_data <- read.table("features.txt",sep=" ",
                                    col.names=c("index","feature"),
                                    colClasses=c("numeric","character"))
        feature_names <- sub("\\(\\)-","_",sub("-","_",features_data$feature))
        feature_names
}

# loads and merges data sets for either test or train data sets
loadDataSet <- function(data_set_prefix) {
        activity_labels <- read.table("activity_labels.txt",sep=" ",
                                      col.names=c("activity_id","activity_name"),
                                      colClasses=c("factor","factor"))
        
        feature_names <- makeFeatureNames()
        num_features <- length(feature_names)
         
        # main data set
        for(data_set_type in DATA_SET_TYPES) {
                if (data_set_type == "subject"){
                        subject <- loadMainData(data_set_prefix,data_set_type,
                                                col.names=c("subject"),
                                                colClasses=c("factor"))  
                }
                else if (data_set_type == "y") {
                        activity_data <- loadMainData(data_set_prefix,data_set_type,
                                                col.names=c("activity_id"),
                                                colClasses=c("factor"))  
                } else {
                        # data_set_type == "X"
                        Xdata <- loadMainData(data_set_prefix,data_set_type,
                                                sep="",
                                                strip.white=TRUE,
                                                col.names=feature_names,
                                                colClasses=c("numeric"))  
                }
        }

        activity_names <- join(activity_data,activity_labels)
        activity <- activity_names$activity_name
        main_results <- cbind(subject,activity,Xdata)
                # inertial data sets
        for(accel_measure_type in ACCEL_MEASURE_TYPES) {
                for(inertial_axis in INERTIAL_AXES) {
                        # (4.b) label descriptive variables for columns
                        field_names <- paste(accel_measure_type,"_",inertial_axis,"_",FIELD_NBRS,sep="")
                        inertial_data <- loadInertialData(data_set_prefix,
                                                        accel_measure_type,
                                                        inertial_axis,
                                                        col.names=field_names,
                                                        colClasses=c("numeric"))
                        main_results <- cbind(main_results,inertial_data)
                }
        }
        main_results
}

#loads data for train and test data sets
loadAllData <- function() {
        testSet <- loadDataSet(DATA_SET_PREFIXES[1])
        trainSet <- loadDataSet(DATA_SET_PREFIXES[2])        
        # --- merged dataSet --
        allDataSet <- rbind(testSet,trainSet) # (1) results of merged data in allDataSet 
}
#returns data summarized for std and mean measurements by subject and activity
run_analysis <- function(allDataSet) {
        allFields <- names(allDataSet)
        stdMeanFields <- grep("_(std|mean)_",allFields)
        
        # --- extracted subject,activity, and all std and mean measurements ---
        stdMeanDataSet = allDataSet[,c(1:2,stdMeanFields)] # (2) data set for mean and std deviation
        
        # (5) summarize data set by subject activity and get the mean for each measurement
        sumStdMeanDataSet <- ddply(stdMeanDataSet,.(subject,activity),colwise(mean))
}

alldata = loadAllData()
write.table(alldata,file="allData.txt",row.names=FALSE)
data = run_analysis(alldata)
write.table(data,file="runAnalysis.txt", row.names=FALSE)

