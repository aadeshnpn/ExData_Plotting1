plot1 <- function(files) {
        if(file.exists(files)){
        	powers <- read.table(files, header=T, sep=";")
     		powers$Date <- as.Date(powers$Date, format="%d/%m/%Y")
        
        	newdf <- powers[(powers$Date=="2007-02-01") | (powers$Date=="2007-02-02"),]
        
        	newdf$Global_active_power <- as.numeric(as.character(newdf$Global_active_power))
        
        	hist(newdf$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
        
        	dev.copy(png, file="plot1.png", width=480, height=480)
        	dev.off()
        	cat("Plot1.png has been saved in", getwd())
	}	
	else
		{cat("Supplied file doesn't exists, exiting")}
}