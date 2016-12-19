# Explore Emissions Data
This file explains what is in the repository and the purpose of the files.
The code file itself has additional commentary.
Note units of pm2.5 are in tons and time period is full year.

## Note on plots
I presented the most descriptive plot in my opinion. The assignment seemed to call
for a single plot, though viewing several was generally a good idea for each question.
I tried to keep it simple in terms of analysis and presentation, so just one plot per answer.
But see below in the readme Q&A for more specific answers if you're considering points.

## Files
* raw data, source and summary .RDS files
* plot code and image in the format plot1.R and plot1.png
* this readme file

See inline comments in code for step by tp, as well as Q&A below

## Assignment Questions & Answers

#1 
Q: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
Base plot total of all source emmissions by year (there are only 5 years in the set)<br />
A: We'll use aggregate to get the total by year.
Note the instructions did not say to plot 'well', and these are exploratory plots, so it's just a base.
The plot shown clearly indicates a downward trend of the overall total.
#2
Q: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? <br />
A: We'll just reuse plot1 code with additional baltimore subset.
This shows an uncertain trend, dwn from 1999 to 2002, up in 2005, and then down in 2008.
The overall trend is down, with 2005 seeming to be an outlier, and obviously 2008<1999.
#3
Q: Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.<br />
A: ggplot is required, but we can still start with the initial baltimore subset code from plot2.
the chart indicates an increase in point emissions but decreases in the other 3.
#4
Q: Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008? Use plot 1 with subset for coal source only.<br />
A: I read 'coal source' as EI.Sector ending in coal (Coal$).
Coal emissions have been decreasing but eratic (plot shown).
Deeper dive (not shown), Show Electric Generation is the main SCC.Level.Two contributor.
Also, there are limited complete trends (1999-2008) for fips and Short.Name to work find 
meaningful underlying trends.
#5
Q: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?<br />
A: Use plot 2 wih subset for motor vehicles; type="ON-ROAD".
Motor Vehicles maps to type onroad, short name highway veh, and EI sector mobile - on road. Seems consistent with various data elements.
The trend is down over the years, dropping from 350 in 1999 to 100 in 2008.
#6
Q: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions? Show 1999 & 2008 points for BC and LA with line.<br />
Q: LA showed a greater total change than Baltimore, but on 1000s of PM2.5.
Baltimore showed a similar change within its range but only on 10s of PM2.5.
Totals aren't shown, but that can be seen with an aggregate plot (see in-line comments).
If that's important, LA trended upward to 2005 then down in 2008, while Baltimore trended downward over the range.
