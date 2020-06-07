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
str(data_analisis)

plot(data_analisis$Date_time, data_analisis$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

png("plot2.png", width=480, height=480)
plot(data_analisis$Date_time, data_analisis$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
