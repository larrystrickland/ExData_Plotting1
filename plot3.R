
a<-read.csv("household_power_consumption.txt", na.strings="?",sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
b<-a[a$Date=="1/2/2007" | a$Date=="2/2/2007",]
b$Date<-as.POSIXct(strptime(do.call(paste0, b[c(1,2)]), "%d/%m/%Y%H:%M:%S"))


png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
with(b, plot(Date, Sub_metering_1, type="l", ylab="Energy sub metering"))
with(b, lines(Date, Sub_metering_2, type="l", col="red"))
with(b, lines(Date, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
