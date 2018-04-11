NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
coalSource <- SCC[grepl("[Cc]oal", SCC$Short.Name),]
coalNEI <- subset(NEI, NEI$SCC %in% coalSource$SCC)


AmountOfyear1 <- coalNEI[coalNEI$year==1999,]$Emission
totalPMYear1 <- sum(AmountOfyear1)

AmountOfyear2 <- coalNEI[coalNEI$year==2002,]$Emission
totalPMYear2 <- sum(AmountOfyear2)

AmountOfyear3 <- coalNEI[coalNEI$year==2005,]$Emission
totalPMYear3 <- sum(AmountOfyear3)

AmountOfyear4 <- coalNEI[coalNEI$year==2008,]$Emission
totalPMYear4 <- sum(AmountOfyear4)

dataTograph <- data.frame(c(1999,2002,2005,2008),c(totalPMYear1,totalPMYear2,totalPMYear3,totalPMYear4))
names(dataTograph) <- c("Year","Total_Amount_of_coal_PM2.5")

png(filename = "C:/Users/Mooha/Desktop/Coursera2/plot4.png",width = 480,height = 480)
 
ggplot(dataTograph,aes(x=Year,y=Amount_of_coal_PM2.5))+geom_smooth(method = "loess", se=F)
dev.off()
