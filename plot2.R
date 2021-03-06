rm(list = ls())

library('grDevices')

getwd()


# setting working directory!! I don't know how to get the directory of the .R, could you help me?

setwd("~/ExData_Plotting1/Project1")


file<-paste('Data/household_power_consumption.txt')


#don't forget to remove text into num!!! 
df_dat<-read.table(file, header=TRUE, sep=';',dec='.', na.strings=c("NA", "-", "?"))


#transform the date and time into one variable! 

df_dat$datetime<-as.character(paste(df_dat$Date, df_dat$Time))

df_dat$datetime<-as.POSIXlt(df_dat$datetime, format = "%d/%m/%Y %H:%M:%S")

#select the timespan used

df_data<-df_dat[df_dat$datetime>="2007-02-01 00:00:00" & df_dat$datetime<="2007-02-03 00:00:00",]

# my days are in French ...

df_data$DoW<-weekdays(df_data$datetime)

df_data$DoW<-as.factor(df_data$DoW)



#Save the pNG file

png('Plot2.png',bg = "transparent")


plot(df_data$datetime,df_data$Global_active_power, type='l', xlab="",ylab='Global Active Power (kilowatts)')

dev.off()

