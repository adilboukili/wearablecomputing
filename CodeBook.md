Dataset Description:
The dataset used in this analysis is related to human activity recognition using smartphones. It contains data collected from experiments where subjects performed activities of daily living (e.g., walking, standing, sitting) while wearing a smartphone. The smartphone recorded various measurements from its sensors during these activities.

Variables:
Subject: Identifier of the subject who performed the activity. Integer values ranging from 1 to 30.
Activity: Descriptive name of the activity performed by the subject. Factors include: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".
Other Variables: Several variables represent measurements from the smartphone's sensors. These variables include mean and standard deviation measurements, denoted by names such as "tBodyAcc-mean()-X", "tBodyAcc-std()-Y", etc. These variables capture different aspects of acceleration and angular velocity during the activities.
Transformations and Data Cleaning:
Merging Datasets: The training and test datasets were merged using the rbind() function to create one dataset.
Extraction of Relevant Features: Only measurements on the mean and standard deviation for each measurement were extracted. This was achieved by filtering the dataset columns using regular expressions.
Activity Labeling: Descriptive activity names were used to name the activities in the dataset. The activity labels were read from the activity_labels.txt file and matched to the activity codes.
Variable Labeling: The variables in the dataset were labeled appropriately using the feature names provided in the features.txt file.
Creation of Tidy Dataset: The tidy dataset was created by calculating the average of each variable for each activity and each subject using the dplyr package's summarise_all() function.
Output:
The final output is a tidy dataset named "tidy_dataset.txt" containing the average of each variable for each activity and each subject.
