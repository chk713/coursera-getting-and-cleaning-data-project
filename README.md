# Final project for "Getting and Cleaning Data"

This is the final project for "Getting and Cleaning Data" course.  The script is written and saved under "run_analysis.r" and the final result is saved as "tidy.txt".

The code will perform followings:

1. Download the required file and unzip it (Run it for the first time only)
2. Load activity labels and features data
3. Filter out data with mean and standard deviation and modify the file name to be more visible.
4. Loads train data.  Import subjects, activities and data separately and combine together.
5. Repeat step 4 for test data.
5. Merges training and test datasets.
6. Converts the `activity` and `subject` columns into factors
7. Creates a tidy data set with the average of each variable for each activity and each subject.
