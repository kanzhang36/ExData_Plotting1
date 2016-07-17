## Exploratory Data Analysis Project 1
## Plot3.R

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

# 3rd plot
datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))
plot(data$Sub_metering_1~datetime, type = "l", col = "black", ylab = "Global Active Power (kilowatts", xlab = "")
lines(data$Sub_metering_2~datetime, col = "red")
lines(data$Sub_metering_3~datetime, col = "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 600, width = 600)
dev.off()