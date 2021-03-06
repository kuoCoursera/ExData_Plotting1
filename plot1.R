# plot 1.R

## read entire dataset from household_power_consumption.txt file
input <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';',
             quote='\"', na.strings="?", comment.char="", stringsAsFactors=FALSE)

## reformat all the dates in the input
input$Date <- as.Date(input$Date, format="%d/%m/%Y")

## subset the data to dates 2007-02-01 and 2007-02-02.
data <- subset(input, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## delete the entire dataset
rm(input)

##  Date-Time Conversion
data$DateTime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

## Construct the histogram (plot 1)
histTitle <- "Global Active Power"
xAxisLabel <- "Global Active Power (kilowatts)"
yAxisLabel <- "Frequency"
barColor <- "Red"
hist(x=data$Global_active_power, main=histTitle,
     xlab=xAxisLabel, ylab=yAxisLabel , col=barColor)

## save his to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()