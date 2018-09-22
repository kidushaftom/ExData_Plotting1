
class<-c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
df<-read.table("household_power_consumption.txt",
               header=T,sep=";",
               na.strings = "?",
               colClasses=class)[
                 as.Date(read.table("household_power_consumption.txt",
                                    header=T,sep=";",
                                    na.strings = "?",
                                    colClasses=class)$Date,format = "%d/%m/%Y")>="2007-01-01"
                 & as.Date(read.table("household_power_consumption.txt",
                                      header=T,sep=";",
                                      na.strings = "?",
                                      colClasses=class)$Date,format = "%d/%m/%Y")<="2007-02-02",]

df<-df[complete.cases(df),]
df$Date<-as.Date(df$Date, format = "%d/%m/%Y")


df<-cbind(df,data.frame(paste(df$Date,df$Time)))
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(df, {
  plot(Global_active_power~paste.df.Date..df.Time., type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~paste.df.Date..df.Time., type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~paste.df.Date..df.Time., type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~paste.df.Date..df.Time.,col='Red')
  lines(Sub_metering_3~paste.df.Date..df.Time.,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~paste.df.Date..df.Time., type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png,"plot4.png", 
        width=480,
        height=480)
dev.off()