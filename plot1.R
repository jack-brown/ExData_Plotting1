#plot1.R

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

#Plot 1
hist(pcdata$Global_active_power, main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)', col = 'red')
dev.copy(png, file = "./ExploratoryDataAnalysis/Project1/plot1.png")
dev.off()
