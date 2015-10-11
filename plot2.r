##Read data into variable
data <- read.table("./data/exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")

##Subset data for revelant period
subsetdata = data[data$Date %in% c("1/2/2007","2/2/2007"),]
Globalactivepower <- as.numeric(subsetdata$Global_active_power)
datetime <- strptime(paste(subsetdata$Date,subsetdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
##plot(datetime,Globalactivepower,type="l",ylab="Global Active Power (kilowatts)",xlab="")

##opne png and write histogram into png file opened
png("plot2.png",width = 480, height = 480 )
plot(datetime,Globalactivepower,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
