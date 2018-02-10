library(dplyr)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 

download.file(url, destfile = "data.rar")  ## Getting the raw data
unzip("data.rar") 

plot_data <- read.table("household_power_consumption.txt",header = T,stringsAsFactors = F,sep = ";") ## Storing the data in plot_data variable

plot_data <- filter(plot_data,Date %in% c("1/2/2007","2/2/2007"))  ## Selection of Data corresponding to these dates only

plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power) ## Converting the variable into numeric class

png("Plot1.png", width = 480, height = 480)

hist(plot_data$Global_active_power, col = "red", xlab = "Global active power (Kilowatts)", ylab = "Frequency", main = "Global Active Power",font.lab=2) ## Plotting the histgram

dev.off() 