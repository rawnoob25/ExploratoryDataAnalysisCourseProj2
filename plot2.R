source("readData.R")
png("plot2.png")
par(mfrow=c(1,1))
baltimoreTotalEmissions<-NEI%>%filter(fips=="24510")%>%group_by_(~year)%>%summarize_(Total_Emissions = ~sum(Emissions,na.rm=T))
with(baltimoreTotalEmissions,plot(year,Total_Emissions,type="l",xlab="Year",ylab="Total PM2.5 Emmissions (tons)",main="Total PM2.5 Emissions in 1999,2002,2005 and 2008\n for Baltimore city"))
with(baltimoreTotalEmissions,points(year,Total_Emissions,pch=19))
dev.off()

