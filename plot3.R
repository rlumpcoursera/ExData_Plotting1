plot3 <- function(hpc = NULL) {
  
  read.csv2("./household_power_consumption.txt",colClasses="character") -> hpc
  hpc[,3] <- as.numeric(hpc[,3])
  hpc[,1] -> hpc$posixDate
  hpc[,1] <- as.Date(hpc[,1],"%d/%m/%Y")
  hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02",] -> hpc
  strptime(paste(hpc[,10],hpc[,2]),"%d/%m/%Y %H:%M:%S") -> hpc$posixTime
  hpc[,7] <- as.numeric(hpc[,7])
  hpc[,8] <- as.numeric(hpc[,8])
  hpc[,9] <- as.numeric(hpc[,9])
  png("plot3.png")
  with(hpc,plot(posixTime,type="l",Sub_metering_1,xlab="",ylab="Energy sub metering"))
  lines(hpc$posixTime,hpc$Sub_metering_2,type="l",col="red")
  lines(hpc$posixTime,hpc$Sub_metering_3,type="l",col="blue")
  legend("topright",lty=1 , col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  #dev.copy(png,"plot3.png")
  dev.off()
  
}