#Getting and Cleaning Data - Course Project - Code Book

The script "run_analysis.R" is responsible for getting and cleaning the data, 
according to the project instructions.


##Processing Steps

Step 1 - Merges the training and the test sets to create one data set. Data is available in folders train and test of the main folder.
* Reads the training and test data files for X, Y, and Subject.
* Merges each type of data into a single file using rbind(), creating one dataset each for X, Y, and Subject.

Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
* Reads file "features.txt" and filters only measurements on the mean and standard deviation.
* Uses the information from features to update the labels of the X dataset.

Step 3 - Uses descriptive activity names to name the activities in the data set.
* Reads file "activity_labels.txt".
* Uses the labels for each Activity code to update columns in the Y dataset.
* Changes the column name in the Y dataset to "Activity".

Step 4 - Appropriately labels the data set with descriptive variable names. 
* Changes the column name in the Subject dataset to "Subject".
* Binds all datasets together using cbind(), creating one dataset with all 66 measuments, Activity, and Subject.
* Saves tidy dataset into "tidy_dataset.txt".

Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Uses ddply() function (from plyr package) to calculate the colMeans for all measuments in the tidy dataset.
* Creates a new dataset, and saves it into "average_dataset.txt".


##Output

The output is saved in two files placed in the "UCI HAR Dataset" folder:
* tidy_dataset.txt: Contains the complete tidy dataset created according with the project instructions.
* average_dataset.txt: Contains the dataset with only average of each variable for each activity and each subject.
