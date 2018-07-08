## reading data
data <- readRDS("./data/summarySCC_PM25.rds")
library(ggplot2)

## subsetting
baltimore  <- subset(data,data$fips=="24510")

p <- aggregate(Emissions ~ year + type, baltimore, sum)

## plot
png("plot3.png", width=640, height=480)
g <- ggplot(p, aes(year, Emissions, color = type)) + geom_line() + ggtitle('PLOT 3 :DIFFERENT SOURCE EMISSIONS') + xlab("year") + ylab("Emissions")
print(g)
dev.off()