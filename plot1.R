## Produce the first required plot for Exploratory Data Anaylsis, Project 1

## Load and clean the data 
## Subset to use only dates 2007-02-01 and 2007-02-02.

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "electricConsumption.zip")
data <- read.table(unz("electricConsumption.zip", "household_power_consumption.txt"),
                   header = TRUE, sep = ";",
                   stringsAsFactors = FALSE )

data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
sampleDates <- (data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))

data <- data[sampleDates, ]
for (i in 3:9) {
        data[,i] <- as.numeric(data[,i])
}

## Construct and save Plot 1 as a PNG file
png("plot1.PNG", width = 480, height = 480)
hist(data$Global_active_power, col = "Red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()


