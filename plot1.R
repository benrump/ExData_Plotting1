
setwd("~/Desktop/R/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")

#import and format data
ds.f = read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)
ds = subset(ds.f, Date %in% c("1/2/2007","2/2/2007"))
ds$datetime = strptime(paste(ds$Date,ds$Time),"%d/%m/%Y %H:%M:%S")

#plot
png("plot1.png", width=480, height=480)
hist(ds$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()