NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
mydata <- NEI[NEI$fips == "24510",]
vehicleSource <- SCC[grepl("Vehicle", SCC$EI.Sector),]
mydata <- subset(mydata,mydata$SCC %in% vehicleSource$SCC)

png(filename = "C:/Users/Mooha/Desktop/Coursera2/plot5.png",width = 480,height = 480)

ggplot(mydata,aes(x=year,y=Emissions))+geom_smooth(method = "loess", se=F)
dev.off()