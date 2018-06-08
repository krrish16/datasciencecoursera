library(data.table)

## downloading and extracting dataset if the file doesn't exist

if (!file.exists("dataset.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "./dataset.zip", method = "curl")
  unzip("dataset.zip" , overwrite = TRUE)
}

#list.files()
#list.files("./UCI HAR Dataset")
#list.files("./UCI HAR Dataset/test")
#list.files("./UCI HAR Dataset/train")


## reading data
# test data

test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./UCI HAR Dataset/test/Y_test.txt")
test_sub <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# train data

train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./UCI HAR Dataset/train/Y_train.txt")
train_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# reading activity labels and features

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

## Merging datasets

x <- rbind(train_x,test_x)
y <- rbind(train_y,test_y)
subject <- rbind(train_sub,test_sub)

names(x) <- features$V2
names(subject) <- "Subject"
y$Activity <- factor(y$V1, labels = as.character(activity_labels[,2]))

## Extracting only the measurements on the mean and standard deviation for each measurement

selected <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
x <- x[,selected[,1]]
Activity <- y$Activity
data <- cbind(x , subject , Activity)


## Using descriptive activity names to name the activities in the data set

names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))

##Creating a second,independent tidy data set and ouput it

library(plyr)
tidy_data <- aggregate(. ~ Subject + Activity, data, mean)
tidy_data <- tidy_data[order(tidy_data$Subject,tidy_data$Activity),]
write.table(tidy_data, file = "./tidydata.txt",row.name=FALSE)
