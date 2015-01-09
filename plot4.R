if(!file.exists("household_power_consumption.txt")){
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}

file<-"./household_power_consumption.txt"

data<-read.table(file,header=TRUE,sep = ";",na.strings="?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$DateTime<-paste(data$Date,data$Time)
data$DateTime<-strptime(data$DateTime,format="%Y-%m-%d %H:%M:%S")

datesub<-which(data$Date=="2007-02-01"| data$Date=="2007-02-02")
par(mfrow=c(2,2))
par(mar=c(5,4,2,2))
#plot global active power
with(data[datesub,],plot(DateTime,Global_active_power,ylab="Global Active Power (kilowatts)", xlab="", type="l"))
#plot voltage
with(data[datesub,],plot(DateTime,Voltage,xlab="datetime",ylab="Voltage",type="l"))
#plot energy sub meterings
with(data[datesub,],plot(DateTime, Sub_metering_1, col="black",type="l",xlab="",ylab="Energy sub metering"))
with(data[datesub,],lines(DateTime, Sub_metering_2, col="red",type="l"))
with(data[datesub,],lines(DateTime, Sub_metering_3, col="blue",type="l"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),pch="-", lty=1, bty="n",cex=.7)
#plot global reactive power
with(data[datesub,],plot(DateTime,Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime"))
png(filename="plot4.png")
dev.copy(png, file="plot4.png")
dev.off()