## reading data
data <- readRDS("./data/summarySCC_PM25.rds")

library(ggplot2)
Balt_la <- subset(data,data$fips=="24510" | data$fips=="06037" & data$type=="ON-ROAD")
p <- aggregate(Emissions ~ year + fips, Balt_la, sum)


## plotting
png("plot6.png", width=1040, height=480)
g <- ggplot(p, aes(factor(year), Emissions))+facet_grid(. ~ fips)+geom_bar(stat="identity")+ggtitle('PLOT 6 : ONROAD EMISSIONS BALTIMORE AND LA')+xlab("year")+ylab("Emissions")
print(g)
dev.off()
