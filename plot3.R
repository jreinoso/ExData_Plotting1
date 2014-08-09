df <- read.table(file="household_power_consumption.txt",
                 header=TRUE,
                 skip=66636, 
                 sep=";", 
                 nrows=2880, 
                 na.strings="?", 
                 col.names=c("Fecha",
                             "Hora",
                             "Global_active_power",
                             "Global_reactive_power",
                             "Voltage",
                             "Global_intensity",
                             "Sub_metering_1",
                             "Sub_metering_2",
                             "Sub_metering_3"),
                 colClasses=c("character",
                              "character",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric")
                 )

#df$Fecha <- as.Date(df$Fecha,"%d/%m/%Y")
#df$Hora <- strptime(df$Hora,"%H:%M:%S")
df$FyH <- strptime(paste(df$Fecha, df$Hora),"%d/%m/%Y %H:%M:%S")
png(filename="plot3.png", width = 480, height = 480, units = "px")
plot(df$FyH,df$Sub_metering_1, 
     main="",
     xlab="",
     ylab="Energy sub mettering",
     col="black",
     type="l")
lines(df$FyH,df$Sub_metering_2, ,col="red")
lines(df$FyH,df$Sub_metering_3, ,col="blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=1, 
       col=c("black","red","blue"))

dev.off()

