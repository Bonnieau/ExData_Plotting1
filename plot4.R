#download file to r working directory
if(!file.exists("d:/rwork/exdata.zip"))
{
	download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","d:/rwork/exdata.zip")
}
#read data
exdata<-read.table(unz("exdata.zip",filename="household_power_consumption.txt"),header=TRUE,sep=";",na.strings="?")
head(exdata)
#extract data 1/2/2007 and 2/2/2007
subdata<-exdata[which(exdata$Date=='1/2/2007'|exdata$Date=='2/2/2007'),]
head(subdata)
#convert Date and Time to Date/Time Class
mydt<-strptime(paste(subdata$Date, subdata$Time), format='%d/%m/%Y %H:%M:%S')
#draw plot to png file
png("d:/rwork/plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))
# draw 1st plot
plot(mydt, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
# draw 2nd plot
plot(mydt, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
# draw 3rd plot
plot(mydt, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",ylim=c(0,38),col="black")
lines(mydt,subdata$Sub_metering_2, type="l",col="red")
lines(mydt,subdata$Sub_metering_3, type="l",col="blue")
legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# draw draw 4th plot
plot(mydt, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
