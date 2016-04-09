#This script will fetch data necessary to complete the work if the available file does not exist in the working directory.

# The source file and its unzipped components are not part of the git repository.

curr_dir <- getwd()
source_file <- "household_power_consumption.zip"
source_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if (! file.exists(source_file)) {
  download.file( url=source_url, destfile=source_file)
  unzip(source_file)
}

input_file <- "household_power_consumption.txt"