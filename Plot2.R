
# setwd("D:/Coursera/4. Exploratory Data Analysis (Exdata-004)/Code/Project 2/ExData-Peer_Assgnment2/Data/")
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")
# setwd("D:/Coursera/4. Exploratory Data Analysis (Exdata-004)/Code/Project 2/ExData-Peer_Assgnment2/")
# dir()

# Aggregate by sum the total emissions by year

require(dplyr)

NEI_Baltimore <- filter(NEI, fips=="24510")


gbEmmision_by_Year_BM <-
  sum_table <- select(NEI_Baltimore,Emissions, year) %>%
    group_by(year) %>%
      summarize(Emissions_Sm = sum(Emissions))


with(gbEmmision_by_Year_BM, {
  barplot(
    (Emissions_Sm),
    names.arg=year,
    xlab="Year",
    ylab="PM2.5 Emissions (in tons)",
    main="Total PM2.5 Emissions in Baltimore City"
    )})

rm(NEI_Baltimore,gbEmmision_by_Year_BM)

dev.copy(png, file="plot2.png", height=480, width=480, bg="transparent")
dev.off()