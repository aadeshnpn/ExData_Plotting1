plot3 <- function(files) {
	if(file.exists(files)){
        powers <- read.table(files, header=T, sep=";")
        powers$Date <- as.Date(powers$Date, format="%d/%m/%Y")
        newdf <- powers[(powers$Date=="2007-02-01") | (powers$Date=="2007-02-02"),]
        
        newdf$Sub_metering_1 <- as.numeric(as.character(newdf$Sub_metering_1))
        newdf$Sub_metering_2 <- as.numeric(as.character(newdf$Sub_metering_2))
        newdf$Sub_metering_3 <- as.numeric(as.character(newdf$Sub_metering_3))
        
        newdf <- transform(newdf, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
        
        plot(newdf$timestamp,newdf$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(newdf$timestamp,newdf$Sub_metering_2,col="red")
        lines(newdf$timestamp,newdf$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=1, lwd=2.5)
        dev.copy(png, file="plot3.png", width=480, height=480)
        dev.off()
        cat("plot3.png has been saved in", getwd())
	}	
	else
		{cat("Supplied file doesn't exists, exiting")}
}