if(!file.exists("household_power_consumption.txt")){
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./household_power_consumption.txt")
  unzip("household_power_consumption.zip")
}

file<-"./household_power_consumption.txt"

data<-read.table(file,header=TRUE,sep = ";",na.strings="?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$DateTime<-paste(data$Date,data$Time)
data$DateTime<-strptime(data$DateTime,format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(1,1))
datesub<-which(data$Date=="2007-02-01"| data$Date=="2007-02-02")
with(data[datesub,],plot(DateTime, Sub_metering_1, col="black",type="l",xlab="",ylab="Energy sub metering"))
with(data[datesub,],lines(DateTime, Sub_metering_2, col="red",type="l"))
with(data[datesub,],lines(DateTime, Sub_metering_3, col="blue",type="l"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),pch="-", lty=1,lwd=3)
png(filename="plot3.png")
dev.copy(png, file="plot3.png")
dev.off()
