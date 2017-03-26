# Read in File
setwd("./Coursera DS4/Peer 1")
power <- read.csv(file="household_power_consumption.txt",
                  header=TRUE, sep=";", na.strings="?",
                  colClasses = c(rep("character",2),rep("numeric",7)))

#Convert Date Strings to POSIX Dates
power$Datetime<-strptime(with(power, paste(Date, Time)),
                         format='%d/%m/%Y %H:%M:%S')

#Subset for Dates to Analyze
power <- subset(power,Datetime >= "2007-02-01 00:00:00" & Datetime <=  "2007-02-02 23:59:59")

#Turn on the png Graphics Device
png(filename="plot3.png")

#Generate Plot
plot(power$Datetime,power$Sub_metering_1, col="black",
     type="l", xlab="", ylab="Energy sub metering")
lines(power$Datetime,power$Sub_metering_2, col="red",
      type="l")
lines(power$Datetime,power$Sub_metering_3, col="blue",
      type="l")
legend("topright",
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),lwd=c(2,2,2),col=c("black", "red", "blue"))
#Turn off the png Graphics Device
dev.off()