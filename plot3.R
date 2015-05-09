## ******************
## plot3.R
## ******************
plot3 <- function() {
  
  ## Read the data in via read.table
  houseData <- read.table("../household_power_consumption.txt", 
                          header = TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)
  
  ## Convert the Date column to a Date type
  houseData$Date = as.Date(houseData$Date, format="%d/%m/%Y")
  
  ## Remove everything but Feb 01 and Feb 02
  dateRange = as.Date(c("01/02/2007", "02/02/2007"), "%d/%m/%Y")
  houseData = subset(houseData, Date %in% dateRange)
  
  ## Combine the Data & Time columns into a new DateTime and convert to POSIXlt (Date)
  dateTime = paste(as.Date(houseData$Date), houseData$Time)
  houseData$DateTime = as.POSIXct(dateTime)
  
  ## Create a line plot (and then add two more lines)
  png("plot3.png", width=480, height=480)
  plot(houseData$DateTime,houseData$Sub_metering_1,col="black",
       type="l",ylab = "Energy sub metering", xlab = "")
  lines(houseData$DateTime,houseData$Sub_metering_2,col="red")
  lines(houseData$DateTime,houseData$Sub_metering_3,col="blue")
  
  ## Add the legend
  legend("topright",
         col=c("black", "red", "blue"),
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=1, lwd=1)
  
  ## Shut off the device
  dev.off()
}
