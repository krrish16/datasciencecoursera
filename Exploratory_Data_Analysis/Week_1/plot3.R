##reading data

data <- read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
#head(data)

##subsetting data
sub_data <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")
date_time <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##plotting

plot(date_time, as.numeric(sub_data$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(date_time, as.numeric(sub_data$Sub_metering_2), type="l", col="red")
lines(date_time, as.numeric(sub_data$Sub_metering_3), type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
