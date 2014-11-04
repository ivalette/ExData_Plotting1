## Introduction

## Note! Data are downloaded manually to your local machine.

## This assignment uses data from
## the UC Irvine Machine Learning Repository, a popular repository for machine learning
## datasets. In particular, we will be using the "Individual household
## electric power consumption Data Set" which I have made available on
## the course web site.


## The dataset contains measurements of electric power consumption in
## one household with a one-minute sampling rate over a period of almost
## 4 years. Different electrical quantities and some sub-metering values
## are available.


## The following descriptions of the 9 variables in the dataset are taken
## from the UCI website:

# 1. Date: Date in format dd/mm/yyyy
# 2. Time: time in format hh:mm:ss
# 3. Global_active_power: household global minute-averaged active power (in kilowatt)
# 4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# 5. Voltage: minute-averaged voltage (in volt)
# 6. Global_intensity: household global minute-averaged current intensity (in ampere)
# 7. Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). 
# It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave 
# (hot plates are not electric but gas powered).
# 8. Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). 
# It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# 9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). 
# It corresponds to an electric water-heater and an air-conditioner.

## Loading the data

## setwd("/Users/isa/Documents/Courses/Johns Hopkins/Exploratory Data Analysis/Week1")
## getwd()

data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", 
                   colClasses=c("factor", "factor", "numeric", "numeric","numeric","numeric",
                                "numeric","numeric","numeric"))

## check that the dataset looks the way it should.
## head(data)
## tail(data)
## str(data)
## summary(data)

## * The dataset has 2,075,259 rows and 9 columns. First
## calculate a rough estimate of how much memory the dataset will require
## in memory before reading into R. Make sure your computer has enough
## memory (most modern computers should be fine).



## * We will only be using data from the dates 2007-02-01 and
## 2007-02-02. One alternative is to read the data from just those dates
## rather than reading in the entire dataset and subsetting to those
## dates.

## * You may find it useful to convert the Date and Time variables to
## Date/Time classes in R using the `strptime()` and `as.Date()`
## functions.

data$Date2=as.Date(strptime(data$Date, format="%d/%m/%Y" ),"%Y%m&d")
dt1 <- subset(data, Date2=="2007-02-01", select = Time:Date2)
dt2 <- subset(data, Date2=="2007-02-02", select = Time:Date2)
dt <- rbind(dt1, dt2)

## head(dt)
## tail(dt)
## str(dt)
## summary(dt)

## * Note that in this dataset missing values are coded as `?`.


## Making Plots
## Our overall goal here is simply to examine how household energy usage
## varies over a 2-day period in February, 2007. Your task is to
## reconstruct the following plots below, all of which were constructed
## using the base plotting system.

## First you will need to fork and clone the following GitHub repository:
## [https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)


## For each plot you should

## * Construct the plot and save it to a PNG file with a width of 480
## pixels and a height of 480 pixels.

## * Name each of the plot files as `plot1.png`, `plot2.png`, etc.

## * Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
## constructs the corresponding plot, i.e. code in `plot1.R` constructs
## the `plot1.png` plot. Your code file **should include code for reading
## the data** so that the plot can be fully reproduced. You should also
## include the code that creates the PNG file.

## * Add the PNG file and R code file to your git repository

## When you are finished with the assignment, push your git repository to
## GitHub so that the GitHub version of your repository is up to
## date. There should be four PNG files and four R code files.


## The four plots that you will need to construct are shown below. 


### Plot 1
### # ![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

## Create plot on screen device and give the graf a new title
hist(dt$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)" )
## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
## Don't forget to close the PNG device!
dev.off() 



### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 
