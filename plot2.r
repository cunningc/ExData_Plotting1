## Lode in and set up Dataset
hdr<-read.csv("household_power_consumption.txt", header = FALSE,nrows = 1, sep = ";")
data<-read.table("household_power_consumption.txt", skip = 66637,nrows = 2880, sep = ";")
colnames(data)<-unlist(hdr)

## Plot2
## Plot line graph of Global_active_power over 2 days
# step 1 convert dates and times to posix datetimes for x-axis using strptime()
dates <- unlist(data[,1])
times <- unlist(data[,2])
datetimes <- paste(dates, times)
x<-strptime(datetimes, "%d/%m/%Y %H:%M:%S")
# step 2 extract global_active_power data into y-axis
y<-data$Global_active_power
# step 3 set up plot device (png)
png(file = "plot2.png")
plot(x,y,type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off() ## Close plot device