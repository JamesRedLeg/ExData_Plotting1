#James' EDA project 1 first plot using the UCI Irving Machine Learning Repo
#Get the data loaded (it's a 129MB file so give it a sec)
dataFile <- "./household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
# Isolate the dates we want to consider
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

#str(subSetData) Use this to take a look at the resulting subset's structure
 
globalActivePower <- as.numeric(subSetData$Global_active_power) 
#Create the plot and save it to a Portable Network Graphic
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()