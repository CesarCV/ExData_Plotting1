##### Plot 2 - Exploratory Data Analysis Course Project 1

#Cargando la información
#The database has to be in the same folder with the script

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
str(data)
table(data$Date)

data_analisis <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Variable type
data_analisis$Date_time <- strptime(paste(data_analisis$Date, data_analisis$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data_analisis$Global_active_power <- as.numeric(data_analisis$Global_active_power)
data_analisis$Sub_metering_1 <- as.numeric(data_analisis$Sub_metering_1)
data_analisis$Sub_metering_2 <- as.numeric(data_analisis$Sub_metering_2)
data_analisis$Sub_metering_3 <- as.numeric(data_analisis$Sub_metering_3)

str(data_analisis)

plot(data_analisis$Date_time, data_analisis$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data_analisis$Date_time, data_analisis$Sub_metering_2, type="l", col="red")
lines(data_analisis$Date_time, data_analisis$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))



png("plot3.png", width=480, height=480)
plot(data_analisis$Date_time, data_analisis$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data_analisis$Date_time, data_analisis$Sub_metering_2, type="l", col="red")
lines(data_analisis$Date_time, data_analisis$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
