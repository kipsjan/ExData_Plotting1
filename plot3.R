#data <- read.table("./data/household_power_consumption.txt", header = T,sep = ";", na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
fdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
fdata$datetime <- strptime(paste(fdata$Date, fdata$Time), "%Y-%m-%d %H:%M:%S")

# Set locale for correct (US) weekdays abbreviation
Sys.setlocale("LC_TIME", "us")

#plot(png,"plot3.png", height=480, width=480)
par(mfcol = c(1,1))
plot(fdata$datetime,fdata$Sub_metering_1,ylab="Energy sub metering",xlab="",type="n")
points(fdata$datetime,fdata$Sub_metering_1,type="l")
points(fdata$datetime,fdata$Sub_metering_2,type="l",col="red")
points(fdata$datetime,fdata$Sub_metering_3,type="l",col="blue")
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,cex=0.6
       )

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
