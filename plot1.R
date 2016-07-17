## Exploratory Data Analysis Project 1
## Plot1.R

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

# 1st plot
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
