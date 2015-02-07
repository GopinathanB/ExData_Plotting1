#
# Coursera: Exploratory Data Analysis: Feb 2015
# Author - Gopinathan Balaji (GopinathanB)
# File: plot2.R
# Global Active Power vs. datetime (line). 
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

#Plot the graph on a png device
png(filename = "plot2.png",
    width = 480,
    height = 480)
plot(hpc_data$datetime, 
     hpc_data$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()
# End of file.