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

# my days are in French ...

df_data$DoW<-weekdays(df_data$fulldate)

df_data$DoW<-as.factor(df_data$DoW)


#Save the pNG file

png('Plot3.png',bg = "transparent")



plot(df_data$fulldate,df_data$Sub_metering_1, type='l', xlab="",ylab='Energy Sub Metering')
par(new=T)

plot(df_data$fulldate,df_data$Sub_metering_2, type='l', xlab="",ylab='',xaxt='n',yaxt='n',ylim=c(0,40),col='red')
par(new=T)

plot(df_data$fulldate,df_data$Sub_metering_3, type='l', xlab="",ylab='',xaxt='n',yaxt='n',ylim=c(0,40),col='blue')

legend("topright",lty = c(1, 1, 1),col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.off()

