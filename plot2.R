# plot2.R
# Wooseog Choi
# This R function is to plot Global active power line chart into the jpg file.

plot2<-function()
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
        dataSub$Global_active_power<-as.numeric(as.character(dataSub$Global_active_power))
        png(file="plot2.png", width=480, height=480, units="px")
        plot(dataSub$timestamp, dataSub$Global_active_power, type="l",  xlab="", ylab="Global Active Power (kilowatts)")
        dev.off()
}