## Analyze Samsung III sensor data set

library(data.table)

###set working director as root
(dir <- getwd())
if (!is.null(dir)) setwd(dir)

### create file paths
activity.labels.file<-paste(dir,"/activity_labels.txt",sep='')
features.file<-paste(dir,"/features.txt",sep='')

test.file<-paste(dir,"/test/X_test.txt",sep='')
test.label.file<-paste(dir,"/test/y_test.txt",sep='')
test.subject.file<-paste(dir,"/test/subject_test.txt",sep='')

train.file<-paste(dir,"/train/X_train.txt",sep='')
train.label.file<-paste(dir,"/train/y_train.txt",sep='')
train.subject.file<-paste(dir,"/train/subject_train.txt",sep='')

### load files

activity.labels.dt<-fread(activity.labels.file)
colnames(activity.labels.dt)<-c("id","activity")

features.dt<-fread(features.file)

test.dt<-read.table(test.file)
test.label.dt<-read.table(test.label.file)
test.subject.dt<-read.table(test.subject.file)

train.dt<-read.table(train.file)
train.label.dt<-read.table(train.label.file)
train.subject.dt<-read.table(train.subject.file)

###Add columns by combining dataframes - add label, subject, variables
test.tmp<-cbind(test.subject.dt,test.dt)
test.all<-cbind(test.label.dt,test.tmp)

train.tmp<-cbind(train.subject.dt,train.dt)
train.all<-cbind(train.label.dt,train.tmp)

###stack test and train data sets - add rows on top of each other
all.data<-rbind(test.all,train.all)


###add labels with descriptive variable names

features.vector <-as.vector(features.dt[,V2])
features.vector<-append(c("activity_id","subject"), features.vector,after=2)
colnames(all.data)<-features.vector


###only keep columns with "mean" and "std" in their names

all.data.subset<-all.data[,grep("mean|std|activity_id|subject",colnames(all.data))]


###adds descriptive activity names

all.data.merged = merge(all.data.subset,activity.labels.dt, by.x="activity_id", by.y= "id",all=TRUE)


### create second tidy data set

all.data2<-all.data
data.split<-split(all.data2,list(all.data2$activity_id,all.data2$subject))
all.data.step5<-t(sapply(data.split,function(all.data2) colMeans(all.data2,na.rm=TRUE)))
write.table(all.data.step5,file="all.data.step5.txt",row.name=FALSE)

