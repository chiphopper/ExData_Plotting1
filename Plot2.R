
#Plot 2 R (Coursera Exploratory Data Analysis: Peer Assignment 1)

#Same top portion code for plots 1 through 4

#Load it up (data)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="power.zip")
power.data=read.table(unz("power.zip","household_power_consumption.txt"), sep=";")

#Date conversion
power.data$Date=as.Date(power.data$Date,format="%d/%m/%Y")

#Extract subset data (Feb 1st and 2nd 2007)
data=subset(power.data, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

#Format Time variable
a=paste(as.character(data$Date),as.character(data$Time),sep=" ")
b=strptime(a,format="%Y-%m-%d %H:%M")
data$Time=b

#Change data types to numeric
for (i in 3:9)
{
  data[,i]=as.numeric(as.character(data[,i]))
}


#Unique code for plot2.png

png("plot1.png", bg="white", width=480, height=480)
plot(data$Time, data$Global_active_power, xlab=" ", ylab="Global Active Power (kilowatts)", type="l", xlim=NULL)
dev.off()