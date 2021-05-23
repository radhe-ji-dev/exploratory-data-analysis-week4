NEI<- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds")

tot.emissions.baltimore <- NEI %>%
  subset(fips == "24510") %>%
  group_by(year) %>%
  summarize(Total.Emissions.Baltimore = sum(Emissions, 
                                            na.rm = TRUE))

with(tot.emissions.baltimore, 
     plot(x = year, 
          y = Total.Emissions.Baltimore, 
          ylab = "Total Annual Emissions [Tons]", 
          xlab = "Year",
          main = "Total Annual Emissions in Baltimore by Year",
          cex = 2,
          pch = 3,
          col = "red",
          lwd = 3))
