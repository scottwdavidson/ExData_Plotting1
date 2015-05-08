## ******************
## plot1.R
## ******************
plot1 <- function() {
  
  ## Read the data in via read.table
  houseData <- read.table("houseSmall.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
  
  ## Combine the Data & Time columns into a new DateTime and convert to POSIXlt (Date)
  houseData$DateTime = strptime(paste(houseData$Date,houseData$Time,sep="-"),"%d/%m/%Y-%H:%M:%S")
  
  ## Create a histogram showing the frequency of the Global_active_power measurement
#   hist(houseData$Global_active_power,
#        main="Global Active Power",
#        xlab="Global Active Power (kilowatts)",
#        col="red")
  
  ## install.packages("ggplot2") ; library(ggplot2)
  
  ## Create a line plot
  plot(houseData$DateTime,houseData$Global_active_power,type="l")
}
