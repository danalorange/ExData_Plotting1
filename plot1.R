
# read data file
household <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

# extract the rows corresponding to the two days
twodays <- household[(household$Date=="2/2/2007"|household$Date=="1/2/2007"),]

# convert the Global_active_power column to numeric. Note that it must first be converted
# from factor to character and then from character to numeric. Trying to convert from factor
# to numeric directly will cause data errors!
twodays$Global_active_power <- as.numeric(as.character(twodays$Global_active_power))

# open PNG file
png(filename="plot1.png")

# plot histogram
hist(twodays$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

# close PNG device
dev.off()
