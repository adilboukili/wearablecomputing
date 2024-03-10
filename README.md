# wearablecomputing

Here's the breakdown of how to achieve each step:

1 - Merge the training and test sets to create one dataset:
      Read the training and test sets.
      Merge them using rbind().
  
2 - Extract only the measurements on the mean and standard deviation for each measurement:
      Read the feature names.
      Use the feature names to identify the columns containing mean and standard deviation measurements.
      Extract those columns.
  
3 - Use descriptive activity names to name the activities in the dataset:
      Read the activity labels.
      Replace activity codes with descriptive names.
  
4 - Appropriately label the dataset with descriptive variable names:
      Use the feature names to label the dataset columns.
 
5 - Create a second, independent tidy dataset with the average of each variable for each activity and each subject:
      Group the dataset by activity and subject.
      Calculate the average for each variable within each group.
