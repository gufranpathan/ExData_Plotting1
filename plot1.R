# This script assumes that the dataset is in the same folder as the script
# Description: Create plot1.png

#Read the data and convert the date and time vairables into POSIX format
data<- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)
data$Time<-strptime(paste(data$Date," ",data$Time),format="%d/%m/%y%y %H:%M:%S")
data$Date<-as.Date(data$Date,format="%d/%m/%y%y")


#Subset data for 2007-02-01 and 2007-02-02
dates<-as.Date(c("2007-02-01","2007-02-02"),format="%y%y-%m-%d")
datesubs<- data[data$Date%in%dates,]

#Make plot1.png
hist(datesubs$Global_active_power,col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")
par(bg=NA) 
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
