## reading data
data <- readRDS("./data/summarySCC_PM25.rds")

## checking for missing values
sapply(data,function(x) sum(is.na(x)))

## subsetting
baltimore <- subset(data,data$fips=="24510")

## plotting and creating png file
p <- aggregate(Emissions ~ year,data = baltimore,FUN = sum)
plot(p,type = "o",main = "PM2.5 Emissions : BALTIMORE",xlab = "Year")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
