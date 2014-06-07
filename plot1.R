plot1 <- function(hpc = NULL) {
  
  read.csv2("./household_power_consumption.txt",colClasses="character") -> hpc
  hpc[,3] <- as.numeric(hpc[,3])
  hpc[,1] <- as.Date(hpc[,1],"%d/%m/%Y")
  hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02",] -> hpc
  hist(hpc$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
  dev.copy(png,"plot1.png")
  dev.off()
  
}