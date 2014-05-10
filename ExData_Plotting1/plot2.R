## --------------------------------------------------------------------------------------------
## The code below read in the household power consumption file located in the current directory,
## manipulates the date and time columns, subsets the data on the dates of interest, creates
## the 2nd plot and it exports it to a png file: plot2.png
## --------------------------------------------------------------------------------------------


## Make sure the file to red from is in the current directory
## setwd("C:/Users/Dan/Desktop/Coursera/4. Exploratory Data Analysis/Proj 1")

## Read in the data file, define type for read in columns, replace "?" with NA

   power_consumpt <- read.csv("household_power_consumption.txt", sep=";",colClasses=c("character","character",rep("numeric",7)),na.strings="?")

## convert date and time variables and subset on dates betweeb 2007-02-01 and 2007-02-02

   power_consumpt$Date <- as.Date(power_consumpt$Date, format="%d/%m/%Y")
   power_consumpt$Time <- as.POSIXct(strptime(paste(power_consumpt$Date,' ',power_consumpt$Time), "%Y-%m-%d %H:%M:%S"))

   power_consumpt_short <- power_consumpt[as.Date('2007-02-01') <= power_consumpt$Date & power_consumpt$Date <= as.Date('2007-02-02'),]

## Create plot2

   plot(power_consumpt_short$Time, power_consumpt_short$Global_active_power, type="n", ylab = "Global Active Power (kilowatts)", xlab= "")
   lines(power_consumpt_short$Time, power_consumpt_short$Global_active_power, type="l")

## Save plot2 to png2

   dev.copy(png,'plot2.png', width=480,height=480)
   dev.off()

