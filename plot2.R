require("utils")
require("grDevices")

if(!file.exists("household_power_consumption.txt")){
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}

file<-"./household_power_consumption.txt"

data<-read.table(file,header=TRUE,sep = ";",na.strings="?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$DateTime<-paste(data$Date,data$Time)
data$DateTime<-strptime(data$DateTime,format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(1,1))
datesub<-which(data$Date=="2007-02-01"| data$Date=="2007-02-02")
with(data[datesub,],plot(DateTime,Global_active_power,ylab="Global Active Power (kilowatts)", xlab="", type="l"))
png(filename="plot2.png")
dev.copy(png, file="plot2.png")
dev.off()
