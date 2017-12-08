#James' EDA project 1 second plot using the UCI Irving Machine Learning Repo
#Get the data loaded (it's a 129MB file so give it a sec

dataFile <- "./data/household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
# Isolate the dates we want to consider
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

#str(subSetData) Use this to take a look at the resulting subset's structure
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
#We can use globalActivePower again, just like in the first plot
globalActivePower <- as.numeric(subSetData$Global_active_power) 
#Create our plot with labels 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
#Save plot2 to file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off() 
