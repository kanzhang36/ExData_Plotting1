## Exploratory Data Analysis Project 1
## Plot2.R

# Download data
fileName <- "exdata%2Fdata%2Fhousehold_power_consumption"

if (!file.exists(fileName)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileURL, fileName, method="curl")
}  
if (!file.exists("household_power_consumption.txt")) { 
        unzip(fileName) 
}

# Load data
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)


# 2nd plot
datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))
plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()