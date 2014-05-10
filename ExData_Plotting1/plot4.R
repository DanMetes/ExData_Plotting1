## --------------------------------------------------------------------------------------------
## The code below read in the household power consumption file located in the current directory,
## manipulates the date and time columns, subsets the data on the dates of interest, creates
## 4 plots into one view and exports the output to a png file: plot4.png
## --------------------------------------------------------------------------------------------


## Make sure the file to red from is in the current directory
## setwd("C:/Users/Dan/Desktop/Coursera/4. Exploratory Data Analysis/Proj 1")

## Read in the data file, define type for read in columns, replace "?" with NA

   power_consumpt <- read.csv("household_power_consumption.txt", sep=";",colClasses=c("character","character",rep("numeric",7)),na.strings="?")

## convert date and time variables and subset on dates betweeb 2007-02-01 and 2007-02-02

   power_consumpt$Date <- as.Date(power_consumpt$Date, format="%d/%m/%Y")
   power_consumpt$Time <- as.POSIXct(strptime(paste(power_consumpt$Date,' ',power_consumpt$Time), "%Y-%m-%d %H:%M:%S"))

   power_consumpt_short <- power_consumpt[as.Date('2007-02-01') <= power_consumpt$Date & power_consumpt$Date <= as.Date('2007-02-02'),]

## Create plot4

   par(mfrow = c(2,2))

## 1st

   plot(power_consumpt_short$Time, power_consumpt_short$Global_active_power, type="n", ylab = "Global Active Power (kilowatts)", xlab= "")
   lines(power_consumpt_short$Time, power_consumpt_short$Global_active_power, type="l")
   

## 2nd

   plot(power_consumpt_short$Time, power_consumpt_short$Voltage, type="n", ylab = "Voltage", xlab= "datetime")
   lines(power_consumpt_short$Time, power_consumpt_short$Voltage, type="l")
   
## 3rd

   plot(power_consumpt_short$Time, power_consumpt_short[,7], type="n", ylab = "Energy sub metering", xlab= "")
   
   lines(power_consumpt_short$Time, power_consumpt_short[,7], type="l", col = "black")
   lines(power_consumpt_short$Time, power_consumpt_short[,8], type="l", col = "red")
   lines(power_consumpt_short$Time, power_consumpt_short[,9], type="l", col = "blue")
   
   legend("topright",cex=0.5, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1                    ", "Sub_metering_2                    ", "Sub_metering_3                    ")
          ,bty="n",text.font=15, xjust=0)
   

## 4th

   plot(power_consumpt_short$Time, power_consumpt_short[,4], type="n", ylab = "Global_reactive_power", xlab= "datetime")
   lines(power_consumpt_short$Time, power_consumpt_short[,4], type="l")

## Save plot4 to png4
   
   dev.copy(png,'plot4.png', width=480,height=480)
   dev.off()
   
dev.off()
   
   