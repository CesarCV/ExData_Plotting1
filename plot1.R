##### Plot 1 - Exploratory Data Analysis Course Project 1

#Cargando la información
#The database has to be in the same folder with the script

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
str(data)
table(data$Date)

data_analisis <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

data_analisis$Global_active_power <- as.numeric(data_analisis$Global_active_power)

hist(data_analisis$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

png("plot1.png", width=480, height=480)
hist(data_analisis$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()