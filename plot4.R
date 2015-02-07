# plot 4.R

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

## Construct the plot with 4 pannels
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,0,0))
with(data, {
  # plot 1
  plot(x=DateTime,y=Global_active_power, 
       xlab="", ylab="Global Active Power",
       type="l")
  # plot 2
  plot(x=DateTime,y=Voltage, 
       xlab="datetime", ylab="Voltage",
       type="l")
  # plot 3
  plot(x=DateTime,y=Sub_metering_1,
       xlab="", ylab="Energy sub metering",
       type="l")
  lines(x=DateTime, y=Sub_metering_2,
        col="Red")
  lines(x=DateTime, y=Sub_metering_3,
        col="Blue")
  legend("topright",col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
         lty=1, lwd = .75, cex = .75, bty = "n") 
  # plot 4
  plot(x=DateTime,y=Global_reactive_power,
       xlab="datetime", ylab="Global_rective_power",
       type="l")
})


## save his to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()