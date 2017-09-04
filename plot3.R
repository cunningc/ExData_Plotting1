## Load in and set up Dataset
hdr<-read.csv("household_power_consumption.txt", header = FALSE,nrows = 1, sep = ";")
data<-read.table("household_power_consumption.txt", skip = 66637,nrows = 2880, sep = ";")
colnames(data)<-unlist(hdr)

## Plot3
## Plot line graph for energy sub metering over 2 days
# step 1 convert dates and times to posix datetimes for x-axis using strptime()
dates <- unlist(data[,1])
times <- unlist(data[,2])
datetimes <- paste(dates, times)
x<-strptime(datetimes, "%d/%m/%Y %H:%M:%S")

# step 2 extract Sub_metering data into y-axis
sub_1<-as.numeric(data$Sub_metering_1)
sub_2<-as.numeric(data$Sub_metering_2)
sub_3<-as.numeric(data$Sub_metering_3)

# step 3 set up plot device (png)
png(file = "plot3.png")
plot(x,sub_1,type="l", ylab = "Energy sub metering", xlab = "")
lines(x,sub_2, type="l", col="red")
lines(x,sub_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd=2, col = c("black","red","blue"))
dev.off() ## Close plot device

