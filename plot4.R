## Read the data

hhdataFile <- "household_power_consumption.txt"
hhdata <- read.table(hhdataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## Take the subset of only 1/2/2007 and 2/2/2007

hhdata_used <- hhdata[hhdata$Date %in% c("1/2/2007","2/2/2007"), ]

## Give data the proper type (numeric, date etc)
Glob_act_pow      <- as.numeric(hhdata_used$Global_active_power)
Glob_react_pow    <- as.numeric(hhdata_used$Global_reactive_power)
dt                <- strptime(paste(hhdata_used$Date, hhdata_used$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
subM1             <- as.numeric(hhdata_used$Sub_metering_1)
subM2             <- as.numeric(hhdata_used$Sub_metering_2)
subM3             <- as.numeric(hhdata_used$Sub_metering_3)
volt              <- as.numeric(hhdata_used$Voltage)

## Define the plot as a png of weight and height 480 and define that we will have 2x2 = 4 plots in this picture

png("plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))

## Make the correct plots  in the correct order

plot(dt, Glob_act_pow, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(dt,volt,type = "l", xlab = "datetime", ylab = "Voltage")

plot(dt, subM1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(dt, subM2, type = "l", col = "red")
lines(dt, subM3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))

plot(dt,Glob_react_pow, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

## Close off the call to png

dev.off()
