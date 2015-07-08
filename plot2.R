if(!file.exists("exdata-data-household_power_consumption.zip")) {
  temp <- tempfile()
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  file <- unzip(temp)
  unlink(temp)
}
power <- read.table(file, header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
ba<-df
datetime <- paste(as.Date(ba$Date), ba$Time)
ba$Datetime <- as.POSIXct(datetime)
plot(ba$Global_active_power ~ ba$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
