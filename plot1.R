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
hist(data$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()