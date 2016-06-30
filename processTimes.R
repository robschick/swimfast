library(readr)
library(stringr)
library(lubridate)
stimes <- read_csv('data/stellaTimes.csv', col_types = 'ccDccc')
distance <- as.integer(noquote(str_replace(str_split_fixed(stimes$Race, ' ', 2)[, 1], 'm', '')))
stroke <- str_split_fixed(stimes$Race, ' ', 2)[, 2]
stimes$Stroke <- stroke
stimes$Distance <- distance

stimes$newTimes <- as.difftime(stimes$Time, format = '%M:%OS')
# you can also make these numeric: as.numeric(timediff)
# http://stackoverflow.com/questions/14480575/how-to-work-with-times-distance-and-speed
# Try Edelbuettel's suggestion:

