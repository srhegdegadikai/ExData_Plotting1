library("sqldf", lib.loc="~/R/win-library/3.1")
dat1 <- read.csv.sql("household_power_consumption.txt", header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" ) #read data which is already unzipped and is in the working directory
dat1[dat1 == "?"] <- NA
dat1 <-na.omit(dat1) #remove NA's
dat2 <- as.POSIXlt(paste(as.Date(dat1$Date, format="%d/%m/%Y"), dat1$Time, sep=" ")) #convert date and time to required format
png(file="plot3.png")
plot(dat2, dat1[,7], type="l", xlab="", ylab="Energy sub metering")
lines(dat2,dat1[,8],col="Red")
lines(dat2,dat1[,9],col="Blue")
legend("topright",lty=c(1,1,1),lwd=1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
