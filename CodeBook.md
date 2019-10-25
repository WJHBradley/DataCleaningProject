The final data set uploaded to this project as a .csv went through several changes to ensure that it was tidy.

==== Data Pull ====

From the raw data .zip I pulled out the relevant files containing data. 
This consisted of two labeling files:
    1 - features.txt
    2 - activity_labels.txt
And 6 files containing the participant measurements
    1 - subjects_test.txt
    2 - y_test.txt
    3 - x_test.txt
    4 - subjects_train.txt
    5 - y_train.txt
    6 - x_train.txt
These files were in various places in the .zip folder.

==== Data Merge, Condensing, and Labeling ==== 

Merging the data set was a two step process.

First, I created two separate data sets for test and train, using cbind(). 
I applied the labels "Subject" and "ActivityLabel" respectively, and pulled the remaining columns from the features.txt file.

Then, I combined the two data sets into one using rbind().

To pull only the relevant measurements, I did a text search through the features.txt file. 
As mentioned in the README file, I searched for "mean()" and "std()", as these were indicated to be mean and standard deviation.
I used the resulting vector to select only the relevant columns, as well as "Subject" and "ActivityLabel"

I used the activity_labels.txt file to pull strings for the activities. I used match() to place in the values

==== Transforming to Tidy Data ====

I used both melt() and dcast() to create the final file.

First I melted using the two ID variables (Subject and ActivityLabel)
Then I used dcast() to create a restructured table. 
I specified the aggregating function as mean(), and used Subject and ActivityLabel.

==== Columns and Measures within Data Set ==== 

1	Subject
2	ActivityLabel
3	tBodyAcc.mean...X
4	tBodyAcc.mean...Y
5	tBodyAcc.mean...Z
6	tBodyAcc.std...X
7	tBodyAcc.std...Y
8	tBodyAcc.std...Z
9	tGravityAcc.mean...X
10	tGravityAcc.mean...Y
11	tGravityAcc.mean...Z
12	tGravityAcc.std...X
13	tGravityAcc.std...Y
14	tGravityAcc.std...Z
15	tBodyAccJerk.mean...X
16	tBodyAccJerk.mean...Y
17	tBodyAccJerk.mean...Z
18	tBodyAccJerk.std...X
19	tBodyAccJerk.std...Y
20	tBodyAccJerk.std...Z
21	tBodyGyro.mean...X
22	tBodyGyro.mean...Y
23	tBodyGyro.mean...Z
24	tBodyGyro.std...X
25	tBodyGyro.std...Y
26	tBodyGyro.std...Z
27	tBodyGyroJerk.mean...X
28	tBodyGyroJerk.mean...Y
29	tBodyGyroJerk.mean...Z
30	tBodyGyroJerk.std...X
31	tBodyGyroJerk.std...Y
32	tBodyGyroJerk.std...Z
33	tBodyAccMag.mean..
34	tBodyAccMag.std..
35	tGravityAccMag.mean..
36	tGravityAccMag.std..
37	tBodyAccJerkMag.mean..
38	tBodyAccJerkMag.std..
39	tBodyGyroMag.mean..
40	tBodyGyroMag.std..
41	tBodyGyroJerkMag.mean..
42	tBodyGyroJerkMag.std..
43	fBodyAcc.mean...X
44	fBodyAcc.mean...Y
45	fBodyAcc.mean...Z
46	fBodyAcc.std...X
47	fBodyAcc.std...Y
48	fBodyAcc.std...Z
49	fBodyAccJerk.mean...X
50	fBodyAccJerk.mean...Y
51	fBodyAccJerk.mean...Z
52	fBodyAccJerk.std...X
53	fBodyAccJerk.std...Y
54	fBodyAccJerk.std...Z
55	fBodyGyro.mean...X
56	fBodyGyro.mean...Y
57	fBodyGyro.mean...Z
58	fBodyGyro.std...X
59	fBodyGyro.std...Y
60	fBodyGyro.std...Z
61	fBodyAccMag.mean..
62	fBodyAccMag.std..
63	fBodyBodyAccJerkMag.mean..
64	fBodyBodyAccJerkMag.std..
65	fBodyBodyGyroMag.mean..
66	fBodyBodyGyroMag.std..
67	fBodyBodyGyroJerkMag.mean..
68	fBodyBodyGyroJerkMag.std..
