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

df$Fecha <- as.Date(df$Fecha,"%d/%m/%Y")
df$Hora <- strptime(df$Hora,"%H:%M:%S")
hist(df$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="red")
dev.copy(png,"plot1.png")
dev.off()

