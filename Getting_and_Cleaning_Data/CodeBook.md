# About Script
The run_analysis.R script does the following steps as described
1. If the dataset.zip file isn't already downloaded then the file is downloaded and unzips the dataset.zip file 
2. Reads the X_test.txt , X_train.txt , Y_test.txt , Y_train.txt , subject_test.txt ,subject_train.txt ,features.txt , activity_labels.txt data
3. Then merges the (X_test,X_train) , (Y_test,Y_train) , (subject_test,subject_train) data files into 3 individual data sets
4. Extracts only the measurements on the mean and standard deviation for each measurement
5. Create a new data frame where the descriptive activity names are used to name the activities in the data frame
6. Creates the required tidydata.txt file

# Variables

1. test_x   		: X_test.txt data frame
2. test_y   		: Y_test.txt data frame
3. test_sub 		: subject_test.txt data frame
4. trian_x   		: X_train data.txt frame
5. train_y   		: Y_train data.txt frame
6. train_sub 		: subject_train.txt data frame
7. activity_labels	: activity_labels.txt data frame
8. features			: features.txt data frame
9. x , y , subject 	: merged (X_test,X_train) , (Y_test,Y_train) , (subject_test,subject_train) data frames
10. selected 		: Extracted mean and standard deviation for each measurement
11. tidy_data 		: final required tidy data set containing 180 observations