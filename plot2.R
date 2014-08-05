#plot2.R

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

#Plot 2
par(pch = ".")
plot(pcdata$Timestamp,pcdata$Global_active_power, xlab = '',
     ylab = 'Global Active Power (kilowatts)')
lines(pcdata$Timestamp,pcdata$Global_active_power)  #make a line graph
dev.copy(png, file = "./ExploratoryDataAnalysis/Project1/plot2.png")
dev.off()