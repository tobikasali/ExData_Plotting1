## Read the data and set the col Classses to avoid factors.

vars <- c("character", "character", rep("numeric", 7))
data <- read.table("household_power_consumption.txt", h=1, sep=";", colClasses=vars, na.strings="?")


my_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
datetime <- strptime(paste(my_data$Date, my_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Get the data based on the Dates.

png("plot4.png", width=480, height=480)
par(mfcol = c(2,2))


plot(datetime, my_data$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)", axes=T, ann=T)
#axis(2,at=seq(0,3000, by =1000),labels = seq(0,6 , by=2 ),lwd =2)
#box()



plot(datetime, my_data$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="", axes=T)
#axis(2,at=seq(0,30, by =10),labels = seq(0,30 , by=10 ),lwd =2)
lines(datetime, my_data$Sub_metering_2, type="l", col="red")
lines(datetime, my_data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))


plot(datetime, my_data$Voltage, type="l",xlab="datetime",ylab="Voltage", axes=T)
#axis(2,at=seq(800,2000, by =400),labels = seq(234,246,4),lwd=2)



plot(datetime, my_data$Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power", axes=T)
#rug(my_data$Global_reactive_power)
#axis(2,at=seq(0,250, by =50),labels = seq(0,0.5,0.1),lwd=2)



dev.off()