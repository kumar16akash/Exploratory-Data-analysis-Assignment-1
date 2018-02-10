##----------------------------------------------------------------------
library(dplyr)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 

download.file(url, destfile = "data.rar")  ## Getting the raw data
unzip("data.rar") 

plot_data <- read.table("household_power_consumption.txt",header = T,stringsAsFactors = F,sep = ";") ## Storing the data in plot_data variable

plot_data <- filter(plot_data,Date %in% c("1/2/2007","2/2/2007"))  ## Selection of Data corresponding to these dates only

plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power) ## Converting the variable into numeric class
 
##----------------------------------------------------------------- Above common steps taken down from plot 1

plot_data$Sub_metering_1 <- as.numeric(plot_data$Sub_metering_1)

plot_data$Sub_metering_2 <- as.numeric(plot_data$Sub_metering_2)

plot_data$Sub_metering_3 <- as.numeric(plot_data$Sub_metering_3)

png("Plot3.png",width = 480, height = 480)

plot(plot_data$Date_Time, plot_data$Sub_metering_1, type="l", xlab="", ylab="Global Active Power (kilowatts)")

lines(plot_data$Date_Time, plot_data$Sub_metering_2, col="red")

lines(plot_data$Date_Time, plot_data$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1.5, lwd=2, col = c("black", "red", "blue")) ## Adding the legend

dev.off()


