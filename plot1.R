NEI <- readRDS("summarySCC_PM25.rds")

AmountOfyear1 <- NEI[NEI$year==1999,]$Emission
totalPMYear1 <- sum(AmountOfyear1)

AmountOfyear2 <- NEI[NEI$year==2002,]$Emission
totalPMYear2 <- sum(AmountOfyear2)

AmountOfyear3 <- NEI[NEI$year==2005,]$Emission
totalPMYear3 <- sum(AmountOfyear3)

AmountOfyear4 <- NEI[NEI$year==2008,]$Emission
totalPMYear4 <- sum(AmountOfyear4)

dataTograph <- data.frame(c(1999,2002,2005,2008),c(totalPMYear1,totalPMYear2,totalPMYear3,totalPMYear4))
names(dataTograph) <- c("Year","Total_Amount_of_PM2.5")

png(filename = "C:/Users/Mooha/Desktop/Coursera2/plot1.png",width = 480,height = 480)
plot(dataTograph$Year,dataTograph$Total_Amount_of_PM2.5,type = "b" , ylab = "Years", xlab = "Amount of PM2.5",col= "red")
dev.off()