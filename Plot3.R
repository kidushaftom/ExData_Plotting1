
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

with(df, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~paste.df.Date..df.Time.,col='Red')
  lines(Sub_metering_3~paste.df.Date..df.Time.,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,"plot3.png", 
         width=480,
         height=480)
dev.off()