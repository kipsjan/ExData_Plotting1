# Download dataset
if (!file.exists("./Data/EPC.zip")) 
{
    message("Downloading dataset")
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                  destfile = "./Data/EPC.zip", 
                  method = "auto",
                  mode = "wb")
    
    message("Extracting dataset")
    unzip("./Data/EPC.zip", 
          overwrite = FALSE, 
          exdir = "./Data")
    
}
    
if (!exists("data"))    
{
    data <- read.table("./data/household_power_consumption.txt", header = T,sep = ";", na.strings = "?")
    data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
    }
#filter data and store as fdata
fdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
fdata$datetime <- strptime(paste(fdata$Date, fdata$Time), "%Y-%m-%d %H:%M:%S")

#create plot
par(mfcol = c(1,1))
hist(fdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#write to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()