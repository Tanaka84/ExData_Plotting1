download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "hpower.zip")##Download the database
unzip("hpower.zip")##unzip the file
power <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";") ##Read the file and make it a Data Frame
power_final <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007") ##Create a subset Data Frame from 1/2/2007 to 2/2/2007
power_final$DateTime <- paste(power_final$Date, power_final$Time, sep = " ") ## Create new column Date + Time
power_final$DateTime <- strptime(power_final$DateTime, format = "%d/%m/%Y %H:%M:%S") ##Transform Date + Time to POSIXlt
power_final$Global_active_power <- as.numeric(power_final$Global_active_power) ## Transform Global_active_Power numeric
png("plot2.png", width=480, height = 480) ##Open PNG file
plot(power_final$DateTime, power_final$Global_active_power, type = "l", xlab = "", ylab  = "Global active power (Kilowatts)") ##create graph
dev.off() ## close PNG file