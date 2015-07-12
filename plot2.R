data<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
x<-as.Date(data$Date,"%d/%m/%Y")
subs<-data[x>="2007-02-01" & x<="2007-02-02",]
remove(data)
x<-paste(subs$Date,subs$Time)
subs$Date<-strptime(x,"%d/%m/%Y %H:%M:%S",tz="GMT")

png("plot2.png")
plot(subs$Date,as.numeric(subs$Global_active_power),type="l",xlab="",ylab="Global Active Power(killowatts)")
dev.off()