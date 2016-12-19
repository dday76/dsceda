plot1 <- function() {
    # Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
    # Using the base plotting system, make a plot showing the total 
    # PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

    # We'll import the data, use aggregate to find sums by year, then plot.
    # This isn't a pretty plot, but it doesn't have to be, the trend is clear.
    
    nei <- readRDS("summarySCC_PM25.rds")
    scc <- readRDS("Source_Classification_Code.rds")
    
    neisum <- aggregate(nei$Emissions,list(years=as.numeric(nei$year)),sum)
    
    png("plot1.png")
    par(mfcol=c(1,1)) # sets 1x1 just in case something else changed it.
    
    plot(neisum$years,neisum$x) # aggregate rnames emissions as x

    dev.off()
}