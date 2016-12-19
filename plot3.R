plot3 <- function() {

    # Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
    # which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
    # Which have seen increases in emissions from 1999–2008? 
    # Use the ggplot2 plotting system to make a plot answer this question.

    # We can start with the plot2 baltimore data
    
    nei <- readRDS("summarySCC_PM25.rds")
    scc <- readRDS("Source_Classification_Code.rds")
    
    nei <- nei[nei$fips=="24510",] # baltimore only
    
    # Change neisum to aggregate emissions on year and type
    neisum <- aggregate(Emissions~year+type,data=nei,sum)
    
    # set plot destination
    png("plot3.png")
    par(mfcol=c(1,1)) # sets 1x1 just in case something else changed it.
    
    # a simple qplot is sufficient, and add color to show different types
    # exclude confidence intervales for clarity
    g <- qplot(year,Emissions,data=neisum,color=type)
    g <- g+geom_smooth(method="lm",se=FALSE)
    print(g)
    
    # close and write to file.
    dev.off()
    
}