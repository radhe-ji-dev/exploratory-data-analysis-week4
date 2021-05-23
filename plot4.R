NEI<- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds")

SCC.coal.comb <- SCC[grep("[Cc]oal",SCC$EI.Sector),]
NEI.sub.coal <- subset(NEI, 
                       NEI$SCC %in% SCC.coal.comb$SCC)


NEI.coal.comb <- merge(x = NEI.sub.coal, 
                       y = SCC, 
                       by.x = "SCC", 
                       by.y = "SCC")

NEI.coal.comb.tot <- NEI.coal.comb %>% 
  group_by(year) %>%
  summarize(Total.Coal.Comb = sum(Emissions, na.rm = TRUE))

NEI.coal.comb.plot <- ggplot(NEI.coal.comb.tot, aes(year, Total.Coal.Comb))

NEI.coal.comb.plot <- NEI.coal.comb.plot + 
  geom_point(color = "red", 
             size = 4, 
             alpha = 1/3) + 
  xlab("Year") +
  ylab("Total Emissions [Tons]") +
  ggtitle("Total Annual Coal Combustion Emissions in the US")

NEI.coal.comb.plot