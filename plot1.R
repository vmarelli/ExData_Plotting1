rm(list = ls())

library('grDevices')

getwd()


# setting working directory!! I don't know how to get the directory of the .R, could you help me?

setwd("~/ExData_Plotting1/Project1")


file<-paste('Data/household_power_consumption.txt')


#don't forget to remove text into num!!! 
df_dat<-read.table(file, header=TRUE, sep=';',dec='.', na.strings=c("NA", "-", "?"))

#transform the date and time into one variable! 

df_dat$fulldate<-as.character(paste(df_dat$Date, df_dat$Time))

df_dat$fulldate<-as.POSIXlt(df_dat$fulldate, format = "%d/%m/%Y %H:%M:%S")

#select the timespan used

df_data<-df_dat[df_dat$fulldate>="2007-02-01 00:00:00" & df_dat$fulldate<="2007-02-03 00:00:00",]

#Save the pNG file

png('Plot1.png',bg = "transparent")

# graph the histogram
hist(df_data$Global_active_power,col='red',main = "Global Active Power",xlab='Global Active Power (kilowatts)')

dev.off()
