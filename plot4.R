##### Plot 4 - Exploratory Data Analysis Course Project 1

#Cargando la información
#The database has to be in the same folder with the script

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
str(data)
table(data$Date)

data_analisis <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Variable type
data_analisis$Date_time <- strptime(paste(data_analisis$Date, data_analisis$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data_analisis$Global_active_power <- as.numeric(data_analisis$Global_active_power)
data_analisis$Global_reactive_power <- as.numeric(data_analisis$Global_reactive_power)
data_analisis$Voltage <- as.numeric(data_analisis$Voltage)
data_analisis$Sub_metering_1 <- as.numeric(data_analisis$Sub_metering_1)
data_analisis$Sub_metering_2 <- as.numeric(data_analisis$Sub_metering_2)
data_analisis$Sub_metering_3 <- as.numeric(data_analisis$Sub_metering_3)

str(data_analisis)

par(mfrow = c(2, 2)) 

plot(data_analisis$Date_time, data_analisis$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(data_analisis$Date_time, data_analisis$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data_analisis$Date_time, data_analisis$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data_analisis$Date_time, data_analisis$Sub_metering_2, type="l", col="red")
lines(data_analisis$Date_time, data_analisis$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(data_analisis$Date_time, data_analisis$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")



png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(data_analisis$Date_time, data_analisis$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(data_analisis$Date_time, data_analisis$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data_analisis$Date_time, data_analisis$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data_analisis$Date_time, data_analisis$Sub_metering_2, type="l", col="red")
lines(data_analisis$Date_time, data_analisis$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(data_analisis$Date_time, data_analisis$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
