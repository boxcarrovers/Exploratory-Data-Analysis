# This is code used for first project on exploratory data analysis
# September 9, 2015

# i have already downloaded the file to my working directory.
# it is a massive text file, with data elements separated by semicolons and with a header row
# according to instructions we will only need observations from two days- 2/1/07 and 2/2/07.

# first download entire dataset

jmrawdataset <- read.table ('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)

# there is probably a more elegant way to do this, but i'm going to subsetthe jmdataset dataframe twice, once fore each date, 
# and then combine the two
keydate1 <- subset(jmrawdataset, Date == '1/2/2007')
keydate2 <- subset(jmrawdataset, Date == '2/2/2007')
jminterimdata <- rbind(keydate1,keydate2)

# first introduce one column that combines date and time
jminterimdata$DT <- paste(jminterimdata$Date,jminterimdata$Time)
# now convert properly to R date/time format 
jminterimdata$DT1 <- strptime(jminterimdata$DT, format = '%d/%m/%Y %H:%M:%S')
jmfinaldata <- jminterimdata
str(jmfinaldata)
#now have data in the form we need it; key column to action off of for time values is jmfinaldata$DT1


                                
str()
# here is the first graph I need
png (file = 'plot1.png')
jmtest <- hist(jmfinaldata$Global_active_power)
plot(jmtest, col = 'red', ann = FALSE)
title (main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency')
dev.off()



#here is the 2nd graph i need 
png (file = 'plot2.png')
plot(jmfinaldata$DT1,jmintdataset$Global_active_power, type = 'b', ann = FALSE, cex = 0.5)
title (ylab = 'Global Active Power (kilowatts)')
dev.off()

# here is the 3rd graph i need
png (file = 'plot3.png')
plot(jmfinaldata$DT1,jmfinaldata$Sub_metering_1,type = 'b', col = 'black', ann= FALSE, ylim = c(0,30), ylab ='Energy sub-metering')
lines (jmfinaldata$DT1, jmfinaldata$Sub_metering_2, type = 'b',col = 'red')
lines(jmfinaldata$DT1, jmfinaldata$Sub_metering_3, type = 'b', col = 'blue')
legend('topright', c('submetering1','submetering2', 'submetering3'),col = c('black','red','blue'),lty = 1)
dev.off()

# now for the 4th, which shows 4 graphs, in 2x2 layout 
# of which first column have already been generated 
png (file = 'plot4.png')
par(mfrow = c(2,2))
#first one
plot(jmfinaldata$DT1,jmintdataset$Global_active_power, type = 'b', ann = FALSE, cex = 0.5)
title (ylab = 'Global Active Power (kilowatts)')
#2nd one
plot(jmfinaldata$DT1,jmfinaldata$Voltage, type = 'b', ylab = 'Voltage', xlab = 'date/time')
#third one
plot(jmfinaldata$DT1,jmfinaldata$Sub_metering_1,type = 'b', col = 'black', ann= FALSE, ylim = c(0,30), ylab ='Energy sub-metering')
lines (jmfinaldata$DT1, jmfinaldata$Sub_metering_2, type = 'b',col = 'red')
lines(jmfinaldata$DT1, jmfinaldata$Sub_metering_3, type = 'b', col = 'blue')
legend('topright', c('submetering1','submetering2', 'submetering3'),col = c('black','red','blue'),lty = 1)
#4th one
plot(jmfinaldata$DT1,jmfinaldata$Global_reactive_power,type ='b')
dev.off()

                                