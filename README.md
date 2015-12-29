# medicare-hospital-data
## About the dataset
The data used comes from the Hospital Compare website (http:// hospitalcompare.hhs.gov) run by the U.S. Department of Health and Human Services. The purpose of the website is to provide data and information about the quality of care at over 4,000 Medicare-certified hospitals in the U.S. this dataset essentially covers all major U.S. hospitals. This dataset is used for a variety of purposes, including determining whether hospitals should be fined for not providing high quality care to patients. 

The particular subset of data covered in the three functions is contained in the file outcome-of-care-measures.csv. This file contains information about 30-day mortality and readmission rates for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.

## Summary of functions
There are a total of three functions. 
Function  | Description
------------- | -------------
best.R  | Returns the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome in that state
rankhospital.R  | Returns the name of the hospital that has the specified ranking
rankall.R | Returns a 2-column data frame containing the hospital in each state that has the specified ranking

## Credit
This repository was created as part of an assignment for the Johns Hopkins R Programming course on Coursera.
