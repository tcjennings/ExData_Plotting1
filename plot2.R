#This script creates plot2.png

#First, use the 00_data_fetcher.R script to download and unpack the source data if necessary. This script also sets the input_file variable.
if (! exists("dt") ) {
  source("./00_data_fetcher.R")
}

png(filename="plot2.png",height=480,width=480)

#Plot2 is an over-time graph of global active power(kw) by DateTime
#The default x-axis settings will show days of the week at the major ticks, which is fine.
#The default y-axis breaks at 2,4,6... are fine.

plot( x=dt$DateTime, y=dt$Global_active_power,
      type="l", #line
      main="",xlab="",ylab="",
      cex.axis=0.75
)

title( xlab="",
       ylab="Global Active Power (kilowatts)",
       cex.lab=0.80
)

dev.off()