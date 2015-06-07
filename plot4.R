## this file does ...
# 1. Read data into R
# 2. Change date and time format
# 3. Plot and save data

# 1. Load file into R
file <- "household_power_consumption.txt"
data <- read.table(file, sep=";", header=TRUE, na.strings="?")

#subset data for relevant days 2007-02-01 and 2007-02-02
data <- data[grep("^1/2/2007$|^2/2/2007$",data$Date),]

# 2. Change date and time format
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# 3. Plot and save data
#set layout
par(mfcol=c(2,2))

#make plot in top left
plot(data$Date,data$Global_active_power, type="l",ylab="Global Active Power",xlab="")


#make plot in top left, legend border not visible, legend font adjusted
plot(data$Date,data$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(data$Date,data$Sub_metering_2, type="l", col="red")
lines(data$Date,data$Sub_metering_3, type="l", col="blue")
legend("topright", box.lwd=0, legend=names(data[7:9]), lty=1, col=c("black","red","blue"), cex=0.7)

#make plot in top right
plot(data$Date,data$Voltage, type="l",ylab="Voltage",xlab="datetime")

#make plot in top right
plot(data$Date,data$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")

#copy graphic device to file
dev.copy(png,file="plot4.png")
dev.off()

