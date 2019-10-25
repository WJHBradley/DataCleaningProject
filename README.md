# DataCleaningProject
Final Course Assignment

For this assignment I chose to run everything within one script, as the file paths and names will remain unchanged.
I have the script saving to my local machine, but you can change the wd in line 15 to your own personal machine and it will work fine.

I write extensive notes in my scripts, as you will notice. This helps to describe each step and the logic behind it.

Running the run_analysis.R script will end with a data set labeled "finaldata", which fulfills the assignment of a mean for each measurement by subject and activity. I have uploaded the file as a .csv to this project.

In order to pick variables, I went off the description in the file "features_info" included in the data set. They mention that mean and standard deviation are indicated by "mean()" and "std()" respectively. 

For the merging of test and train files I decided to use cbind and rbind, to simply take the relevant pieces from the various files. 

For the final step I decided to use a melt + cast method
