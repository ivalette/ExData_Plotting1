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

## * You may find it useful to convert the Date and Time variables to
## Date/Time classes in R using the `strptime()` and `as.Date()`
## functions.

## Install the "Lubridate" package if you have not already done that!
## install.packages("lubridate")

## Call the correct Library
library(lubridate)

## Reformat the Date to "Date2"
data$Date2=as.Date(strptime(data$Date, format="%d/%m/%Y" ),"%Y%m&d")

## Subset only with the dates from the 1st and 2nd of February 2007 and bind (aka merge) the dataset together
dt1 <- subset(data, Date2=="2007-02-01", select = Time:Date2)
dt2 <- subset(data, Date2=="2007-02-02", select = Time:Date2)
dt <- rbind(dt1, dt2)

## Subset with a new variable Time2 that is composed of Date2 and Time pasted together
dt$Time2=ymd_hms(paste(dt$Date2,dt$Time, sep=" " ))
dt2 <- subset(dt, select = Global_active_power:Time2)


## head(dt2)
## tail(dt2)
## str(dt2)
## summary(dt2)


### Plot 4
### # Instruction to reconstruct ![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png)  
## Split the graf area into 4 sections
par(mfrow = c(2, 2))

# plot 1 (graf 1.1)
plot(dt2$Time2, dt2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", 
     cex.axis=0.75, cex.lab=0.75)

# plot 2 (gral 1.2)
plot(dt2$Time2, dt2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", cex.axis=0.75, cex.lab=0.75 )

# plot 3 (graf 2.1)
plot(dt2$Time2, dt2$Sub_metering_1, type = "l", col="black", xlab = "", ylab = "Energy sub metering", 
       cex.axis=0.75, cex.lab=0.75)
points(dt2$Time2, dt2$Sub_metering_2, type = "l", col="red", xlab = "", ylab = "Energy sub metering", 
       cex.axis=0.75, cex.lab=0.75)        
points(dt2$Time2, dt2$Sub_metering_3, type = "l", col="blue", xlab = "", ylab = "Energy sub metering", 
       cex.axis=0.5, cex.lab=0.75)

## Create a legend in the top rigth corner and change the size of text.
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", 
                                                                        "Sub_metering_3"), 
       cex=0.75, bty = "n", y.intersp=0.35, trace=T)
       
# plot 4 (graf 2.2)
plot(dt2$Time2, dt2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", 
     ylim = c(0, 0.5), cex.axis=0.75, cex.lab=0.75)


## Copy plot4 to a PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
## Don't forget to close the PNG device!
dev.off() 

