# Coursera project - "Getting and Cleaning Data"

This is the course project for the "Getting and Cleaning Data" Coursera course.
The R script, `run_analysis.R`, will perform below :

1. Download the dataset if it does not already exist in the working directory
2. Load the collected data and feature info
3. Loads training and test datasets.  Filter the dataset including mean or standard deviation.
4. Loads the activity and subject data and merges those columns with the dataset for train data.
5. Repeat step 4 with test data
5. Merges training and test datasets.
6. Converts the `activity` and `subject` columns into factors
7. Creates a tidy dataset that consists of the average value of each
   variable for each subject and activity pair.

The end result is shown in the file `tidy.txt`.
