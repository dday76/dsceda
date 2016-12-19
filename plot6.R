plot6 <- function() {
    
    # Baltimore vs LA Emissions (06037), motor vehicle
    # Which has seem greater changes?
    
    # We'll get Baltimore motor vehicle like plot 5 but also LA
    
    nei <- readRDS("summarySCC_PM25.rds")
    scc <- readRDS("Source_Classification_Code.rds")

    nei.mv <- nei[nei$type=="ON-ROAD",] # motor vehicles only
  
    nei.mv.ci <- subset(nei.mv,fips=="24510" | fips=="06037")
    # nei.mv.ci.sum <- aggregate(Emissions~year+fips,data=nei.mv.ci,sum)
    # Aggregate proved less useful, but does show true overall trend (same plot with sum)
    
    # set plot destination
    par(mfcol=c(1,1)) # sets 1x1 just in case something else changed it.
    png("plot6.png")
    
    # A lattice plot provides a good relative comparison on different scales
    # The very different pollution levels called for different scales
    # The similar overall change called for looking more closely at points.
    # The overlap called for some transparency to show point density.
        
    g <- xyplot(Emissions~year|fips, nei.mv.ci,scales=list(relation="free"),
           col=rgb(0,0,.7,0.5),pch=18,cex=2,
           main="LA greater total change than Balt. but very close relative change") 
    print(g)
    # close and write to file.
    dev.off()
    
}