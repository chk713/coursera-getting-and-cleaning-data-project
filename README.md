# Final project for "Getting and Cleaning Data"

This is the final project for "Getting and Cleaning Data" course.  The script is written and saved under "run_analysis.r" and the final result is saved as "tidy.txt".

The code will perform followings:

1. Download the dataset if it does not already exist in the working directory
2. Load the collected data and feature info
3. Loads training and test datasets.  Filter the dataset including mean or standard deviation.
4. Loads the activity and subject data and merges those columns with the dataset for train data.
5. Repeat step 4 with test data
5. Merges training and test datasets.
6. Converts the `activity` and `subject` columns into factors
7. Creates a tidy dataset that consists of the average value of each
   variable for each subject and activity pair.
