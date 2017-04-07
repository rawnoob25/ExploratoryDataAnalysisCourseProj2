source("readData.R")

baltimoreYearlyEmissionsByType<-NEI%>%filter(fips=="24510")%>%group_by_(~type,~year)%>%summarize_(Total_Emissions = ~sum(Emissions) )
non_road<-baltimoreYearlyEmissionsByType%>%filter(type=="NON-ROAD")
non_point<-baltimoreYearlyEmissionsByType%>%filter(type=="NONPOINT")
on_road<-baltimoreYearlyEmissionsByType%>%filter(type=="ON-ROAD")
point<-baltimoreYearlyEmissionsByType%>%filter(type=="POINT")
ggplot(data=baltimoreYearlyEmissionsByType,aes(x=year,y=Total_Emissions,col=type))+geom_point()+geom_line()+labs(title="Total Year PM2.5 Emissions in Baltimore City \n by type in 1999,2002,2005 and 2008")
ggsave("plot3.png")
