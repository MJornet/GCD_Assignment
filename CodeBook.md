# Description of the column variables

Activity

  - An Activity name, as they are named in the Activity_labels.txt
  
Subject

  - The id of the subject
  
Variables

  - The variables are the ones present in the file Features.txt that contain mean() or std().

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The original dataset can be obtained here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Description of the process to clean the data

Step 1
- Download the data
- Extract the zip file
- Read the Train and Test
  - Reading the x data
  - Reading the y data
  - Reading the subject data
  - Merge all 3 data tables
- Merge Train and Test data
- Delete the data tables that will not be used anymore

Step 2
- Read the feature names file
- Get the columns that contain "mean" and "std"
- Create a new data table with only the Activity, the subject and the mean and std columns
- Delete the data tables that will not be used anymore

Step 3
- Read the Activity names file
- Add this names to the rows

Step 4
- Read the Feature names file
- Add this names to the columns

Step 5
- Aggregate the data by Activity and Subject, and calculate the mean
- Export this new data frame to a txt file
  
