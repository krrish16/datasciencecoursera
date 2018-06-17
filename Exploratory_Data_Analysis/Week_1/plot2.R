##reading data

data <- read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
#head(data)

##subsetting data
sub_data <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")
date_time <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##plotting

plot(date_time, as.numeric(sub_data$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()