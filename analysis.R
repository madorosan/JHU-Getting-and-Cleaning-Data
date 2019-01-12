
##Used to extract the training and test data includong the subject and features data for labelling

trainx = read.table(file.path(datapath, "train/X_train.txt"), header = FALSE)
trainy = read.table(file.path(datapath, "train/y_train.txt"), header = FALSE)
trainsubjects = read.table(file.path(datapath, "train/subject_train.txt"), header = FALSE)
testx = read.table(file.path(datapath, "test/X_test.txt"), header = FALSE)
testy = read.table(file.path(datapath, "test/y_test.txt"), header = FALSE)
testsubjects = read.table(file.path(datapath, "test/subject_test.txt"), header = FALSE)
names_var = read.table(file.path(datapath, "features.txt"), header = FALSE)
activitylabels = read.table(file.path(datapath, "activity_labels.txt"), header = FALSE)


#Task 4: Appropriately label the data set with descriptive variable names.

##setting the variable names of the x-columns (measurements)
colnames(trainx) = names_var[,2]
colnames(testx) = names_var[,2]

##setting the variable names of the subjects columns
colnames(trainsubjects) = "subjectID"
colnames(testsubjects) = "subjectID"

##setting the variable names of the y-columns (activity ID)
colnames(trainy) = "activityID"
colnames(testy) = "activityID"

##setting column names of the activitylabels data set
colnames(activitylabels) = c("activityID", "activityTYPE")


#Task 1: Merging test and train data using rbind and cbind

y_merge = rbind(trainy, testy)
x_merge = rbind(trainx, testx)
subj_merge = rbind(trainsubjects, testsubjects)
testANDtrain = cbind(y_merge, subj_merge, x_merge)


#Task 2: Subsetting variables relating to mean and std only using grep

labels = colnames(testANDtrain)
chosenlabels = c("activityID", "subjectID", grep("mean()", labels, value = TRUE), grep("std..", labels, value = TRUE))
meanANDstd = testANDtrain[,chosenlabels]


#Task 3: Descriptive activity names by merging tables by activity ID to get activity Type

library(dplyr)

correctlyNamed_meanANDstd = merge(meanANDstd, activitylabels, by = 'activityID', all.x = TRUE)
correctlyNamed_meanANDstd = correctlyNamed_meanANDstd[, c(82, 1:81)]
##Columns rearranged to put descriptive name at the 1st column

#Task 5: Independent data set with the average of each variable by activity and subject.

##removing column of Activity ID for ease in summarizing
correctlyNamed_meanANDstd = correctlyNamed_meanANDstd[,-2]

finalTIDY <- correctlyNamed_meanANDstd %>% group_by(activityTYPE, subjectID, add = TRUE) %>% summarize_all(mean, rm.na = TRUE)
write.table(finalTIDY, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)



