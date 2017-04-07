source("readData.R")
##The assumption is EI.sector field of a motor vehicle source contains
##the string "vehicle" (case-insensitively)
matches<-grep("[vV]ehicle",SCC$EI.Sector,value=T)
ofUse<-SCC%>%filter(EI.Sector %in% matches)

codesOfUse<-ofUse$SCC
obsRelatedToMotorVehicles<-NEI%>%filter(SCC %in% codesOfUse)

obsRelatedToBaltAndLA<-obsRelatedToMotorVehicles%>%filter(fips %in% c("24510","06037"))

yearlyMotorVehicleEmissionsForBaltAndLA<-obsRelatedToBaltAndLA%>%group_by_(~fips,~year)%>%summarize_(Total_Emissions = ~sum(Emissions))

library(ggplot2)

ggplot(data=yearlyMotorVehicleEmissionsForBaltAndLA,aes(x=year,y=Total_Emissions,col=fips))+geom_line()+geom_point()

ggsave("plot6.png")