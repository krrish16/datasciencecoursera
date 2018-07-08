## reading data
data <- readRDS("./data/summarySCC_PM25.rds")

library(ggplot2)
onroad <- subset(data,data$fips=="24510" & data$type=="ON-ROAD")
p <- aggregate(Emissions ~ year, onroad, sum)

## plot
png("plot5.png", width=840, height=480)
g <- ggplot(p, aes(factor(year), Emissions))+ geom_bar(stat="identity")+ ggtitle('PLOT 5 : EMISSIONS ON ROAD')+ xlab("year") + ylab(" Emissions")
print(g)
dev.off()


