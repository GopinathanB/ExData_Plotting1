#
# Coursera: Exploratory Data Analysis: Feb 2015
# Author - Gopinathan Balaji (GopinathanB)
# File: plot4.R
# Four graphs. 
# See https://github.com/rdpeng/ExData_Plotting1/blob/master/README.md
#

# Read data (The '.txt' file from the ZIP is already extracted 
# into the current directory)
hpc_data <- read.table(file = "household_power_consumption.txt",
                       header = TRUE,
                       sep = ";",
                       na.strings = c("?"),
                       colClasses = c(rep("character", 2), rep("numeric", 7)),
                       comment.char = "")

# Subset the data frame.
hpc_data <- hpc_data[hpc_data$Date %in% (c("1/2/2007", "2/2/2007")), ]

# Concatenate the Date and Time variables into a new datetime variable
hpc_data$datetime <- paste(hpc_data$Date, 
                           hpc_data$Time)

# Parse the new variable as time.
hpc_data$datetime <- strptime(hpc_data$datetime, 
                              format="%d/%m/%Y %H:%M:%S")

# Draw the 4 graphs on a png device
png(filename = "plot4.png",
    width = 480,
    height = 480)
par(mfcol = c(2,2))
# Plot at row 0, col 0 - topleft
plot(hpc_data$datetime, 
     hpc_data$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
# Plot at row 1, col 0 - bottomleft
plot(hpc_data$datetime, 
     hpc_data$Sub_metering_1, 
     ylab="Energy sub metering", 
     xlab="", 
     type="l")
lines(hpc_data$datetime, 
      hpc_data$Sub_metering_2, 
      col="red")
lines(hpc_data$datetime, 
      hpc_data$Sub_metering_3, 
      col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), 
       lwd=1)
# Plot at row 0, col 1 - topright
plot(hpc_data$datetime, 
     hpc_data$Voltage, 
     type="l", 
     ylab="Voltage", 
     xlab="datetime")
# Plot at row 1, col 1 - bottomright
plot(hpc_data$datetime, 
     hpc_data$Global_reactive_power, 
     type="l", 
     ylab="Global_reactive_power", 
     xlab="datetime")
dev.off()
# End of file