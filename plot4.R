# James' EDA project 1 fourth plot using the UCI Irving Machine Learning Repo
# Get the data loaded (it's a 129MB file so give it a sec

dataFile <- "./data/household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
# Isolate the dates we want to consider
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

# str(subSetData) Use this to examine the structure if you want
# Convert dates to desired format
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
globalActivePower <- as.numeric(subSetData$Global_active_power) 
globalReactivePower <- as.numeric(subSetData$Global_reactive_power) 
voltage <- as.numeric(subSetData$Voltage) 
subMetering1 <- as.numeric(subSetData$Sub_metering_1) 
subMetering2 <- as.numeric(subSetData$Sub_metering_2) 
subMetering3 <- as.numeric(subSetData$Sub_metering_3) 

#Plot our other plots and make a new plot--> GlobalReactivePower 
par(mfrow = c(2, 2))  
# First plot as a line graph
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2) 
# Second plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage") 
# Third plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, subMetering2, type="l", col="red") 
lines(datetime, subMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o") 
 
# Here is the fourth plot 
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power") 
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off() 
