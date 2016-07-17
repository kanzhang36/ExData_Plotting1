## Exploratory Data Analysis Project 1
## Plot4.R

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

# 4th plot
datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(data$Global_active_power~datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(data$Voltage~datetime, type="l", ylab="Voltage (volt)", xlab="")
plot(data$Sub_metering_1~datetime, type="l", col = "black", ylab="Global Active Power (kilowatts)", xlab="")
lines(data$Sub_metering_2~datetime,col='red')
lines(data$Sub_metering_3~datetime,col='blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$Global_reactive_power~datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")

dev.copy(png, file = "plot4.png", height = 600, width = 600)
dev.off()