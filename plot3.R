## Read the data and set the col Classses to avoid factors.

vars <- c("character", "character", rep("numeric", 7))
data <- read.table("household_power_consumption.txt", h=1, sep=";", colClasses=vars, na.strings="?")

## Get the data based on the Dates.

my_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
datetime <- strptime(paste(my_data$Date, my_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 




png("plot3.png", width=480, height=480)
plot(datetime, my_data$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="", yaxt="n")
axis(2,at=seq(0,30, by =10),labels = seq(0,30 , by=10 ),lwd =2)
lines(datetime, my_data$Sub_metering_2, type="l", col="red")
lines(datetime, my_data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))


dev.off()

