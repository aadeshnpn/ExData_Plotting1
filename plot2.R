##1 plot2("name of file here") starts the function. For example: plot2("household_power_consumption.txt")
##2 if the file exists it is read into R and assigned to the powers data frame 
##3 the date column is reformatted as recommended in the assignment instructions
##4 the two days of interest are subsetted out of the power data frame and assigned to new data frame named "newdf"
##5 the Global_active_power col is reformatted as a numeric vector
##6 a new column titled "timestamp" is added to newdf. This column consists of the date and time pasted together and reforamtted as a POSIXct class.
##7 plot is generated with timestamp on x-axis and global active power on y-axis. Default x-axis label is removed. Y-axis label is specified.
##8 png is generated as a 480 pixel by 480 pixel image. Its saved as "PLot2.png". Bitmap files default to pixels as their unit of measurement hence only using "480."
##9 statement is printed to let you know where the file has been successfully saved

plot2 <- function(files) {
	if(file.exists(files)){
        powers <- read.table(files, header=T, sep=";")
        powers$Date <- as.Date(powers$Date, format="%d/%m/%Y")
        newdf <- powers[(powers$Date=="2007-02-01") | (powers$Date=="2007-02-02"),]
        
        newdf$Global_active_power <- as.numeric(as.character(newdf$Global_active_power))
        newdf <- transform(newdf, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
        
        plot(newdf$timestamp,newdf$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        
        dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()
        cat("plot2.png has been saved in", getwd())
	}	
	else
		{cat("Supplied file doesn't exists, exiting")}
}