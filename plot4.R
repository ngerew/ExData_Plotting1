## Produce the third required plot for Exploratory Data Anaylsis, Project 1

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

## Construct and save Plot 4 as a PNG file
png("plot4.PNG", width = 480, height = 480)
par(mfrow = c(2,2))
with(data, {
        plot(datetime, Global_active_power, "l", xlab = "", 
             ylab = "Global Active Power")
        
        plot(datetime, Voltage, "l")
        
        plot(datetime, Sub_metering_1, "l", xlab = "", 
             ylab = "Energy sub metering")
        lines(datetime, Sub_metering_2, "l", col = "red")
        lines(datetime, Sub_metering_3, "l", col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               bty = "n", lty = 1, col = c("black", "red", "blue"))
        
        plot(datetime, Global_reactive_power, "l")
})
dev.off()