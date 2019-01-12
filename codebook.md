

#Code Book

##The variables

    subjectID - integer which identifies each of the subjects in the measurements
    activityID - integer corresponding to an activity type shown in activitylabels df
    activityTYPE - descriptive names of the activity
    *all the other variable names in the tidydata.txt are the measurements

##The data
    The data was a collection of .txt files containing measurements of differents sensors onboard devices worn by 30 subjects.
    This was in the data X. Data Y provides names to the values of Data X.
    The data also had train and test sets which had to be merged to obtain a more substantial data set.

    
##Techniques used
    grep was used to subset only the mean and std related values that are in the data set.
    The dplyr package was used, specfically the functions group_by and summarize, to easily get an avarage by activity type and by measurement.
    