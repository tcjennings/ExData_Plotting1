#This script will fetch data necessary to complete the work if the available file does not exist in the working directory.
#Operations common to all four plot scripts will be performed here and source()'d from each plot script.

library(dplyr)

# The source file and its unzipped components are not part of the git repository.

curr_dir <- getwd()
source_file <- "household_power_consumption.zip"
source_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if (! file.exists(source_file)) {
  download.file( url=source_url, destfile=source_file)
  unzip(source_file)
}

input_file <- "household_power_consumption.txt"

#Using data.frame instead of data.table because data.table does not support the POSIXlt class we want to use for DateTime
#Read the input_file as a data.frame. Input file is ;-delimited and includes 9 columns. NA values are represented as "?"
dt <- read.table(input_file,sep=";",na.strings="?",header=TRUE)

#dt should have dimensions 2075259 rows x 9 columns
if ( sum(dim(dt) == c(2075259,9)) < 2 ) {
  stop("Input file dimensions are incorrect.")
}

#Column Date can be coerceed into a date format, of which we only need between 2007-02-01 and 2007-02-02.
left_date <- as.Date("2007-02-01")
right_date <- as.Date("2007-02-02")
dt <- dt %>% mutate( Date=as.Date(Date,format="%d/%m/%Y") ) %>%
             filter( between(Date,left_date,right_date) )

#Given the shorter data.frame, we will now efficiently create a DateTime field
#The time zone is not specified, so we will allow the TZ to be the local time
dt$DateTime=strptime(paste(dt$Date,dt$Time),format="%Y-%m-%d %H:%M:%S")
