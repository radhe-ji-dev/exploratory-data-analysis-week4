setwd("D:/R FILES/exploratory data analysis week 4")
NEI<- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds")

vehicle.scc <- SCC[grep("[Vv]eh", SCC$Short.Name), ]

emissions.motor.baltimore <- NEI %>% 
  subset(fips == "24510" & NEI$SCC %in% vehicle.scc$SCC) %>%
  merge(y = vehicle.scc, by.x = "SCC", by.y = "SCC") %>%
  group_by(year) %>%
  summarize(Vehicle.Emissions.Type = sum(Emissions, na.rm = TRUE))

emissions.motor.baltimore.plot <- ggplot(emissions.motor.baltimore, aes(year, Vehicle.Emissions.Type)) +
  geom_point(color = "red", 
             size = 4, 
             alpha = 1/3) + 
  xlab("Year") +
  ylab("Total Emissions [Tons]") +
  ggtitle("Total Annual Vehicle Emissions in Baltimore City")

emissions.motor.baltimore.plot