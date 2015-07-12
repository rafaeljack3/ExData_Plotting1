data<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
data$Date<-as.Date(data$Date,"%d/%m/%Y")
subs<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
remove(data)
subs$Time<-strptime(subs$Time,"%H:%M:%S")
#
png("plot1.png")
hist(as.numeric(subs$Global_active_power),col="red",xlab="Global Active Power(killowatts)",main="Global Active Power")
dev.off()