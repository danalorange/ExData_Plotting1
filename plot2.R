# read data file
household <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

# extract the rows corresponding to the two days
twodays <- household[(household$Date=="2/2/2007"|household$Date=="1/2/2007"),]

# convert the Global_active_power column to numeric. Note that it must first be converted
# from factor to character and then from character to numeric. Trying to convert from factor
# to numeric directly will cause data errors!
twodays$Global_active_power <- as.numeric(as.character(twodays$Global_active_power))

# Combine Date and Time columns and convert to datetime format
DateTime <- paste(twodays$Date,twodays$Time)
DateTime <- strptime(DateTime,"%d/%m/%Y %H:%M:%S")

# open PNG file
png(filename="plot2.png")

# plot line graph
plot(DateTime,twodays$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n")
lines(DateTime,twodays$Global_active_power)

# close PNG device
dev.off()