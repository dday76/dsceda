plot5 <- function() {
    # How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
    
    # We can start with the plot2 baltimore data
    # Then we'll subset for 'type='onroad'
    
    nei <- readRDS("summarySCC_PM25.rds")
    scc <- readRDS("Source_Classification_Code.rds")
    
    nei <- nei[nei$fips=="24510",] # baltimore only
    nei <- nei[nei$type=="ON-ROAD",]
    
    # Change neisum to aggregate emissions on year and type
    neisum <- aggregate(Emissions~year+type,data=nei,sum)
    
    # set plot destination
    png("plot5.png")
    par(mfcol=c(1,1)) # sets 1x1 just in case something else changed it.
    
    # a simple qplot is sufficient, and add color to show different types
    # exclude confidence intervales for clarity
    plot(neisum$year,neisum$Emissions,type="l")
    # close and write to file.
    dev.off()
    
}