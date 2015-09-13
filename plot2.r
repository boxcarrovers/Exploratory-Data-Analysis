png (file = 'plot2.png')
plot(jmfinaldata$DT1,jmintdataset$Global_active_power, type = 'b', ann = FALSE, cex = 0.5)
title (ylab = 'Global Active Power (kilowatts)')
dev.off()