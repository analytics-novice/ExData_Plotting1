##Read data into variable
data <- read.table("./data/exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")

##Subset data for revelant period
subsetdata = data[data$Date %in% c("1/2/2007","2/2/2007"),]
Submetering1 <- as.numeric(subsetdata$Sub_metering_1)
Submetering2 <- as.numeric(subsetdata$Sub_metering_2)
Submetering3 <- as.numeric(subsetdata$Sub_metering_3)
datetime <- strptime(paste(subsetdata$Date,subsetdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
##plot(datetime,Submetering1,type="l",ylab="Energy sub metering",xlab="",col="green")
##lines(datetime,Submetering2,type="l",col="red")
##lines(datetime,Submetering3,type="l",col="blue")
##legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2.5,col = c("green","red","blue"))

##opne png and write histogram into png file opened
png("plot3.png",width = 480, height = 480 )
plot(datetime,Submetering1,type="l",ylab="Energy sub metering",xlab="",col="black")
lines(datetime,Submetering2,type="l",col="red")
lines(datetime,Submetering3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2.5,col = c("green","red","blue"))
dev.off()
