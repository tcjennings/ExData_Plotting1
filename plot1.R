#This script creates plot1.png

#First, use the 00_data_fetcher.R script to download and unpack the source data if necessary. This script also loads the data set.
#If the dt variable doesn't exist in the environmnet, run the script to load and check the data we need.
if (! exists("dt") ) {
  source("./00_data_fetcher.R")
}

#Save the file as Plot1.png
png(filename="plot1.png",width=480,height=480)

#Plot1 is a histogram of global active power in kilowatts
hist(dt$Global_active_power,
     col="red",
     main=NULL,xlab=NULL,ylab=NULL,
     cex.axis=0.75)

#Label the title and axes
title(main="Global Active Power",
      xlab="Global Active Power (kilowatts)",
      ylab="Frequency",
      cex.lab=0.80,
      cex.main=0.90)

dev.off()