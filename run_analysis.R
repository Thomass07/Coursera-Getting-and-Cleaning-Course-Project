library(reshape2)

#------------------TASK 1-----------------------------
Training_subject=read.table("./train/subject_train.txt")
Training_X=read.table("./train/X_train.txt")
Training_Y=read.table("./train/y_train.txt") #which activities were performed

Activity_labels=read.table("activity_labels.txt")
	colnames(Activity_labels)<-c("ActivityId","Activity") #Column names to Activity Labels
 
		Training <- cbind(cbind(Training_X,Training_Y),Training_subject) #Create the training dataset

Test_subject=read.table("./test/subject_test.txt")
Test_X=read.table("./test/x_test.txt")
Test_Y=read.table("./test/y_test.txt") #which activities were performed

		Test <- cbind(cbind(Test_X,Test_Y),Test_subject) #Create the test dataset

Dataset <- rbind(Training, Test)  #Create the Dataset

#------------------TASK 3 and 4-----------------------------
features <- read.table("features.txt",stringsAsFactors=FALSE)[[2]]
	colnames(Dataset) <- features
	colnames(Dataset)[562:563] <- c("ActivityId","Subject")

Activity_Subject<-Dataset[562:563] #Activity and Subject Rows to keep

#------------------TASK 2-----------------------------
meanstd <- grep("-(mean|std)\\(\\)", features)
Dataset <- Dataset[, meanstd]
Dataset2 <- cbind(Dataset,Activity_Subject)

	names(Dataset2) <- gsub("-","",names(Dataset2))
	names(Dataset2) <- gsub("\\(\\)","",names(Dataset2))

#----------------------------------------------
Dataset2 <- data.frame(Dataset2) #Convert tables to dataframes
Activity_labels <- data.frame(Activity_labels) 
Dataset2 <- merge(Dataset2,Activity_labels,by.x = "ActivityId", by.y ="ActivityId") #Merge
Dataset2 <- subset(Dataset2, select= -ActivityId)
			
#------------------TASK 5------------------------------
Dataset2<- melt(Dataset2, id=c("Subject", "Activity"))
Dataset2<- dcast(Dataset2, Subject+Activity ~ variable, mean)
dim(Dataset2) #180*68

write.table(Dataset2, "Final_result.txt", row.name=FALSE)
