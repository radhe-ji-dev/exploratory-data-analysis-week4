
NEI<- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds")

tot.emissions.year <- NEI %>%  # Group by year and summarize total emissions across the board
  group_by(year) %>%
  summarize(Total.Emissions = sum(Emissions, na.rm = TRUE))

tot.emissions.year


with(tot.emissions.year, # plot data 
     plot(x = year, 
          y = Total.Emissions, 
          ylab = "Annual Emissions [Tons]", 
          xlab = "Year",
          main = "Total Annual Emissions in the US by Year",
          cex = 2,
          pch = 3,
          col = "red",
          lwd = 3))

