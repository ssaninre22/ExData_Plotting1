#################################################################################
############################# PLOT 3 RUN CODE ###################################
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
png("Project1/plot3.png")
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
dev.off()

