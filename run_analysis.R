#used dplyr package
library(dplyr)

#read UCI HAR Dataset/activity_labels.txt with a header and separating activity and number representative
al<-read.csv("UCI HAR Dataset/activity_labels.txt",sep ="",header = FALSE)
#read UCI HAR Dataset/features.txt with a header and separating activity and number representative
f<-read.csv("UCI HAR Dataset/features.txt",sep ="",header = FALSE)

#read UCI HAR Dataset/train/X_train.txt with a header and separating activity and number representative
#training set (acronym: trset)
trset<-read.csv("UCI HAR Dataset/train/X_train.txt",sep ="",header = FALSE)
#read UCI HAR Dataset/train/X_train.txt with a header and separating activity and number representative
#test set (acronym: teset)
teset<-read.csv("UCI HAR Dataset/test/X_test.txt",sep ="",header = FALSE)

#read and add subject and activity columns to trset as well as representative headers
subjecttrain<-read.csv("UCI HAR Dataset/train/subject_train.txt",sep ="",header = FALSE)
activitytrain<-read.csv("UCI HAR Dataset/train/y_train.txt",sep ="",header = FALSE)
colnames(subjecttrain)<-"Subject"
colnames(activitytrain)<-"Activity"
colnames(trset)<-f$V2
#subject and activity bound training set (acronym: satrset) 
satrset<-cbind(trset,subjecttrain,activitytrain)

#read and add subject and activity columns to teset as well as representative headers
subjecttest<-read.csv("UCI HAR Dataset/test/subject_test.txt",sep ="",header = FALSE)
activitytest<-read.csv("UCI HAR Dataset/test/y_test.txt",sep ="",header = FALSE)
colnames(subjecttest)<-"Subject"
colnames(activitytest)<-"Activity"
colnames(teset)<-f$V2
#subject and activity bound test set (acronym: sateset) 
sateset<-cbind(teset,subjecttest,activitytest)



#extract only mean or std columns, write sateset and satrset to dplyr dataframes, and merge
dfsatrset<-tbl_df(satrset[,grep("mean|std|Subject|Activity",colnames(satrset))])
dfsateset<-tbl_df(sateset[,grep("mean|std|Subject|Activity",colnames(sateset))])
#merged training and test sets (acronym: mtrtesets)
mtrtesets<-rbind(dfsatrset,dfsateset)
#replacing the activity numbers with names from activity list
mtrtesets$Activity <- al$V2[match(mtrtesets$Activity, al$V1)]
#reorder so subject and activity are first two columns
mtrtesets<-mtrtesets[,c(80,81,1:79)]

#create a table with the average for each activity for each subject
Final<-aggregate(x = mtrtesets[,3:81], by = list(Subject, Activity), FUN = "mean")
colnames(Final)[1:2] <- c("Subject", "Activity")

#export final table as a text file
write.table(Final,"FinalData.txt",row.name=FALSE)
