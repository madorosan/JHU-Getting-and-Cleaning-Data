
#Getting and Cleaning Data W4 Assignment

This repository contains steps taken to tidy up a sample data.

The data used were from mobile phone sensor measurements relating to the motion of 30 subjects (Data X).
The data also includes the type of activies(motion) performed during the recording (Data Y).

Data X and Y were merged, arranged, and summarize using the skills taught in the Getting and Cleaning Data Module of JHU in Coursera.org
Specifically, the merge(), grep(), group_by(), and summarize() functions were used to tidy up the given data set.
The piping %>% operator was also used for ease in applying the dplyr functions mentioned above.

The details can be seen in the analysis.R script included in this repository.
The comments in the .R script will aide in explaing the steps that were taken.

The objective of obtaining the a final tidy data set was achieved. 
The file is in this repository as tidydata.txt.

The challenging part was the combining of data X and Y which required some recall. 
The step by step requirement in the Assignment gave useful insight on what to do next.


