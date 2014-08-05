#plot3.R

#read in the data
pcdata <- read.table('./ExploratoryDataAnalysis/Project1/household_power_consumption.txt',
                     header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)

#clean up the date/time components of the data
pcdata$Timestamp <- strptime(paste(pcdata$Date,pcdata$Time),
                             format = '%d/%m/%Y %H:%M:%S')
pcdata$Date <- as.Date(pcdata$Date, format = '%d/%m/%Y')

#subset the data to just 2 days: 01-Feb-2007 & 02-Feb-2007
pcdata <- pcdata[pcdata$Date == as.Date('2007-02-01')
                 | pcdata$Date == as.Date('2007-02-02'), ]
rownames(pcdata) <- NULL

#Plot 3
png("./ExploratoryDataAnalysis/Project1/plot3.png", width = 480, height = 480)
par(pch = ".")
with(pcdata, plot(Timestamp, Sub_metering_1, type = 'l',
                  xlab = '', ylab = 'Energy sub metering'))
lines(pcdata$Timestamp, pcdata$Sub_metering_3, col = 'blue')
lines(pcdata$Timestamp, pcdata$Sub_metering_2, col = 'red')
legend('topright', lty = 1 , col = c('black', 'red', 'blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
#dev.copy(png, file = "./ExploratoryDataAnalysis/Project1/plot3.png")
dev.off()