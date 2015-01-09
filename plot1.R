if(!file.exists("household_power_consumption.txt")){
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./household_power_consumption.txt")
  unzip("household_power_consumption.zip")
}

file<-"./household_power_consumption.txt"

data<-read.table(file,header=TRUE,sep = ";",na.strings="?")
par(mfrow=c(1,1))
data$Date<-as.Date(data$Date,"%d/%m/%Y")
datesub<-which(data$Date=="2007-02-01"| data$Date=="2007-02-02")
hist(data[datesub,"Global_active_power"],xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power",xlim=range(0,6))
png(filename="plot1.png")
dev.copy(png, file="plot1.png")
dev.off()