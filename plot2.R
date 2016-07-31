## Read the data

hhdataFile <- "household_power_consumption.txt"
hhdata <- read.table(hhdataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## Take the subset of only 1/2/2007 and 2/2/2007

hhdata_used <- hhdata[hhdata$Date %in% c("1/2/2007","2/2/2007"), ]

## Give data the proper type (numeric, date etc)

Glob_act_pow <- as.numeric(hhdata_used$Global_active_power)
dt <- strptime(paste(hhdata_used$Date, hhdata_used$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Define the plot as a png of weight and height 480

png("plot2.png",width = 480, height = 480)

## Make the correct plot

plot(dt, Glob_act_pow, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Close off the call to png

dev.off()

## NB the day names in my plot are Dutch, because my computer has Dutch settings
