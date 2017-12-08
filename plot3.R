#James' EDA project 1 third plot using the UCI Irving Machine Learning Repo
#Get the data loaded (it's a 129MB file so give it a sec

dataFile <- "./data/household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
# Isolate the dates we want to consider
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

#str(subSetData) Use this to take a look at the resulting subset's structure
# Convert dates and times to desired format
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
globalActivePower <- as.numeric(subSetData$Global_active_power) 
subMetering1 <- as.numeric(subSetData$Sub_metering_1) 
subMetering2 <- as.numeric(subSetData$Sub_metering_2) 
subMetering3 <- as.numeric(subSetData$Sub_metering_3) 

# Create our plot with the subMetering included
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, subMetering2, type="l", col="red") 
lines(datetime, subMetering3, type="l", col="blue") 
#Include legend for ease of use
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 
#Save plot to file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()