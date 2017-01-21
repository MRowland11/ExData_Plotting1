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

    
  ##Convert $Global_active_power to numeric 
    data2$Global_active_power <- as.numeric(data2$Global_active_power)

  ##Plot histogram as per instuctions 
    png("plot2.png", w=480, h=480)
    plot(data2$datetime,data2$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")
    dev.off()     

