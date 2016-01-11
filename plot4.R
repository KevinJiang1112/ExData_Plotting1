png("./plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE)
data <- tbl_df(data)
source_data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
source_data <- mutate(source_data,Global_active_power =as.numeric(Global_active_power))

source_data1 <- mutate(source_data,week_day = paste(Date,Time,sep = " "))
time1 <- strptime(source_data1$week_day,"%d/%m/%Y %H:%M:%S")
plot(time1,source_data1$Global_active_power,type = "l",xlab="",ylab = "Global Active Power (kilowatts)")

source_data1 <- mutate(source_data1,Voltage =as.numeric(Voltage))
plot(time1,source_data1$Voltage,type = "l",xlab="datetime",ylab = "Voltage")


source_data1 <- mutate(source_data,week_day = paste(Date,Time,sep = " "))
source_data1 <- mutate(source_data1,Sub_metering_1 =as.numeric(Sub_metering_1))
source_data1 <- mutate(source_data1,Sub_metering_2 =as.numeric(Sub_metering_2))
source_data1 <- mutate(source_data1,Sub_metering_3 =as.numeric(Sub_metering_3))
time1 <- strptime(source_data1$week_day,"%d/%m/%Y %H:%M:%S")
plot(time1,source_data1$Sub_metering_1,type = "l",xlab="",ylab = "Energy sub metering",col="black")
lines(time1,source_data1$Sub_metering_2,col="red")
lines(time1,source_data1$Sub_metering_3,col="blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

source_data1 <- mutate(source_data1,Global_reactive_power =as.numeric(Global_reactive_power))
plot(time1,source_data1$Global_reactive_power,type = "l",xlab="datetime",ylab = "Global_reactive_power")
dev.off()