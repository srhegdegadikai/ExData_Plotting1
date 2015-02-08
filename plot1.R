library("sqldf", lib.loc="~/R/win-library/3.1")
dat1 <- read.csv.sql("household_power_consumption.txt", header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" ) #read data which is already unzipped and is in the working directory
dat1[dat1 == "?"] <- NA
dat1 <-na.omit(dat1) #remove NA's
hist(dat1$Global_active_power,xlab="Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power",col="Red")
dev.copy(png, file = "plot1.png")
dev.off()
