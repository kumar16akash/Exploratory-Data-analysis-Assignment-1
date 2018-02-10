##----------------------------------------------------------------------
library(dplyr)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 

download.file(url, destfile = "data.rar")  ## Getting the raw data
unzip("data.rar") 

plot_data <- read.table("household_power_consumption.txt",header = T,stringsAsFactors = F,sep = ";") ## Storing the data in plot_data variable

plot_data <- filter(plot_data,Date %in% c("1/2/2007","2/2/2007"))  ## Selection of Data corresponding to these dates only

plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power) ## Converting the variable into numeric class
 
##----------------------------------------------------------------- Above common steps taken down from plot 1

plot_data$Date_Time <- strptime(paste(plot_data$Date, plot_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ## Adding Date_Time variable 

png("plot2.png", width = 480, height = 480)

plot(plot_data$Date_Time, plot_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()