## reading data
data <- readRDS("./data/summarySCC_PM25.rds")

## checking for missing values
sapply(data,function(x) sum(is.na(x)))

## plotting and creating png file
p <- aggregate(Emissions ~ year,data = data,FUN = sum)
plot(p,type = "o",main = "PLOT 1 : EMISSIONS BY YEAR",xlab = "Year")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
