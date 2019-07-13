#################################################################################
############################# PLOT 2 RUN CODE ###################################
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



png("Project1/plot2.png")
with(dataset,plot(y=Global_active_power,
                  x=Date.time,type="l",
                  lwd=1,
                  xlab="",
                  ylab="Global Active Power (kilowatts)"))
dev.off()

