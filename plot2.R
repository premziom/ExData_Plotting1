
url='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
zipfile='project_w1_data.zip'
file='household_power_consumption.txt'

if (!file.exists(zipfile)){
  url
  download.file(url,zipfile)
}  
if (!file.exists(file)) { 
  unzip(zipfile) 
}

dataIn<-read.table(file,header=TRUE,sep=";",na.strings = "?")
dataIn<-subset(dataIn,dataIn$Date %in% c("1/2/2007","2/2/2007"))

dataIn$Time<-strptime(paste(as.character(dataIn$Date)," ",as.character(dataIn$Time),sep=""),format="%d/%m/%Y %H:%M:%S")

dataIn$Date<-as.Date(dataIn$Date[1],format="%d/%m/%Y")

#chart2
png('plot2.png',width=480,height=480)
plot(dataIn$Time,dataIn$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()

