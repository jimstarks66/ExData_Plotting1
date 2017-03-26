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
png(filename="plot1.png")

#Generate Histogram
hist(power$Global_active_power, col="red",
     main="Global Active Power",xlab="Global Active Power (kilowatts)")

#Turn off the png Graphics Device
dev.off()