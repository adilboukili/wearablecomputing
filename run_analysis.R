# Step 1: Merge the training and test sets
# Read training set
train_data <- read.table("Dataset/train/X_train.txt", header = FALSE)
# Read test set
test_data <- read.table("Dataset/test/X_test.txt", header = FALSE)
# Merge training and test sets
merged_data <- rbind(train_data, test_data)

# Step 2: Extract only the measurements on the mean and standard deviation
# Read feature names
features <- read.table("Dataset/features.txt", header = FALSE)
# Identify indices of mean and standard deviation measurements
mean_std_indices <- grep("mean\\(\\)|std\\(\\)", features$V2)
# Extract columns with mean and standard deviation measurements
extracted_data <- merged_data[, mean_std_indices]

# Step 3: Use descriptive activity names
# Read activity labels
activity_labels <- read.table("Dataset/activity_labels.txt", header = FALSE)
# Read activity labels for training set
train_labels <- read.table("Dataset/train/y_train.txt", header = FALSE)
# Read activity labels for test set
test_labels <- read.table("Dataset/test/y_test.txt", header = FALSE)
# Merge activity labels for both training and test sets
merged_labels <- rbind(train_labels, test_labels)
# Replace activity codes with descriptive names
merged_labels$activity_name <- factor(merged_labels$V1, levels = activity_labels$V1, labels = activity_labels$V2)
# Add descriptive activity names to the extracted dataset
extracted_data$activity <- merged_labels$activity_name

# Step 4: Label the dataset with descriptive variable names
# Extract column names for mean and standard deviation measurements
selected_features <- features[mean_std_indices, ]
# Use selected feature names to label the dataset columns
colnames(extracted_data) <- c(selected_features$V2, "activity")

# Step 5: Create a second tidy dataset with the average of each variable for each activity and each subject
library(dplyr)
# Read subject IDs for training set
train_subjects <- read.table("Dataset/train/subject_train.txt", header = FALSE)
# Read subject IDs for test set
test_subjects <- read.table("Dataset/test/subject_test.txt", header = FALSE)
# Merge subject IDs for both training and test sets
merged_subjects <- rbind(train_subjects, test_subjects)
# Add subject IDs to the extracted dataset
extracted_data$subject <- merged_subjects$V1
# Group the dataset by activity and subject
grouped_data <- group_by(extracted_data, activity, subject)
# Summarize the dataset to calculate the average of each variable for each activity and each subject
tidy_data <- summarise_all(grouped_data, mean)

# Write the tidy dataset to a file
write.table(tidy_data, file = "tidy_dataset.txt", row.names = FALSE)
