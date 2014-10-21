
# setwd("D:/Coursera/4. Exploratory Data Analysis (Exdata-004)/Code/Project 2/ExData-Peer_Assgnment2/Data/")
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")
# setwd("D:/Coursera/4. Exploratory Data Analysis (Exdata-004)/Code/Project 2/ExData-Peer_Assgnment2/")
# dir()

# Aggregate by sum the total emissions by year

require(dplyr)
library(ggplot2)
# install.packages("gridExtra")
library(gridExtra)


# Leave only emissions from coal combustion-related sources
filtered_Coal_Combusion <- SCC[grepl("Fuel Comb.*Coal", SCC$EI.Sector),]$SCC
NEI_Col_Comb <- NEI[NEI$SCC %in% filtered_Coal_Combusion,]


ggp <- ggplot(
            NEI_Col_Comb,
            aes(factor(year),
            Emissions/1000)) +
  geom_bar(stat="identity", fill="darkgreen", alpha = .75, ymin=0) +
  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (000' tons)"))



pp <- qplot(year, Emissions, data=combustionNEI, geom=c("smooth"), method="lm", ylab=expression("Average amt. of PM"[2.5]*" emitted, in tons"))

grid_ggp_n_pp <- grid.arrange(ggp, pp, ncol=2, main = "PM2.5 Coal Combustion Source Emissions Across US from 1999-2008")

dev.copy(png, file="plot4.png", height=480, width=480, bg="transparent")
dev.off()