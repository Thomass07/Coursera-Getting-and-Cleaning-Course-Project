
#------------------TASK 1-----------------------------
Training_subject=read.table("./train/subject_train.txt")
Training_X=read.table("./train/X_train.txt")
Training_Y=read.table("./train/y_train.txt") #which activities were performed

Activity_labels=read.table("activity_labels.txt")
 colnames(Activity_labels)<-c("ActivityId","Activity")
 
		Training <- cbind(cbind(Training_X,Training_Y),Training_subject)

Test_subject=read.table("./test/subject_test.txt")
Test_X=read.table("./test/x_test.txt")
Test_Y=read.table("./test/y_test.txt") #which activities were performed

		Test <- cbind(cbind(Test_X,Test_Y),Test_subject)

Dataset <- rbind(Training, Test)
#------------------TASK 3 and 4-----------------------------
features <- read.table("features.txt",stringsAsFactors=FALSE)[[2]]

#features = gsub('[-()]', '', features)
colnames(Dataset) <- features

colnames(Dataset)[562:563] <- c("ActivityId","Subject")

Activity_Subject<-Dataset[562:563]

#------------------TASK 2-----------------------------
meanstd <- grep("-(mean|std)\\(\\)", features)
Dataset <- Dataset[, meanstd]
Dataset2 <- cbind(Dataset,Activity_Subject)

#----------------------------------------------
Dataset2 <- data.frame(Dataset2)
Activity_labels <- data.frame(Activity_labels)
Dataset2 <- merge(Dataset2,Activity_labels,by.x = "ActivityId", by.y ="ActivityId")
Dataset2<- subset(Dataset2, select= -ActivityId)

#------------------TASK 5------------------------------
#I did not have time to do it
...
...
...

write.table(Dataset2, "results.txt", row.name=FALSE)