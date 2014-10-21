
# setwd("D:/Coursera/4. Exploratory Data Analysis (Exdata-004)/Code/Project 2/ExData-Peer_Assgnment2/Data/")
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")
# setwd("D:/Coursera/4. Exploratory Data Analysis (Exdata-004)/Code/Project 2/ExData-Peer_Assgnment2/")
# dir()

# Aggregate by sum the total emissions by year

require(dplyr)
library(ggplot2)

NEI_Baltimore <- filter(NEI, fips=="24510")


ggplot(NEI_Baltimore,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  guides(fill=FALSE)+ facet_grid(.~type) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) +
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))


rm(NEI_Baltimore)

dev.copy(png, file="plot3.png", height=480, width=480, bg="transparent")
dev.off()