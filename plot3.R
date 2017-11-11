#downloading zip file  
url='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
zipfile='project_w1_data.zip'
file='household_power_consumption.txt'

if (!file.exists(zipfile)){
  url
  download.file(url,zipfile)
}  
#unzipping data file
if (!file.exists(file)) { 
  unzip(zipfile) 
}
#reading data and subsetting
dataIn<-read.table(file,header=TRUE,sep=";",na.strings = "?")
dataIn<-subset(dataIn,dataIn$Date %in% c("1/2/2007","2/2/2007"))

#changing variables to date and time
dataIn$Time<-strptime(paste(as.character(dataIn$Date)," ",as.character(dataIn$Time),sep=""),format="%d/%m/%Y %H:%M:%S")

dataIn$Date<-as.Date(dataIn$Date[1],format="%d/%m/%Y")

  
  #chart3
  png('plot3.png',width=480,height=480)
  plot(dataIn$Time,dataIn$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
  par(new=T)
  plot(dataIn$Time,dataIn$Sub_metering_2,type="l",ylab="Energy sub metering",xlab="", col="red",ylim=c(0,max(dataIn$Sub_metering_1)))
  par(new=T)
  plot(dataIn$Time,dataIn$Sub_metering_3,type="l",ylab="Energy sub metering",xlab="", col="blue",ylim=c(0,max(dataIn$Sub_metering_1)))
  legend("topright",legend=names(dataIn[,7:9]),col=c("black","red","blue"),lwd=1)
  dev.off()
  
