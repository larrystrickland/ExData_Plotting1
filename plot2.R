
a<-read.csv("household_power_consumption.txt", na.strings="?",sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
b<-a[a$Date=="1/2/2007" | a$Date=="2/2/2007",]
b$Date<-as.POSIXct(strptime(do.call(paste0, b[c(1,2)]), "%d/%m/%Y%H:%M:%S"))

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
plot(b$Date, b$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
