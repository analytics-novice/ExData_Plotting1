##Read data into variable
data <- read.table("./data/exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")

##Subset data for revelant period
subsetdata = data[data$Date %in% c("1/2/2007","2/2/2007"),]
Globalactivepower <- as.numeric(subsetdata$Global_active_power)

##hist(Globalactivepower,col="red",main = "Global Active Power",xlab="Global Active Power (kilowatts)")

##opne png and write histogram into png file opened
png("plot1.png",width = 480, height = 480 )
with(subsetdata,hist(Globalactivepower,col="red",main = "Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()
