##Read data into variable
data <- read.table("./data/exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")

##Subset data for revelant period
subsetdata = data[data$Date %in% c("1/2/2007","2/2/2007"),]

##Conversions to number and date formats
Submetering1 <- as.numeric(subsetdata$Sub_metering_1)
Submetering2 <- as.numeric(subsetdata$Sub_metering_2)
Submetering3 <- as.numeric(subsetdata$Sub_metering_3)
datetime <- strptime(paste(subsetdata$Date,subsetdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
Globalactivepower <- as.numeric(subsetdata$Global_active_power)
Globalreactivepower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric((subsetdata$Voltage))

##open png and write histogram into png file opened
png("plot4.png",width = 480, height = 480 )
par(mfrow=c(2,2))
plot(datetime,Globalactivepower,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(datetime,voltage,type="l",ylab="Voltage",xlab="")

plot(datetime,Submetering1,type="l",ylab="Energy sub metering",xlab="",col="green")
lines(datetime,Submetering2,type="l",col="red")
lines(datetime,Submetering3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2.5,col = c("green","red","blue"))

plot(datetime,Globalreactivepower,type="l",ylab="Global_reactive_power",xlab="")
dev.off()

