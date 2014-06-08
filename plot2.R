plot2 <- function(hpc = NULL) {
  
  read.csv2("./household_power_consumption.txt",colClasses="character") -> hpc
  hpc[,3] <- as.numeric(hpc[,3])
  hpc[,1] -> hpc$posixDate
  hpc[,1] <- as.Date(hpc[,1],"%d/%m/%Y")
  hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02",] -> hpc
  strptime(paste(hpc[,10],hpc[,2]),"%d/%m/%Y %H:%M:%S") -> hpc$posixTime
  with(hpc,plot(posixTime,type="l",Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",cex.lab=.7))
  dev.copy(png,"plot2.png")
  dev.off()
  
}