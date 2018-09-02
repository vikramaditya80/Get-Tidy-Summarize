## Codebook

# Variables <- Data files
- dfActLabels <- activity_labels.txt
	contains the list of activities along with their index
- dfFeatures <- features.txt
	contains the names of features recorded in the training and test data set
- dfSubTest <- subject_test.txt
	contains the subject index column for test data
- dfTest <- X_test.txt
	contains the test data recorded for all the features with feature names assigned
- dfActTest <- y_test.txt
	contains the activity index column for test data
- dfSubTrain <- subject_train.txt
	contains the subject index column for training data
- dfTrain <- X_train.txt
	contains the training data recorded for all the features with feature names assigned
- dfActTrain <- y_train.txt
	contains the activity index column for training data

# Calculated variables
- dfTrainMrg
	calculated by merging the training data frame and the activity labels data frame
- dfTestMrg
	calculated by merging the test data frame and the activity labels data frame
- dfHAR
	calculated by combining the training and test data; contains only the mean and std.deviation readings
- dfHARGrpd
	contains the average of mean and std. deviation features grouped by subject and activity
