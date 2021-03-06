
#load in all data
household_power_cons = read.table('household_power_consumption.txt', sep=';', header=TRUE, na.strings='?', stringsAsFactors = FALSE)

#convert Date column to a date format
household_power_cons$Date = as.Date(household_power_cons$Date, format="%d/%m/%Y")

#create a datetime variable that combines Date and Time
household_power_cons = transform(household_power_cons, datetime = strptime(paste(Date, Time, sep=' '), format='%Y-%m-%d %H:%M:%S'))

#restrict attention to data between 2007-02-01 and 2007-02-02
household_power_cons_2day = subset(household_power_cons, Date=='2007-02-01' | Date=='2007-02-02')

#plot3: line plot with 3 variables (sub_metering)
png('./ExData_Plotting1/plot3.png', width = 480, height = 480)
with(household_power_cons_2day, plot(datetime, Sub_metering_1, type='l', lwd=2,
                                     xlab='', ylab='Energy sub metering'))
with(household_power_cons_2day, lines(datetime, Sub_metering_2, col='red', lwd=2))
with(household_power_cons_2day, lines(datetime, Sub_metering_3, col='blue', lwd=2))
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), lwd=2)
dev.off()