setwd("D:/R FILES/exploratory data analysis week 4")
NEI<- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds")

tot.emissions.type <- NEI %>% 
  subset(fips == "24510") %>%
  group_by(year, type) %>%
  summarize(Total.Emissions.Type = sum(Emissions, na.rm = TRUE))

emissions.type <- ggplot(data = tot.emissions.type, aes(year, Total.Emissions.Type))

emissions.type <- emissions.type + 
  geom_point(color = "red", 
             size = 4, 
             alpha = 1/3) + 
  facet_grid(. ~ type) +
  xlab("Year") +
  ylab("Total Emissions [Tons]") +
  ggtitle("Total Annual Emissions in Baltimore by Year")

emissions.type


