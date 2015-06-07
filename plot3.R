# plot3.R
# Wooseog Choi
# This R program plots three Energy submetterings data into on chart.

plot3<-function()
{
        library(lubridate)
        setwd("C:/Users/bchoi/Documents/r-test/Exploratory")
        data<-read.table("exdata_data_household_power_consumption/household_power_consumption.txt",
                         header=TRUE, sep=";", stringsAsFactors=FALSE)
        data$Date<-as.Date(strptime(data$Date, "%d/%m/%Y"))
        startDate<-as.Date("2007-02-01")
        endDate<-as.Date("2007-02-02")
        dataSub<-subset(data, data$Date >= startDate & data$Date <= endDate)
        dataSub$timestamp<-paste(dataSub$Date, dataSub$Time)
        dataSub$timestamp<-as.POSIXct(dataSub$timestamp, "%Y-%m-%d %H:%M:%S", tz="GMT")
        dataSub$Sub_metering_1<-as.numeric(as.character(dataSub$Sub_metering_1))
        dataSub$Sub_metering_2<-as.numeric(as.character(dataSub$Sub_metering_2))
        dataSub$Sub_metering_3<-as.numeric(as.character(dataSub$Sub_metering_3))
        png(file="plot3.png", width=480, height=480, units="px")
        plot(dataSub$timestamp, dataSub$Sub_metering_1, type="l",  xlab="", ylab="Energy sub metering")
        lines(dataSub$timestamp, dataSub$Sub_metering_2,col="red")
        lines(dataSub$timestamp, dataSub$Sub_metering_3,col="blue")
        legend("topright", col=c("black", "red", "blue"), lty="solid", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
}