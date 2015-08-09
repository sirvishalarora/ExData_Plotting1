setwd("Where you have downloaded the DataFile")##set the working directory to the directory where data is downloaded
unzip("exdata_data_household_power_consumption.zip")##Unzip the compress file
power_cons<-read.csv2("household_power_consumption.txt",na.strings = "?")##read file into dataframe and marking na values as "?"
dim(power_cons)##checking total rows and columns of Data Frame
names(power_cons)##getting the column names for filtering
power_cons<-subset(power_cons,Date=="2/2/2007"| Date=="1/2/2007")##filtering on the basis of specified date
power_cons$Datetime<-paste(power_cons$Date,power_cons$Time)##Adding a new column which is merge of Date and time columns
power_cons$Datetime<-strptime(power_cons$Datetime,"%d/%m/%Y %T")## Formatting the Datetime column for use in plots
plot(power_cons$Datetime,power_cons$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")##Drawing the plot with Sub_metering_1
lines(power_cons$Datetime,power_cons$Sub_metering_2,col="red")##Adding Sub_metering_2 to the plot
lines(power_cons$Datetime,power_cons$Sub_metering_3,col="blue")##Adding Sub_metering_3 to the plot
legend("topright",pch="-",col=c("black","red","blue"),legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))##Adding the legend describing colour code.
dev.copy(png,"plot3.png",width=480,height=480)##transfer to png graphic device
dev.off()##png file generation.