## Lode in and set up Dataset
hdr<-read.csv("household_power_consumption.txt", header = FALSE,nrows = 1, sep = ";")
data<-read.table("household_power_consumption.txt", skip = 66637,nrows = 2880, sep = ";")
colnames(data)<-unlist(hdr)

## plot a histogram of the global active power field
png(file = "plot1.png") ## set up plot device (png)
hist(data$Global_active_power, col = "red", ## color=red
     cex.axis = 0.7, ## magnification of x & y axis tick text
     las = 1, ## orient axis tick text horizontal
     cex.lab = 0.8, ## magnification of x & y labels
     main="Global Active Power", ## set main title
     xlab = "Global Active Power (kilowatts)", ## set x-axis label text
     ylab = "Frequency") ## set y-axis label text
dev.off() ## Close plot device

