source("readData.R")
##The assumption is the the name of a coal-combustion source contains
##both the strings "coal" and "comb" (case-insensitively)
matches<-grep("(?=.*[cC]oal)(?=.*[cC]omb)",SCC$Short.Name, perl = TRUE,value=T)
ofUse<-SCC%>%filter(Short.Name %in% matches)


codesOfUse<-ofUse$SCC
obsRelatedToCoalAndCombustion<-NEI%>%filter(SCC %in% codesOfUse)

yearlyEmissionsRelatedToCoalAndCombustion<-obsRelatedToCoalAndCombustion%>%group_by_(~year)%>%summarize_(Total_Emissions = ~sum(Emissions) )

png("plot4.png")
with(yearlyEmissionsRelatedToCoalAndCombustion,plot(year,Total_Emissions,main="Total PM2.5 Emissions related to Coal Combustion\n in 1999,2002,2005 and 2008",xlab="Year",ylab="Total PM2.5 Emmissions (tons)",type="l"))
with(yearlyEmissionsRelatedToCoalAndCombustion,points(year,Total_Emissions,pch=19))
dev.off()
