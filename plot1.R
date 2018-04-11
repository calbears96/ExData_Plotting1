
#load in all data
household_power_cons = read.table('household_power_consumption.txt', sep=';', header=TRUE, na.strings='?', stringsAsFactors = FALSE)

#convert Date column to a date format
household_power_cons$Date = as.Date(household_power_cons$Date, format="%d/%m/%Y")

#create a datetime variable that combines Date and Time
household_power_cons = transform(household_power_cons, datetime = strptime(paste(Date, Time, sep=' '), format='%Y-%m-%d %H:%M:%S'))

#restrict attention to data between 2007-02-01 and 2007-02-02
household_power_cons_2day = subset(household_power_cons, Date=='2007-02-01' | Date=='2007-02-02')


par(mfrow=c(1,1))

#plot1: histogram of global active power
png('./ExData_Plotting1/global_active_power_hist.png', width = 480, height = 480)
with(household_power_cons_2day, hist(Global_active_power, col='red', main='Global Active Power',
                                     xlab='Global Active Power (kilowatts)'))
dev.off()
