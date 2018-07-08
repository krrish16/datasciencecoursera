## reading data
data <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(ggplot2)
coal <- SCC[grepl("Coal", SCC$Short.Name), ]
coal_data <- data[data$SCC %in% coal$SCC, ]
p <- aggregate(Emissions ~ year, coal_data, sum)

## plot
png("plot4.png")
g <- ggplot(p, aes(factor(year), Emissions)) + geom_bar(stat="identity") + ggtitle('PLOT 4 : COAL EMISSIONS') + xlab("year") + ylab("Emissions")
print(g)
dev.off()