# GETTING AND CLEANING DATA - COURSE PROJECT
# Tirza Guerra

# Goal: Prepare tidy data to be used for later analysis

# Pre-Processing
# Check if the dataset folders exist
if (!file.exists("./test") |
    !file.exists("./train")) {
        stop("Dataset folder not found")
}
library(dplyr)
library(plyr)

# STEP 1: Merge the training and the test sets to create one data set.
train_s <- read.table("./train/subject_train.txt")
train_x <- read.table("./train/X_train.txt")
train_y <- read.table("./train/Y_train.txt")
test_s <- read.table("./test/subject_test.txt")
test_x <- read.table("./test/X_test.txt")
test_y <- read.table("./test/Y_test.txt")

# Create one X dataset
X_all <- rbind(train_x, test_x)

# Create one Y dataset
Y_all <- rbind(train_y, test_y)

# Create one Subject dataset
S_all <- rbind(train_s, test_s)

# STEP 2: Extract only the measurements on the mean and standard deviation for 
#         each measurement. 
features <- read.table("features.txt")

# Keep only feature names that contain either "mean' or "std' 
keep <- grep("-(mean|std)\\(\\)", features[, 2])

# Subset X dataset
X_all <- X_all[, keep]

# Change the column names
names(X_all) <- features[keep, 2]

# STEP 3: Use descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")

# Update activity names according to the descriptions in the activities files
Y_all[, 1] <- activities[Y_all[, 1], 2]

# Change the column name
names(Y_all) <- "Activity"

# STEP 4: Appropriately label the data set with descriptive variable names. 
# Change the column name
names(S_all) <- "Subject"

# Create one dataset with all data
tidy_data <- cbind(X_all, Y_all, S_all)

# Save the tidy dataset into a txt file
write.table(tidy_data, "tidy_dataset.txt", row.name = FALSE)

# STEP 5: Create a second, independent tidy data set with the average of each 
#         variable for each activity and each subject
# Calculate averages for the measure columns (1-66)
averages <- ddply(tidy_data, .(Subject, Activity), function(x) colMeans(x[, 1:66]))

# save the average data into a txt file
write.table(averages, "average_dataset.txt", row.name = FALSE)
