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