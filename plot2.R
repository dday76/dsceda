plot2 <- function() {
    # Have total emissions from PM2.5 decreased in the Baltimore City, 
    # Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 
    # to 2008? Use the base plotting system to make a plot answering this question.
    
    # We'll just reuse plot1 code but first subset for the BC,M fips.
    
    nei <- readRDS("summarySCC_PM25.rds")
    scc <- readRDS("Source_Classification_Code.rds")
    
    nei <- nei[nei$fips=="24510",] # baltimore only
    
    neisum <- aggregate(nei$Emissions,list(years=as.numeric(nei$year)),sum)
    
    png("plot2.png")
    par(mfcol=c(1,1)) # sets 1x1 just in case something else changed it.
    
    plot(neisum$years,neisum$x) # aggregate rnames emissions as x
    
    dev.off()
    
}