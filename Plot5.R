
# setwd("D:/Coursera/4. Exploratory Data Analysis (Exdata-004)/Code/Project 2/ExData-Peer_Assgnment2/Data/")
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")
# setwd("D:/Coursera/4. Exploratory Data Analysis (Exdata-004)/Code/Project 2/ExData-Peer_Assgnment2/")
# dir()

# Aggregate by sum the total emissions by year

require(dplyr)

NEI_Baltimore_OnRoad <- filter(NEI, fips=="24510", type=="ON-ROAD")

gbEmmision_by_Year_BM_OnR <-
  sum_table <- select(NEI_Baltimore_OnRoad ,Emissions, year) %>%
    group_by(year) %>%
      summarize(Emissions_Sm = sum(Emissions))

ggplot(
  gbEmmision_by_Year_BM_OnR,
  aes(factor(year),
      Emissions_Sm)) +
  geom_bar(stat="identity", fill="darkgreen", alpha = .75, ymin=0) +
  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (tons)")) +
  labs(title=expression("PM"[2.5]*" Emissions, Vehicles, Baltimore City 1999-2008"))


dev.copy(png, file="plot5.png", height=480, width=480, bg="transparent")
dev.off()