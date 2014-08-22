train_x<-read.table("./data/UCI_HAR_Dataset/train/X_train.txt")
test_x<-read.table("./data/UCI_HAR_Dataset/test/X_test.txt")
train_y<-read.table("./data/UCI_HAR_Dataset/train/y_train.txt")
test_y<-read.table("./data/UCI_HAR_Dataset/test/y_test.txt")
Subject_train<-read.table("./data/UCI_HAR_Dataset/train/subject_train.txt")
Subject_test<-read.table("./data/UCI_HAR_Dataset/test/subject_test.txt")
activity_lables<-read.table("./data/UCI_HAR_Dataset/activity_labels.txt")
features<-read.table("./data/UCI_HAR_Dataset/features.txt")

## MERGE X DATA 

# Merge training and test data for X into a merged data frame for X
merged_data_x <- rbind(train_x,test_x)

# Rename column names based on the features data set
colnames(merged_data_x) <- c(as.character(features[,2]))

# Determine which measurements have to do with Mean and Standard Deviation 
# based on the title of the Columns in merged_data.
mean_cols_x <- grep("mean()", colnames(merged_data_x), fixed=TRUE)
std_cols_x <- grep("std()", colnames(merged_data_x), fixed=TRUE)
mean_std_x <- merged_data_x[,c(mean_cols_x,std_cols_x)]

merged_data_y<-rbind(train_y,test_y)

all_activity<-cbind(merged_data_y,mean_std_x)

colnames(all_activity)[1] <- "Activity"

# Label the data frame with the appropriate activity names provided in the data set
activity_lables[,2]<-as.character(activity_lables[,2])

# Loop through the activities and convert the ID to the descriptive label for each
for(i in 1:length(all_activity[,1])){
  all_activity[i,1]<-activity_lables[all_activity[i,1],2]
}

Subject_all<-rbind(Subject_train,Subject_test)

all<-cbind(Subject_all,all_activity)

colnames(all)[1] <- "Subject"

Tidy <- aggregate( all[,3] ~ Subject+Activity, data = all, FUN= "mean" )

for(i in 4:ncol(all)){
  Tidy[,i] <- aggregate( all[,i] ~ Subject+Activity, data = all, FUN= "mean" )[,3]
}

colnames(Tidy)[3:ncol(Tidy)] <- colnames(mean_std_x)

write.table(Tidy, file = "FinalData.txt", row.name=FALSE)
