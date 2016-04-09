#This script creates plot3.png

#First, use the 00_data_fetcher.R script to download and unpack the source data if necessary. This script also loads the data set.
#If the dt variable doesn't exist in the environmnet, run the script to load and check the data we need.
if (! exists("dt") ) {
  source("./00_data_fetcher.R")
}

png(filename="plot3.png",height=480,width=480)

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

dev.off()