setwd("Where you have downloaded the DataFile")##set the working directory to the directory where data is downloaded
unzip("exdata_data_household_power_consumption.zip")##Unzip the compress file
power_cons<-read.csv2("household_power_consumption.txt",na.strings = "?")##read file into dataframe and marking na values as "?"
dim(power_cons)##checking total rows and columns of Data Frame
names(power_cons)##getting the column names for filtering
power_cons<-subset(power_cons,Date=="2/2/2007"| Date=="1/2/2007")##filtering on the basis of specified date
power_cons$Datetime<-paste(power_cons$Date,power_cons$Time)##Adding a new column which is merge of Date and time columns
power_cons$Datetime<-strptime(power_cons$Datetime,"%d/%m/%Y %T")## Formatting the Datetime column for use in plots
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))##mentioning the boundaries and number of plots to be drawn in the frame.
with(power_cons,{plot(Datetime,Global_active_power,type="l",ylab="Global Active Power",xlab="")##plot1
plot(Datetime,Voltage,ylab="Voltage",xlab="datetime",type="l")#plot2
plot(Datetime,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")##plot3
lines(Datetime,Sub_metering_2,col="red")##plot3
lines(Datetime,Sub_metering_3,col="blue")##plot3
legend("topright",pch="-",col=c("black","red","blue"),legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))##plot3
plot(Datetime,Global_reactive_power,ylab="Global_rective_power",xlab="datetime",type="l")})##plot4
dev.copy(png,"plot4.png",width=480,height=480)##transfer to png graphic device
dev.off()##png file generation.
