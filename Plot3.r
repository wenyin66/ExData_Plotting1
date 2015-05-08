## EXPLORATORY DATA ANALYSIS
## PROJECT 1

# Predict dataset memory usage (8 bytes per numeric number)
memory_MB<- 2075259*9*8/1024/1024

# Read in data for dates 01/02/2007 and 02/02/2007
setwd("C:\\Users\\VHUANG\\Desktop\\My files\\Coursera\\3 Exploratory Data Analysis\\Week 1")
data<-filter(read.table("./data/household_power_consumption.txt",sep=";",header=TRUE),Date=="1/2/2007" | Date=="2/2/2007")

# Convert Date and Time variables to Date/Time classes in R
library(lubridate)
data$Time<-dmy_hms(paste(data$Date,data$Time))
data$Date<-dmy(data$Date)

# Convert from factor variable to numeric variable
data$Global_active_power<- as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data$Global_reactive_power<-as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power]
data$Voltage<-as.numeric(levels(data$Voltage))[data$Voltage]

# Plot 3
	# Convert sub meterings to numeric
	data$Sub_metering_1<- as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
	data$Sub_metering_2<- as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]

	# Plot and save to PNG
	with(data,{
			plot(Time, Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
			lines(Time,Sub_metering_1,type="l")
			lines(Time,Sub_metering_2,type="l",col="red")
			lines(Time,Sub_metering_3,type="l",col="blue")
			legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
			})
	dev.print(png,filename="plot3.png",width=480,height=480)
	dev.off()
