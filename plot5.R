source("readData.R")
##The assumption is EI.sector field of a motor vehicle source contains
##the string "vehicle" (case-insensitively)
matches<-grep("[vV]ehicle",SCC$EI.Sector,value=T)
ofUse<-SCC%>%filter(EI.Sector %in% matches)

codesOfUse<-ofUse$SCC
obsRelatedToMotorVehicles<-NEI%>%filter(SCC %in% codesOfUse)

obsRelatedToBaltimore<-obsRelatedToMotorVehicles%>%filter(fips=="24510")

yearlyBaltimoreMotorVehicleEmissions<-obsRelatedToBaltimore%>%group_by_(~year)%>%summarize_(Total_Emissions = ~sum(Emissions))

png("plot5.png")
with(yearlyBaltimoreMotorVehicleEmissions,plot(year,Total_Emissions,type="l",xlab="Year",ylab="Aggregate PM2.5 Emissions (tons)",main="Yearly PM2.5 Emissions in Baltimore from Motor Vehicle Sources"))
with(yearlyBaltimoreMotorVehicleEmissions,points(year,Total_Emissions,pch=19))
dev.off()