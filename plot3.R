mydata <- NEI[NEI$fips == "24510",]

png(filename = "C:/Users/Mooha/Desktop/Coursera2/plot3.png",width = 480,height = 480)
ggplot(mydata,aes(x=year,y=Emissions,colour=type))+geom_smooth(method = "loess", se=F)
dev.off()