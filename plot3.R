##set working directory containing dataset
setwd("c:\\projects\\Coursera\\Course4\\Week1Assignment")

  ##Read in data, read dates as characters not factors
    data <-read.table("household_power_consumption.txt",sep=';',header=TRUE,as.is=TRUE)

  ##Convert 'Date' to date format
    data$Date2 <- as.Date(data$Date,format="%d/%m/%Y")    

  ##Retain only 2 days of data as per instructions 
    data2 <- data[(data$Date2=="2007-02-01") | (data$Date2=="2007-02-02"),]

  ##turn character fields 'Date' and 'Time' into a datetime field  
    data2$datetime <- strptime( paste(data2$Date, data2$Time) ,"%d/%m/%Y %H:%M:%S") 

    
  ##Convert $sub_metering_ variables to numeric 

    data2$Sub_metering_1 <- as.numeric(data2$Sub_metering_1)
    data2$Sub_metering_2 <- as.numeric(data2$Sub_metering_2)
    data2$Sub_metering_3 <- as.numeric(data2$Sub_metering_3)
    

  ##Plot histogram as per instuctions 
    png("plot3.png", w=480, h=480)
    plot(data2$datetime,data2$Sub_metering_1,ylab="Energy Sub metering",xlab="",type="l")
    lines(data2$datetime,data2$Sub_metering_2,col="red",ylab="Energy Sub metering",xlab="",type="l")
    lines(data2$datetime,data2$Sub_metering_3,col="blue",ylab="Energy Sub metering",xlab="",type="l")
    legend("topright", legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
            ,lty = 1, col = c("black", "red", "blue"),)    
    dev.off()     
    

