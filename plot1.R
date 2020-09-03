download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "hpower.zip")##Download the database
unzip("hpower.zip")##unzip the file
power <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";") ##Read the file and make it a Data Frame
power_final <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007") ##Create a subset Data Frame from 1/2/2007 to 2/2/2007
power_final$Global_active_power <- as.numeric(power_final$Global_active_power) ## Make Global_active_Power numeric
png("plot1.png", width=480, height = 480)
hist(power_final$Global_active_power, col = "red", xlab = "Global active power (Kilowatts)", main = "Global Active Power")
dev.off()