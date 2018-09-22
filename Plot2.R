
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


with(df,plot(Global_active_power~paste.df.Date..df.Time., 
             type="l",
             ylab="Global Active Power (kilowatts)", xlab=""))

dev.copy(png,"plot2.png", 
         width=480,
         height=480)
dev.off()