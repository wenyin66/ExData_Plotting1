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

# Plot 1 
	# Plot and save to PNG
	hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
	dev.print(png,filename="plot1.png",width=480,height=480)
	dev.off()
