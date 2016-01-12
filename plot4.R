plot4 <- function(files) {
	if(file.exists(files)){
        powers <- read.table(files, header=T, sep=";")
        powers$Date <- as.Date(powers$Date, format="%d/%m/%Y")
        newdf <- powers[(powers$Date=="2007-02-01") | (powers$Date=="2007-02-02"),]
        
        newdf$Sub_metering_1 <- as.numeric(as.character(newdf$Sub_metering_1))
        newdf$Sub_metering_2 <- as.numeric(as.character(newdf$Sub_metering_2))
        newdf$Sub_metering_3 <- as.numeric(as.character(newdf$Sub_metering_3))
        newdf$Global_active_power <- as.numeric(as.character(newdf$Global_active_power))
        newdf$Global_reactive_power <- as.numeric(as.character(newdf$Global_reactive_power))
        newdf$Voltage <- as.numeric(as.character(newdf$Voltage))
        
        newdf <- transform(newdf, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
        
        par(mfrow=c(2,2))
        
        ##PLOT 1
        plot(newdf$timestamp,newdf$Global_active_power, type="l", xlab="", ylab="Global Active Power")
        ##PLOT 2
        plot(newdf$timestamp,newdf$Voltage, type="l", xlab="datetime", ylab="Voltage")
        
        ##PLOT 3
        plot(newdf$timestamp,newdf$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(newdf$timestamp,newdf$Sub_metering_2,col="red")
        lines(newdf$timestamp,newdf$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
        
        #PLOT 4
        plot(newdf$timestamp,newdf$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
        
        
        dev.copy(png, file="plot4.png", width=480, height=480)
        dev.off()
        cat("plot4.png has been saved in", getwd())
	}	
	else
	{cat("Supplied file doesn't exists, exiting")}
}