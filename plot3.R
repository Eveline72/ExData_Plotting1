## Read the data

hhdataFile <- "household_power_consumption.txt"
hhdata <- read.table(hhdataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## Take the subset of only 1/2/2007 and 2/2/2007

hhdata_used <- hhdata[hhdata$Date %in% c("1/2/2007","2/2/2007"), ]

## Give data the proper type (numeric, date etc)
Glob_act_pow <- as.numeric(hhdata_used$Global_active_power)
dt <- strptime(paste(hhdata_used$Date, hhdata_used$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
subM1 <- as.numeric(hhdata_used$Sub_metering_1)
subM2 <- as.numeric(hhdata_used$Sub_metering_2)
subM3 <- as.numeric(hhdata_used$Sub_metering_3)

## Define the plot as a png of weight and height 480

png("plot3.png",width = 480, height = 480)

## Make the correct plot

plot(dt, subM1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(dt, subM2, type = "l", col = "red")
lines(dt, subM3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))

## Close off the call to png

dev.off()
