# plot1.R
# Wooseog Choi
# This function is to plot global active power histogram into the jpg file.

plot1<-function()
{
        setwd("C:/Users/bchoi/Documents/r-test/Exploratory")
        data<-read.table("exdata_data_household_power_consumption/household_power_consumption.txt",
                         header=TRUE, sep=";")
        data$Date<-as.Date(strptime(data$Date, "%d/%m/%Y"))
        startDate<-as.Date("2007-02-01")
        endDate<-as.Date("2007-02-02")
        dataSub<-subset(data, data$Date >= startDate & data$Date <= endDate)
        dataSub$Global_active_power<-as.numeric(as.character(dataSub$Global_active_power))
        png(file="plot1.png", width=480, height=480, units="px")
        hist(dataSub$Global_active_power, main="Global Active Power", 
             col="orangered", xlab="Global Active Power (kilowatts)")
        dev.off()
        
}