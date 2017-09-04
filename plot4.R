## Load in and set up Dataset
hdr<-read.csv("household_power_consumption.txt", header = FALSE,nrows = 1, sep = ";")
data<-read.table("household_power_consumption.txt", skip = 66637,nrows = 2880, sep = ";")
colnames(data)<-unlist(hdr)

## Plot4
## Plot line graph for energy sub metering over 2 days
# step 1 convert dates and times to posix datetimes for x-axis using strptime()
dates <- unlist(data[,1])
times <- unlist(data[,2])
datetimes <- paste(dates, times)
x<-strptime(datetimes, "%d/%m/%Y %H:%M:%S")

# step 2 set up the y-axis variants
y<-data$Global_active_power
voltg<-as.numeric(data$Voltage)
sub_1<-as.numeric(data$Sub_metering_1)
sub_2<-as.numeric(data$Sub_metering_2)
sub_3<-as.numeric(data$Sub_metering_3)
react<-data$Global_reactive_power

# step 3 set up plot device (png)
png(file = "plot4.png")

# step 4 run the plots
par(mfrow = c(2,2)) # 2x2 matrix of plots
# 1 - Global Active Power
plot(x,y,type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
#2 - Voltage
plot(x,voltg,xlab ="datetime",ylab ="Voltage",type ="l")
#3 - Sub metering
plot(x,sub_1,type="l", ylab = "Energy sub metering", xlab = "")
lines(x,sub_2, type="l", col="red")
lines(x,sub_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
      lty = 1, lwd=2.5, col = c("black","red","blue"), bty="n")
#4 - Global Reactive Power
plot(x,react, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off() ## Close plot device
