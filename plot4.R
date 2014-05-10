plot4 <- function() {
        
        ## load and unzip        
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, destfile="data.zip")
        unzip("data.zip")
        
        ## load and prepare datas
        data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec = ".", na.strings="?", stringsAsFactors=FALSE)
        
        ## subset to just two target days in February, 2007
        data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
        
        ## add datetime column
        data$datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %T")
        
        ## open PNG and plot
        png(filename="plot4.png", width=480, height=480, units="px")
        
        ## plot by rows in two rows and two columns
        par(mfrow=c(2,2))
        
        ## plot at row 1, column 1
        plot(x=data$datetime, y=data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
        
        ## plot at row 1, column 2
        plot(x=data$datetime, y=data$Voltage, type="l", xlab="datetime", ylab="Voltage")
        
        ## plot at row 2, column 1
        plot(x=data$datetime, y=data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
        lines(x=data$datetime, y=data$Sub_metering_2, col="red")
        lines(x=data$datetime, y=data$Sub_metering_3, col="blue")
        
        legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), bty="n", lty=1)
        
        ## plot at row 2, column 2
        plot(x=data$datetime, y=data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
        
        
        dev.off()
}