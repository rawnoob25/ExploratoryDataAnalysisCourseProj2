##reads the data
setwd("exdata_data_NEI_data/")
assign("NEI",readRDS("summarySCC_PM25.rds"),pos=.GlobalEnv)
assign("SCC",readRDS("Source_Classification_Code.rds"),pos=.GlobalEnv)
setwd("..")