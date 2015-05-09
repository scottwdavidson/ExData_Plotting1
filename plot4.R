## ******************
## plot4.R
## ******************
plot4 <- function() {
  
  ## Read the data in via read.table
  houseData <- read.table("../household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)
  
  ## Convert the Date column to a Date type
  houseData$Date = as.Date(houseData$Date, format="%d/%m/%Y")
  
  ## Remove everything but Feb 01 and Feb 02
  dateRange = as.Date(c("01/02/2007", "02/02/2007"), "%d/%m/%Y")
  houseData = subset(houseData, Date %in% dateRange)
  nrow(houseData)
  
  ## Combine the Data & Time columns into a new DateTime and convert to POSIXlt (Date)
  dateTime = paste(as.Date(houseData$Date), houseData$Time)
  houseData$DateTime = as.POSIXct(dateTime)
  
  ## Create a plot w/ 4 separate plots (2x2)
  png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  
  ## Plot 1,1 (Global Active Power)
  plot(houseData$DateTime,houseData$Global_active_power,
       type="l", xlab="",ylab="Global Active Power (kilowatts)")

  ## Plot 1,2 (Voltage)
  ## Create a line plot (and then add two more lines)
  plot(houseData$DateTime,houseData$Voltage,col="black",
       type="l",ylab = "Voltage", xlab = "datetime")
  lines(houseData$DateTime,houseData$Sub_metering_2,col="red")
  lines(houseData$DateTime,houseData$Sub_metering_3,col="blue")
  
  ## Plot 2,1 (Energy Sub Metering)
  plot(houseData$DateTime,houseData$Sub_metering_1,col="black",
       type="l",ylab = "Energy sub metering", xlab = "")
  lines(houseData$DateTime,houseData$Sub_metering_2,col="red")
  lines(houseData$DateTime,houseData$Sub_metering_3,col="blue")
  
  ## Add the legend
  legend("topright",
         col=c("black", "red", "blue"),
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=1, lwd=2,bty="n")
  
  ## Plot 2,2 (Global Reactive Power)
  plot(houseData$DateTime,houseData$Global_reactive_power,
       type="l", xlab="datetime", ylab="Global_reactive_power")
  
  ## Shut off the device
  dev.off()
}
