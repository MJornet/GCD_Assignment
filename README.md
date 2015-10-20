# Getting and Cleaning Data Course Project

This repository contains:
- The run_analysis.r file. Contains the step by step code
- The Codebook
- This rm file that you are reading now


<b>Process step by step</b>

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





