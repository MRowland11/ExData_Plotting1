##set working directory containing dataset
setwd("c:\\projects\\Coursera\\Course4\\Week1Assignment")

  ##Read in data, read dates as characters not factors
    data <-read.table("household_power_consumption.txt",sep=';',header=TRUE,as.is=TRUE)

  ##Convert 'Date' to date format
    data$Date <- as.Date(data$Date,format="%d/%m/%Y")    

  ##Retain only 2 days of data as per instructions 
    data2 <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

  ##Convert $Global_active_power to numeric 
    data2$Global_active_power <- as.numeric(data2$Global_active_power)

  ##Plot histogram as per instuctions 
    png("plot1.png", w=480, h=480)
    hist(data2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
    dev.off()    

