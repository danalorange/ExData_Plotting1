# read data file
household <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

# extract the rows corresponding to the two days
twodays <- household[(household$Date=="2/2/2007"|household$Date=="1/2/2007"),]

# convert the columns to numeric. Note that they must first be converted
# from factor to character and then from character to numeric. Trying to convert from factor
# to numeric directly will cause data errors!
twodays$Sub_metering_1 <- as.numeric(as.character(twodays$Sub_metering_1))
twodays$Sub_metering_2 <- as.numeric(as.character(twodays$Sub_metering_2))
twodays$Sub_metering_3 <- as.numeric(as.character(twodays$Sub_metering_3))

# Combine Date and Time columns and convert to datetime format
DateTime <- paste(twodays$Date,twodays$Time)
DateTime <- strptime(DateTime,"%d/%m/%Y %H:%M:%S")

# open PNG file
png(filename="plot3.png")

# plot line graph
plot(DateTime,twodays$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(DateTime,twodays$Sub_metering_1)
lines(DateTime,twodays$Sub_metering_2,col="red")
lines(DateTime,twodays$Sub_metering_3,col="blue")

# plot legend
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

# close PNG device
dev.off()
