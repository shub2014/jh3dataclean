## Analyze Samsung III sensor data set - code flow

###Set working director as root
###Create file paths
###Load files
###Add columns by combining dataframe columns into single data frame
###Stack test and train data sets - add rows on top of each other to combine test and training data
###Add labels with descriptive variable names by joining on keys with merge
###Only keep columns with "mean" and "std" in their names
###Add descriptive activity names

###Create a second tidy data set as a copy of all.data
###Create a variable containing list grouped by activity and subject
###Apply colmeans function using sapply over all columns and simply result. 
###Then transpose to put it in a format easier to validate with after writing out to all.data.step5.txt.


## Analyze Samsung III sensor data set - variable names

* dir = working directory

* activity.labels.file = points to the file name.txt
* features.file = points to the file name.txt
* test.file= points to the file name.txt
* test.label.file= points to the file name.txt
* test.subject.file= points to the file name.txt
* train.file= points to the file name.txt
* train.label.file= points to the file name.txt
* train.subject.file= points to the file name.txt

* activity.labels.dt = read files in data table
* colnames(activity.labels.dt)<-c("id","activity")
* features.dt= read files into data table
* test.dt= read files into dataframe
* test.label.dt= read files into dataframe
* test.subject.dt= read files into dataframe

* train.dt= read files into dataframe
* train.label.dt= read files into dataframe
* train.subject.dt= read files into dataframe
* test.tmp = temp datatable
* test.all = contains activity label, subject and test data
* train.tmp= temp datatable
* train.all= contains activity label, subject and test data
* all.data = combined test and train data but without proper column names

* features.vector = contains variable names
* features.vector = updated vector with activity and subject column names
* colnames(all.data) = updated all.data column names with columns names
* all.data.subset = only contains mean and standard deviation columns 
* all.data.merged = contains descriptive labels for the activities

* all.data2 = contains an independent copy of all.data with test and train data

* data.split = split/grouped by activity id and subject
* all.data.step5<- apply ColMeans function, remove NA's, and transpose the result set (for easy validation in excel) before writing out the result set to a all.data.step5.txt


