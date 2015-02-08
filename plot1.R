vars <- c("character", "character", rep("numeric", 7))
data <- read.table("household_power_consumption.txt", h=1, sep=";", colClasses=vars, na.strings="?")


my_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

my_plot_data <- subset(my_data, Global_active_power != "?", select = c(1,2,3))

png(filename="plot1.png", height=480, width=480, 
    bg="white")

hist(as.numeric(as.character(my_data$Global_active_power)), col="red", ylim = c(0,1200), main="Global Active Power", xlab ="Global Active Power(kilowatts)")

dev.off()

