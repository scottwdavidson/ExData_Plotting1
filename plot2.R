## ******************
## plot2.R
## ******************
plot2 <- function() {
  
  ## Read the data in via read.table
  houseData <- read.table("../household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)
  
  ## Convert the Date column to a Date type
  houseData$Date = as.Date(houseData$Date, format="%d/%m/%Y")
  
  ## Remove everything but Feb 01 and Feb 02
  dateRange = as.Date(c("01/02/2007", "02/02/2007"), "%d/%m/%Y")
  houseData = subset(houseData, Date %in% dateRange)

  ## Combine the Data & Time columns into a new DateTime and convert to POSIXlt (Date)
  dateTime = paste(as.Date(houseData$Date), houseData$Time)
  houseData$DateTime = as.POSIXct(dateTime)
    
  ## Create a line plot
  png("plot2.png", width=480, height=480)
  plot(houseData$DateTime,houseData$Global_active_power,
       type="l", xlab="",ylab="Global Active Power (kilowatts)")
  
  ## Shut off the device
  dev.off()
}
