#################################################################################
############################# PLOT 4 RUN CODE ###################################
#################################################################################
library(data.table)
library(dplyr)

# Reading dataset
dataset <- read.table("Project1/household_power_consumption.txt",header=TRUE,
                      sep=";",dec=".",na.strings = "?")

# Conditioning dataset to February 1, 2 2017.
dataset <- as.data.table(dataset)
dataset$Date.time <-paste(as.character(dataset$Date),as.character(dataset$Time))
dataset$Date <- as.Date(dataset$Date,format("%d/%m/%Y"))
dataset <- dataset[Date=="2007-02-01"|Date=="2007-02-02",]
dataset$Date.time <- as.POSIXct(dataset$Date.time, format="%d/%m/%Y %H:%M:%S")

# Graphics
png("Project1/plot4.png")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
# Plot 1
with(dataset,plot(y=Global_active_power,
                  x=Date.time,type="l",
                  lwd=1,
                  xlab="",
                  ylab="Global Active Power"))
# Plot 2
with(dataset,plot(y=Voltage,
                  x=Date.time,type="l",
                  lwd=1,
                  xlab="datetime",
                  ylab="Voltage"))
# Plot 3
with(dataset, {plot(y=Sub_metering_1, x=Date.time, main = "",
                    type="l",ylab = "Energy sub metering",xlab="")
  lines(y=Sub_metering_2, x=Date.time,col="red")
  lines(y=Sub_metering_3, x=Date.time,col="blue")
  # Legends
  legend("topright",lty=c(1,1,1), cex=0.8,
         col = c("black","red", "blue"), 
         legend = c("Sub_metering_1","Sub_metering_2",
                    "Sub_metering_3"))
})
# Plot 4
with(dataset,plot(y=Global_reactive_power,
                  x=Date.time,type="l",
                  lwd=1,
                  xlab="datetime",
                  ylab="Global_reactive_power"))

dev.off()


