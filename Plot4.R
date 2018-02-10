##----------------------------------------------------------------------
library(dplyr)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 

download.file(url, destfile = "data.rar")  ## Getting the raw data
unzip("data.rar") 

plot_data <- read.table("household_power_consumption.txt",header = T,stringsAsFactors = F,sep = ";") ## Storing the data in plot_data variable

plot_data <- filter(plot_data,Date %in% c("1/2/2007","2/2/2007"))  ## Selection of Data corresponding to these dates only

plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power) ## Converting the variable into numeric class
 
##----------------------------------------------------------------- Above common steps taken down from plot 1

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2),margin=c(1,1,1,1))

##Plot 1
plot(plot_data$Date_Time, plot_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

##Plot 2
plot(plot_data$Date_Time, plot_data$Voltage, type="l", xlab="", ylab="Voltage")

## Plot 3
plot_data$Sub_metering_1 <- as.numeric(plot_data$Sub_metering_1)

plot_data$Sub_metering_2 <- as.numeric(plot_data$Sub_metering_2)

plot_data$Sub_metering_3 <- as.numeric(plot_data$Sub_metering_3)


plot(plot_data$Date_Time, plot_data$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")

lines(plot_data$Date_Time, plot_data$Sub_metering_2, col="red")

lines(plot_data$Date_Time, plot_data$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd=1, col = c("black", "red", "blue"))

##Plot 4
plot(plot_data$Date_Time, plot_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")

dev.off()