###CodeBook
This file describes the variables, the data, and any transformations or work that you performed to clean up the data

###Variables:
* features - features.txt file is loaded in this variable 
* x_test - x_text.txt file is loaded in this variable 
* subject_test - subject_test.txt file is loaded in this variable
* y_test - y_text.txt file is loaded in this variable
* test - all test data is combined in this variable
* x_train - x_train.txt file is loaded in this variable
* subject_train - subject_train.txt file is loaded in this variable
* y_train - y_train.txt file is loaded in this variable
* train - all train data is combined in this variable
* data - all training and test data is combined in this variable
* activities - all activities are loaded in this variable
* headers - all measure names are loaded in this variable
* moltenData - unpivoted data is loaded into this variable
* filteredData - data containing mean and standard deviation measurements is loaded into this variable
* TidyData - data.table containing the mean of measures by activity and subject


###Transformations:
* Joined activities and data variables on ActivityID.
* Unpivoted data by use the melt function
* filter was applied using grepl() function and dplyr package
* used dplyr package to calculate average of each variable for each activity and each subject
* data was exported using the write.table() function in TidyData.txt file in a csv format in working directory 