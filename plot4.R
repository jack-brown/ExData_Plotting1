#plot4.R

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

#Plot 4
png("./ExploratoryDataAnalysis/Project1/plot4.png", width = 480, height = 480)
par(pch = ".", mfcol = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

#upper left plot with a single black line
plot(pcdata$Timestamp,pcdata$Global_active_power, xlab = '',
     ylab = 'Global Active Power (kilowatts)')
lines(pcdata$Timestamp,pcdata$Global_active_power)

#draw a plot identical to plot3.png in the lower left
with(pcdata, plot(Timestamp, Sub_metering_1, type = 'l',
                  xlab = '', ylab = 'Energy sub metering'))
lines(pcdata$Timestamp, pcdata$Sub_metering_3, col = 'blue')
lines(pcdata$Timestamp, pcdata$Sub_metering_2, col = 'red')
legend('topright', lty = 1 , col = c('black', 'red', 'blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       bty = 'n')

#another black line plot in the upper right
plot(pcdata$Timestamp, pcdata$Voltage, type = 'l',
     xlab = 'datetime', ylab = 'Voltage')

#finally one last black line plot in the lower right
plot(pcdata$Timestamp, pcdata$Global_reactive_power, type = 'l',
     xlab = 'datetime', ylab = 'Global_reactive_power')
#dev.copy(png, file = "./ExploratoryDataAnalysis/Project1/plot4.png")
dev.off()