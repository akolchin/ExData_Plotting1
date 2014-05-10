plot2 <- function() {
        
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
        png(filename="plot2.png", width=480, height=480, units="px")
        plot(x=data$datetime, y=data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        
        dev.off()
}