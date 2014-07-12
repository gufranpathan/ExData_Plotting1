# This script assumes that the dataset is in the same folder as the script
# Description: Create plot3.png

#Read the data and convert the date and time vairables into POSIX format
data<- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)
data$Time<-strptime(paste(data$Date," ",data$Time),format="%d/%m/%y%y %H:%M:%S")
data$Date<-as.Date(data$Date,format="%d/%m/%y%y")


#Subset data for 2007-02-01 and 2007-02-02
dates<-as.Date(c("2007-02-01","2007-02-02"),format="%y%y-%m-%d")
datesubs<- data[data$Date%in%dates,]

#Make plot3.png
png("plot3.png", width=480, height=480, units="px",bg=NA)
plot(datesubs$Time,datesubs$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(datesubs$Time,datesubs$Sub_metering_2,type="l",col="red")
points(datesubs$Time,datesubs$Sub_metering_3,type="l",col="blue")
legend("topright",lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()
