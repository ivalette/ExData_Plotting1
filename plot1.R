## Exploratory Data Analysis (Coursera November 2014)


## Project Assignment 1
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



## Loading the data
## Please upload the dataset manually to your machine. See the README.md file for instruction on where to find 
## the dataset and further instructions regarding the data.

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


### Plot 1
### # Instruction to reconstruct [plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

## Create plot on screen device and give the graf a new title
hist(dt$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)" )
## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
## Don't forget to close the PNG device!
dev.off() 

