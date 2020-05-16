# read data file
household <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

# extract the rows corresponding to the two days
twodays <- household[(household$Date=="2/2/2007"|household$Date=="1/2/2007"),]

# convert the columns to numeric. Note that they must first be converted
# from factor to character and then from character to numeric. Trying to convert from factor
# to numeric directly will cause data errors!
twodays$Global_active_power <- as.numeric(as.character(twodays$Global_active_power))
twodays$Sub_metering_1 <- as.numeric(as.character(twodays$Sub_metering_1))
twodays$Sub_metering_2 <- as.numeric(as.character(twodays$Sub_metering_2))
twodays$Sub_metering_3 <- as.numeric(as.character(twodays$Sub_metering_3))
twodays$Voltage <- as.numeric(as.character(twodays$Voltage))
twodays$Global_reactive_power <- as.numeric(as.character(twodays$Global_reactive_power))

# open PNG file
png(filename="plot4.png")

# set up 2 x 2 matrix of charts
par(mfcol=c(2,2))

# plot Global_active_power in upper left quadrant
# compared to plot1.R, the x-label no longer lists units
plot(DateTime,twodays$Global_active_power,xlab="",ylab="Global Active Power",type="n")
lines(DateTime,twodays$Global_active_power)

# plot Sub_metering in lower left quadrant
# Note that the legend has changed slightly from plot2.R. It no longer has a border and the text size
# was shrunken to 90% of the original.
plot(DateTime,twodays$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(DateTime,twodays$Sub_metering_1)
lines(DateTime,twodays$Sub_metering_2,col="red")
lines(DateTime,twodays$Sub_metering_3,col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n",cex=0.9)

# plot Voltage in upper right quadrant
plot(DateTime,twodays$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(DateTime,twodays$Voltage)

# plot Global_reactive_power in lower right quadrant
plot(DateTime,twodays$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
lines(DateTime,twodays$Global_reactive_power)

# close PNG device
dev.off()

