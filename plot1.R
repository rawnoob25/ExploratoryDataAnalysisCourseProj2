source("readData.R")

if(!require(dplyr)){
  install.packages("dplyr")
  library(dplyr)
}

if(!require(magrittr)){
  install.packages("magrittr")
  library(magrittr)
}


yearlyTotals<- NEI%>%group_by_(~year)%>%summarize_(Total_Emissions = ~sum(Emissions,na.rm=T) )
png("plot1.png")
par(mfrow=c(1,1))
with(yearlyTotals,plot(year,Total_Emissions,main="Total PM2.5 Emissions in 1999,2002,2005 and 2008",xlab="Year",ylab="Total PM2.5 Emmissions (tons)",type="l"))
with(yearlyTotals,points(year,Total_Emissions,pch=19))

dev.off()