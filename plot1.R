## Read the data

hhdataFile <- "household_power_consumption.txt"
hhdata <- read.table(hhdataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## Take the subset of only 1/2/2007 and 2/2/2007

hhdata_used <- hhdata[hhdata$Date %in% c("1/2/2007","2/2/2007"), ]

## Give data the proper type (numeric)

Glob_act_pow <- as.numeric(hhdata_used$Global_active_power)

## Define the plot as a png of weight and height 480

png("plot1.png",width = 480, height = 480)

## Make the correct plot

hist(Glob_act_pow, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

## Close off the call to png

dev.off()

