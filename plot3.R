#This script creates plot3.png

#First, use the 00_data_fetcher.R script to download and unpack the source data if necessary. This script also loads the data set.
#If the dt variable doesn't exist in the environmnet, run the script to load and check the data we need.
if (! exists("dt") ) {
  source("./00_data_fetcher.R")
}

#Create a PNG for plot3
png(filename="plot3.png",height=480,width=480)

#Plot3 is a line plot with three data series for Sub_Metering_1/2/3
# It includes a legend in the upper right corner

#Start plot with first line in black
plot( x=dt$DateTime, y=dt$Sub_metering_1,
      type="l", #line
      main="",xlab="",ylab="",
      col="black",
      cex.axis=0.75
      )

#Add second line in red
lines( x=dt$DateTime, y=dt$Sub_metering_2,
      col="red"
)

#Add third line in blue
lines( x=dt$DateTime, y=dt$Sub_metering_3,
      col="blue"
)

#Add plot title
title(ylab="Energy sub metering",
      cex.lab=0.80)

#Add plot legend
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1, #Solid line style
       cex=0.75)

dev.off()