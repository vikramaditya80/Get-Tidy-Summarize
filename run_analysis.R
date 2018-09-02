###<run_analysis.R>###
#NOTE: The script assumes that all the data files are available in the working directory

#Load dplyr package
library(dplyr)

#Read activity labels
dfActLabels<-read.csv(file = "./activity_labels.txt",header = FALSE,sep = "",col.names = c("ActID","Activity"))

#Read feature names
header<-read.csv(file = "./features.txt",header = FALSE,sep = "",col.names = c("Index","Feature"),stringsAsFactors = FALSE)

#Read training and test data and assign feature names as column names
dfTrain<-read.csv(file = "./train/X_train.txt",header = FALSE,sep = "",col.names = header$Feature)
dfTest<-read.csv(file = "./test/X_test.txt",header = FALSE,sep = "",col.names = header$Feature)


#Read subjects data and append it as a column to the respective data set
dfSubTrain<-read.csv(file = "./train/subject_train.txt",header = FALSE,sep = "",col.names = "Subject")
dfTrain$Subject<-dfSubTrain$Subject

dfSubTest<-read.csv(file = "./test/subject_test.txt",header = FALSE,sep = "",col.names = "Subject")
dfTest$Subject<-dfSubTest$Subject

#Read activity data and append it as a column to the training data set
dfActTrain<-read.csv(file = "./train/y_train.txt",header = FALSE,sep = "",col.names = "ActID")
dfTrain$ActID<-dfActTrain$ActID

dfActTest<-read.csv(file = "./test/y_test.txt",header = FALSE,sep = "",col.names = "ActID")
dfTest$ActID<-dfActTest$ActID

#Merge activity labels data with training and test data set to get activity names in a separate column
dfTrainMrg<-merge(dfActLabels,dfTrain,by.x = "ActID",by.y = "ActID",sort = FALSE,all.y = TRUE)
dfTestMrg<-merge(dfActLabels,dfTest,by.x = "ActID",by.y = "ActID",sort = FALSE,all.y = TRUE)

#Combine the training and test data into one data set
dfHAR<-rbind(dfTrainMrg,dfTestMrg)

#Extract only the mean and std. deviation columns
dfHAR<-dfHAR %>% select(Subject,Activity,contains("mean"),contains("std"))

#create another data set to store mean values calculated for each subject and each activity
dfHARGrpd<-dfHAR%>%group_by(Subject,Activity)%>%summarise_all(mean)

#write the summary data to TXT file
write.table(x = dfHARGrpd,file = "./HAR_Summary.txt",row.names = FALSE)

