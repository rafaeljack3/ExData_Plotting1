library(datasets)

data<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
x<-as.Date(data$Date,"%d/%m/%Y")
subs<-data[x>="2007-02-01" & x<="2007-02-02",]
remove(data)
x<-paste(subs$Date,subs$Time)
subs$Date<-strptime(x,"%d/%m/%Y %H:%M:%S",tz="GMT")

png("plot3.png")
plot(subs$Date,as.numeric(subs$Sub_metering_1),type="l",col="black",xlab="",ylab="Energy sub metering")
lines(subs$Date,as.numeric(subs$Sub_metering_2),type="l",col="red")
lines(subs$Date,as.numeric(subs$Sub_metering_3),type="l",col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()