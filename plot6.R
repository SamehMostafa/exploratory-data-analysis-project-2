NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mydata <- NEI[NEI$fips == "24510" | NEI$fips=="06037",]
vehicleSource <- SCC[grepl("Vehicle", SCC$EI.Sector),]
mydata <- subset(mydata,mydata$SCC %in% vehicleSource$SCC)

mydata$city <- rep(NA, nrow(mydata))
mydata[mydata$fips == "24510", ][, "city"] <- "Baltimore City"
mydata[mydata$fips == "06037", ][, "city"] <- "Los Angeles County"

plotdata <- aggregate(mydata[c("Emissions")],list(city = mydata$city,year = mydata$year), sum)
png(filename = "C:/Users/Mooha/Desktop/Coursera2/plot6.png",width = 480,height = 480)
ggplot(plotdata,aes(x=year,y=Emissions,colour=city))+geom_smooth(method = "loess", se=F)
dev.off()