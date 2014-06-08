plot4 <- function(hpc = NULL) {
  
  read.csv2("./household_power_consumption.txt",colClasses="character") -> hpc
  hpc[,3] <- as.numeric(hpc[,3])
  hpc[,1] -> hpc$posixDate
  hpc[,1] <- as.Date(hpc[,1],"%d/%m/%Y")
  hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02",] -> hpc
  strptime(paste(hpc[,10],hpc[,2]),"%d/%m/%Y %H:%M:%S") -> hpc$posixTime
  hpc[,4] <- as.numeric(hpc[,4])
  hpc[,5] <- as.numeric(hpc[,5])
  hpc[,7] <- as.numeric(hpc[,7])
  hpc[,8] <- as.numeric(hpc[,8])
  hpc[,9] <- as.numeric(hpc[,9])
  png("plot4.png")
  par(mfrow = c(2,2))
  with(hpc, {
    plot(posixTime,type="l",Global_active_power,ylab="Global Active Power",xlab="")
    plot(posixTime,type="l",Voltage,ylab="Voltage",xlab="datetime")
    plot(posixTime,type="l",Sub_metering_1,xlab="",ylab="Energy sub metering")
    lines(hpc$posixTime,hpc$Sub_metering_2,type="l",col="red")
    lines(hpc$posixTime,hpc$Sub_metering_3,type="l",col="blue")
    legend("topright",lty=1,bty="n",col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(posixTime,type="l",Global_reactive_power,ylab="Global_reactive_power",xlab="datetime")
  })
  dev.off()
  
}