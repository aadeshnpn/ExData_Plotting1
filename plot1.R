##1 plot1("name of file here") starts the function. For example: plot1("household_power_consumption.txt")
##2 if file exists it is read into R and assigned to the powers variable 
##3 the date column is reformatted as recommended in the assignment instructions
##4 the two days of interest are subsetted out of the power data frame and assigned to new data frame named "newdf"
##5 the Global_active_power col is reformatted as a numeric vector
##6 histogram is generated with the title "Global Active Power", red columns, and an x-axis label of "Global Active Power (kilowatts)"
##7 file is saved as "plot1.png"
##8 dev is closed
##9 statement is printed to let you know where the file has been successfully saved

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