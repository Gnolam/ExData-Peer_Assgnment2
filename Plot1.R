
# setwd("D:/Coursera/4. Exploratory Data Analysis (Exdata-004)/Code/Project 2/ExData-Peer_Assgnment2/Data/")
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")
# setwd("D:/Coursera/4. Exploratory Data Analysis (Exdata-004)/Code/Project 2/ExData-Peer_Assgnment2/")
# dir()

# Aggregate by sum the total emissions by year

require(dplyr)


gbEmmision_by_Year <-
#  filter(NEI, fips=="24510")  %>%
  sum_table <- select(NEI,Emissions, year) %>%
  group_by(year) %>%
  summarize(Emissions_Sm = sum(Emissions)/1000000)


with(gbEmmision_by_Year, {
  barplot(
    (Emissions_Sm),
    names.arg=year,
    xlab="Year",
    ylab="PM2.5 Emissions (in mil. Tons)",
    main="Total PM2.5 Emissions From All US Sources"
    )})

dev.copy(png, file="plot1.png", height=480, width=480, bg="transparent")
dev.off()