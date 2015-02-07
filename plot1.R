#
# Coursera: Exploratory Data Analysis: Feb 2015
# Author - Gopinathan Balaji (GopinathanB)
# File: plot1.R
# Global Active Power histogram. 
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

# Plot the histogram on a png device
png(filename = "plot1.png",
    width = 480,
    height = 480)
hist(hpc_data$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()
# End of file.