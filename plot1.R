#download file to r working directory
if(!file.exists("d:/rwork/exdata.zip"))
{
	download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","d:/rwork/exdata.zip")
}
setwd("d:/rwork")
#read data
exdata<-read.table(unz("exdata.zip",filename="household_power_consumption.txt"),header=TRUE,sep=";",na.strings="?")
head(exdata)
#extract data 1/2/2007 and 2/2/2007
subdata<-exdata[which(exdata$Date=='1/2/2007'|exdata$Date=='2/2/2007'),]
head(subdata)
#draw plot to png file
png("d:/rwork/plot1.png",width=480,height=480,units="px")
hist(subdata$Global_active_power,,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red", ylim=c(0,1200))
dev.off()