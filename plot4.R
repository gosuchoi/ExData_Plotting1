#plot4.R
# Wooseog Choi
# This R program plots four charts in one panel and saves the chart into the jpg file.
plot4<-function()
{
        library(lubridate)
        setwd("C:/Users/bchoi/Documents/r-test/Exploratory")
        data<-read.table("exdata_data_household_power_consumption/household_power_consumption.txt",
                         header=TRUE, sep=";", stringsAsFactors=FALSE)
        data$Date<-as.Date(strptime(data$Date, "%d/%m/%Y"))
        startDate<-as.Date("2007-02-01")
        endDate<-as.Date("2007-02-02")
        dataSub<-subset(data, data$Date >= startDate & data$Date <= endDate)
        dataSub$datetime<-paste(dataSub$Date, dataSub$Time)
        dataSub$datetime<-as.POSIXct(dataSub$datetime, "%Y-%m-%d %H:%M:%S", tz="GMT")
        dataSub$Global_active_power<-as.numeric(as.character(dataSub$Global_active_power))
        dataSub$Global_reactive_power<-as.numeric(as.character(dataSub$Global_reactive_power))
        dataSub$Voltage<-as.numeric(as.character(dataSub$Voltage))
        dataSub$Sub_metering_1<-as.numeric(as.character(dataSub$Sub_metering_1))
        dataSub$Sub_metering_2<-as.numeric(as.character(dataSub$Sub_metering_2))
        dataSub$Sub_metering_3<-as.numeric(as.character(dataSub$Sub_metering_3))
        png(file="plot4.png", width=480, height=480, units="px")
        par(mfrow=c(2, 2))
        # upper left
        plot(dataSub$datetime, dataSub$Global_active_power, type="l",  xlab="", ylab="Global Active Power")
        # upper right
        with(dataSub, plot(datetime, Voltage, type="l"))
        # lower left
        plot(dataSub$datetime, dataSub$Sub_metering_1, type="l",  xlab="", ylab="Energy sub metering")
        lines(dataSub$datetime, dataSub$Sub_metering_2,col="red")
        lines(dataSub$datetime, dataSub$Sub_metering_3,col="blue")
        legend("topright", col=c("black", "red", "blue"), lty="solid", bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        # lower right
        with(dataSub, plot(datetime, Global_reactive_power, type="l"))
        
        dev.off()
}