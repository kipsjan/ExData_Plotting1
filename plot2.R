data <- read.table("./data/household_power_consumption.txt", header = T,sep = ";", na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
fdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
fdata$datetime <- strptime(paste(fdata$Date, fdata$Time), "%Y-%m-%d %H:%M:%S")

par(mfcol = c(1,1))
plot(fdata$datetime,fdata$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l", cex.lab = 0.9)

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
