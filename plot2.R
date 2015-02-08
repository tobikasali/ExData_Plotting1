vars <- c("character", "character", rep("numeric", 7))
data <- read.table("household_power_consumption.txt", h=1, sep=";", colClasses=vars, na.strings="?")


my_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#my_plot_data <- subset(my_data, Global_active_power != "?", select = c(1,2,3))
my_data$Global_active_power  <- as.numeric(as.character(my_data$Global_active_power))
datetime <- strptime(paste(my_plot_data$Date, my_plot_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")



png("plot2.png", width=480, height=480)
plot(datetime, my_plot_data$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)", axes=T, ann=T)
dev.off()


