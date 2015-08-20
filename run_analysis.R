## read features lists
features<- read.table("features.txt")
## read test data
x_test<- read.table("test\\X_test.txt", col.names = features[,2])
subject_test<- read.table("test\\subject_test.txt")
y_test<- read.table("test\\y_test.txt")

## Merge all three test data files
test<-cbind(subject_test,y_test,x_test)

## read training data
x_train<- read.table("train\\X_train.txt", col.names = features[,2])
subject_train<- read.table("train\\subject_train.txt")
y_train<- read.table("train\\y_train.txt")

## Merge all three training data files
train<-cbind(subject_train,y_train,x_train)

## row bind both test and training datasets
data<-rbind(test,train)

## Apply columns names for subject and activities
names(data)[1:2] <- c("SubjectID", "ActivityID")

## Load Activity names
activities<-read.table("activity_labels.txt")

## set column names for activity data set
names(activities) <- c("ActivityID","Activity")

## add activity names for the data set 
data[2] <- merge(data[2],activities,by = "ActivityID",all=TRUE)[2]

## change the header name from ActivityID to Activity
names(data)[1:2] <- c("SubjectID", "Activity")

## melt data set by SubjectID and Activity
require(reshape2)
moltenData<-melt(data, id = c("SubjectID", "Activity"))

require(dplyr)
## filter the dataset for mean and std measurements
filteredData <- moltenData %>% 
  filter(grepl("mean",variable)|grepl("std",variable),!grepl("meanFreq",variable))

## Create tidy data by group dataset by SubjectID, Activity and measurment
tidyData<- filteredData %>% 
            group_by(SubjectID,Activity,variable) %>%
            summarise(mean(value)) %>%
            arrange(SubjectID,Activity,variable)
## set header name for value
names(tidyData)[4]<- "mean"

## export into a comma separated text file
write.table(tidyData,"TidyData.txt", sep=",", col.names=TRUE, row.names=FALSE)
