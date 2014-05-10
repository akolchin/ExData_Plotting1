plot1 <- function() {
        
        ## load and unzip        
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, destfile="data.zip")
        unzip("data.zip")
        
        ## load and prepare datas
        data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec = ".", na.strings="?", stringsAsFactors=FALSE)
        
        ## subset to just two target days in February, 2007
        data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
        
        ## open PNG and plot
        png(filename="plot1.png", width=480, height=480, units="px")
        hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col = "red")
        
        dev.off()
}