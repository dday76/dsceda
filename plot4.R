plot4 <- function() {
    # Across the United States, how have emissions from coal combustion-related
    # sources changed from 1999–2008?
    
    # We can start with plot1 approach, but we're subsetting by coal.
    # requires library(lattice)
    
    nei <- readRDS("summarySCC_PM25.rds")
    scc <- readRDS("Source_Classification_Code.rds")
    
    scccoal <- scc[grep("Coal$",scc$EI.Sector),] # subset for coal SCC, only includes combustion
    neicoal <- nei[nei$SCC==scccoal$SCC,] # subset nei only for coal
    neicoal2 <- merge(neicoal,scccoal) # bring in scc data for faceting by=SCC default.
    
    #SCC Level Two seemed to be the interesting level of analysis
    
    neisum <- aggregate(Emissions~year,data=neicoal2,sum)
    plot4 <- qplot(year,Emissions,data=neisum,geom="line", main="Annual aggregates show erratic results")
    
    par(mfcol=c(1,1)) # sets 1x1 just in case something else changed it.
    png("plot4.png")

    print(plot4)
    
    dev.off()
}