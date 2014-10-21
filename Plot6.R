
# setwd("D:/Coursera/4. Exploratory Data Analysis (Exdata-004)/Code/Project 2/ExData-Peer_Assgnment2/Data/")
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")
# setwd("D:/Coursera/4. Exploratory Data Analysis (Exdata-004)/Code/Project 2/ExData-Peer_Assgnment2/")
# dir()

# Aggregate by sum the total emissions by year

require(dplyr)
require(ggpolt2)

# Leave only relevant records
NEI_BM_n_LA_OnRoad <- filter(NEI, fips=="24510" | fips=="06037", type=="ON-ROAD")

# Rename codes into city names.
# Could be done trough factors but too lazy
NEI_BM_n_LA_OnRoad <- mutate(NEI_BM_n_LA_OnRoad, City = ifelse(fips=="06037", "Los Angeles County, CA", "Baltimore City, MD"))


# Make summaries
gbEmmision_by_Year_BM_LA_OnR <-
  sum_table <- select(NEI_BM_n_LA_OnRoad ,Emissions, year,City) %>%
    group_by(year,City) %>%
      summarize(Emissions_Sm = sum(Emissions))


ggplot(
      gbEmmision_by_Year_BM_LA_OnR,
      aes(factor(year),
      fill=City,
      Emissions_Sm)) +
  facet_grid(scales="free", space="free", .~City) +
  geom_bar(stat="identity", aes(fill=City), colour = "gray50", alpha = .75, ymin=0) +
  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (tons)")) +
  labs(title=expression("PM"[2.5]*" Emissions, Vehicles, Baltimore City 1999-2008"))


dev.copy(png, file="plot6.png", height=480, width=480, bg="transparent")
dev.off()