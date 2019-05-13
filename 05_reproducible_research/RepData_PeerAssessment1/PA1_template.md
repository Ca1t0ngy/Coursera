---
title: "Reproducible Research: Peer Assessment 1"
output: 
  html_document:
    keep_md: true
---

## Loading and preprocessing the data

```r
# set work directory
# setwd("Repository/coursera/05_reproducible_research/RepData_PeerAssessment1/")
# unzip data file 
# unzip("activity.zip")

# load data
data <- read.csv("activity.csv")

# general info
str(data)
```

```
## 'data.frame':	17568 obs. of  3 variables:
##  $ steps   : int  NA NA NA NA NA NA NA NA NA NA ...
##  $ date    : Factor w/ 61 levels "2012-10-01","2012-10-02",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ interval: int  0 5 10 15 20 25 30 35 40 45 ...
```

```r
# format data
data$date <- as.Date(data$date)

# subset data without missing value 
data_subset <- subset(data, is.na(data$steps)==FALSE)
```
## What is mean total number of steps taken per day?


```r
# total days in october and november = 61 
# calculate steps per day
steps_per_day <- rep(0, 61)
for (i in 1:61){
        steps_per_day[i] <- sum(data$steps[(288*(i-1)+1):(288*i)], na.rm = TRUE)
}

# plot histogram
hist(steps_per_day, col="blue", breaks=10, main="Histogram of 
     the total number of steps taken each day", xlab="Steps", ylab="Frequency")
```

![](PA1_template_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

```r
# some statistics
print(paste0("Total number of steps taken per day: ", sum(steps_per_day)))
```

```
## [1] "Total number of steps taken per day: 570608"
```

```r
print(paste0("Mean of the total number of steps taken perday: ", 
             mean(steps_per_day)))
```

```
## [1] "Mean of the total number of steps taken perday: 9354.22950819672"
```

```r
print(paste0("Median of the total number of steps taken perday: ", 
             median(steps_per_day)))
```

```
## [1] "Median of the total number of steps taken perday: 10395"
```
## What is the average daily activity pattern?



```r
# load ggplot package
library("ggplot2")

# get max steps
max_steps <- max(data_subset$steps)

# get index
index <- match(max_steps, data_subset$steps)

# plot wihout missing values
ggplot(data_subset, aes(date, steps)) + geom_line() + xlab("") + ylab("Steps") + 
        geom_point(aes(data_subset$date[index], max_steps, col="max_steps"))
```

![](PA1_template_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

```r
# the max steps appear at the 14476th interval, with the max steps equal to 806
```
## Imputing missing values



```r
# total number of missing values in the dataset: 2304
sum_ <- sum(is.na(data$steps))

# percentage of missing value: 0.1311475
mean_ <- mean(is.na(data$steps))

## Imputing missing values 
# Strategy : replacing missing value with mean steps averaged across days
# 
library("dplyr")
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
data2 <- data
steps_per_day_imput <- rep(0, 61)

# imput missing values by mean steps of that day
for (i in 1:61){
        
        data2[(288*(i-1)+1):(288*i),] %>% mutate(steps = ifelse(is.na(steps), steps_per_day[i]/288, steps))
        steps_per_day_imput[i] <- sum(data2[(288*(i-1)+1):(288*i),]$steps)
}

# mean and median after imputation
```
## Are there differences in activity patterns between weekdays and weekends?

