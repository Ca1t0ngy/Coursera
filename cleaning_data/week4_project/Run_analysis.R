## Coursera Data Science 
## Course 3: Getting and Clearning Data 
## Week 4 Project 

library("dplyr")

# Set work directory
setwd("/Users/caitongy/Desktop/week4_project")

# Files path 
file_features <- "UCI HAR Dataset/features.txt"
file_activity_labels<- "UCI HAR Dataset/activity_labels.txt"

file_subject_test <- "UCI HAR Dataset/test/subject_test.txt"
file_X_test <- "UCI HAR Dataset/test/X_test.txt"
file_y_test <- "UCI HAR Dataset/test/y_test.txt"
file_subject_train <- "UCI HAR Dataset/train/subject_train.txt"
file_X_train <- "UCI HAR Dataset/train/X_train.txt"
file_y_train <- "UCI HAR Dataset/train/y_train.txt"

# Load file 
features <- read.table(file_features)
activity_labels <- read.table(file_activity_labels)
subject_test <- read.table(file_subject_test)
x_test <- read.table(file_X_test)
y_test <- read.table(file_y_test)
subject_train <- read.table(file_subject_train)
x_train <- read.table(file_X_train)
y_train <- read.table(file_y_train)

# Merge train set and test set 
train <- cbind(subject_train,y_train, x_train)
test <- cbind(subject_test,y_test, x_test)
data_merged <- rbind(train, test)

# Extracted colums with mean and std
extracted_index <- features[grepl("mean", features$V2),]
extracted_index2 <- features[grepl("std", features$V2),]
extracted_index <-rbind(extracted_index, extracted_index2) %>%
        arrange(V1) %>%
        mutate(V3 = V1 + 2) 
data_merged_extracted <- data_merged[, c(1,2, extracted_index$V3)]

# Change the actitity names 
data_merged_extracted <- data_merged_extracted %>%
        mutate(V1.1 = activity_labels[match(V1.1, activity_labels$V1), "V2"])

# Change column names 
col_names <- extracted_index$V2 
col_names <- gsub('-', '_', col_names)
col_names <- gsub('\\(', '', col_names) # get rid of parentheses, using \\ to avoid error
col_names <- gsub(')', '', col_names)

colnames(data_merged_extracted) <- c('Subjects','Activities',col_names)

# Independent tidy data
tidy_data <- data_merged_extracted %>%
        group_by(Activities, Subjects) %>%
        summarise_all(mean)


        
       
