#This script creates plot4.png

#First, use the 00_data_fetcher.R script to download and unpack the source data if necessary. This script also loads the data set.
#If the dt variable doesn't exist in the environmnet, run the script to load and check the data we need.
if (! exists("dt") ) {
  source("./00_data_fetcher.R")
}

#Plot 4 is a 4-up view that includes several plots, some of which are the other plots.

png(filename="plot4.png",height=480,width=480)

#Set up a 2x2 par for the plots
par(mfrow=c(2,2))

#First plot, upper left, same as plot 2.
plot( x=dt$DateTime, y=dt$Global_active_power,
      type="l", #line
      main="",xlab="",ylab="",
      cex.axis=0.75
)
title( xlab="",
       ylab="Global Active Power (kilowatts)",
       cex.lab=0.80
)

#Second plot, upper right, is voltage over datetime with only major ticks labeled.
plot( x=dt$DateTime, y=dt$Voltage,
      type="l",
      main="", xlab="datetime",ylab="Voltage",
      cex.axis=0.75,cex.lab=0.80,
      yaxt="n")
axis(2) #replace default plot y axis (2=left)

#Third plot, lower left, is same as plot 3.
plot( x=dt$DateTime, y=dt$Sub_metering_1,
      type="l", #line
      main="",xlab="",ylab="",
      col="black",
      cex.axis=0.75
)

lines( x=dt$DateTime, y=dt$Sub_metering_2,
       col="red"
)

lines( x=dt$DateTime, y=dt$Sub_metering_3,
       col="blue"
)

title(ylab="Energy sub metering",
      cex.lab=0.80)

legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       cex=0.75)

#Fourth plot, lower right, is global_reactive_power over datetime
plot( x=dt$DateTime, y=dt$Global_reactive_power,
      type="l",
      main="",xlab="datetime",ylab="Global_reactive_power",
      cex.axis=0.75,cex.lab=0.80
      )

dev.off()