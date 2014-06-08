
setwd("~/Desktop/R/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")

#import and format data
ds.f = read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)
ds = subset(ds.f, Date %in% c("1/2/2007","2/2/2007"))
ds$datetime = strptime(paste(ds$Date,ds$Time),"%d/%m/%Y %H:%M:%S")

#plot
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(ds$datetime, ds$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

plot(ds$datetime, ds$Voltage, type="l", ylab="Voltage",xlab="datetime")

plot(ds$datetime, ds$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(ds$datetime, ds$Sub_metering_2, col="red")
lines(ds$datetime, ds$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

plot(ds$datetime, ds$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()