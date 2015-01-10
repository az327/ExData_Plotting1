require("utils")
require("grDevices")

#download file if not in working directory
if(!file.exists("household_power_consumption.txt")){
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}


file<-"./household_power_consumption.txt"


data<-read.table(file,header=TRUE,sep = ";",na.strings="?") #read data
par(mfrow=c(1,1)) #set 1x1 chart parameter
data$Date<-as.Date(data$Date,"%d/%m/%Y") #format date column
datesub<-which(data$Date=="2007-02-01"| data$Date=="2007-02-02") #get subset containing two dates
#make histogram
hist(data[datesub,"Global_active_power"],xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power",xlim=range(0,6))
#display histogram as png
png(filename="plot1.png")
dev.copy(png, file="plot1.png")
dev.off()