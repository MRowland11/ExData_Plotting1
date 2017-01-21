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

    
  ##Convert relevant characteritics to numeric 

    data2$Global_active_power <- as.numeric(data2$Global_active_power)
    data2$Voltage            <- as.numeric(data2$Voltage)
    data2$Sub_metering_1 <- as.numeric(data2$Sub_metering_1)
    data2$Sub_metering_2 <- as.numeric(data2$Sub_metering_2)
    data2$Sub_metering_3 <- as.numeric(data2$Sub_metering_3)
    data2$Global_reactive_power <- as.numeric(data2$Global_reactive_power)    


##Plot histogram as per instuctions 
    png("plot4.png", w=480, h=480)

##Set up so page is a 2 * 2 charts 
    par(mfrow = c(2,2))

#Chart 1    
    plot(data2$datetime,data2$Global_active_power,ylab="Global Active Power",xlab="",type="l")
    
#Chart 2    
    plot(data2$datetime,data2$Voltage,ylab="Voltage",xlab="datetime",type="l")
    
        
#Chart 3    
    plot(data2$datetime,data2$Sub_metering_1,ylab="Energy Sub metering",xlab="",type="l")
    lines(data2$datetime,data2$Sub_metering_2,col="red",ylab="Energy Sub metering",xlab="",type="l")
    lines(data2$datetime,data2$Sub_metering_3,col="blue",ylab="Energy Sub metering",xlab="",type="l")
    legend("topright", legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            lty = 1, col = c("black", "red", "blue"),bty="n")    

#Chart 4    
    plot(data2$datetime,data2$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")
    
    
    dev.off()     
    

    
