#################################################
## Title: Make Shots Data
## Description: Data preparation
## Input(s):
## Output(s): 
#################################################

setwd("/Users/angiechen/stat133/hw-stat133/workout01")

curry <- read.csv("../workout01/data/stephen-curry.csv")
iguodala <- read.csv("../workout01/data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../workout01/data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../workout01/data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../workout01/data/klay-thompson.csv", stringsAsFactors = FALSE)

curry$name = rep(c('Stephen Curry'))
iguodala$name = rep(c('Andre Iguodala'))
green$name = rep(c('Draymond Green'))
durant$name = rep(c('Kevin Durant'))
thompson$name = rep(c('Klay Thompson'))

curry$shot_made_flag = as.character(curry$shot_made_flag)
curry$shot_made_flag[curry$shot_made_flag == 'y'] = 'shot_yes'
curry$shot_made_flag[curry$shot_made_flag == 'n'] = 'shot_no'

iguodala$shot_made_flag = as.character(iguodala$shot_made_flag)
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] = 'shot_yes'
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] = 'shot_no'

green$shot_made_flag = as.character(green$shot_made_flag)
green$shot_made_flag[green$shot_made_flag == 'y'] = 'shot_yes'
green$shot_made_flag[green$shot_made_flag == 'n'] = 'shot_no'

durant$shot_made_flag = as.character(durant$shot_made_flag)
durant$shot_made_flag[durant$shot_made_flag == 'y'] = 'shot_yes'
durant$shot_made_flag[durant$shot_made_flag == 'n'] = 'shot_no'

thompson$shot_made_flag = as.character(thompson$shot_made_flag)
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] = 'shot_yes'
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] = 'shot_no'

curry$minute = curry$period * 12 - curry$minutes_remaining
iguodala$minute = iguodala$period * 12 - iguodala$minutes_remaining
green$minute = green$period * 12 - green$minutes_remaining
durant$minute = durant$period * 12 - durant$minutes_remaining
thompson$minute = thompson$period * 12 - thompson$minutes_remaining

sink("../workout01/output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink("../workout01/output/stephen-curry-summary.txt")
summary(curry)
sink()

sink("../workout01/output/draymond-green-summary.txt")
summary(green)
sink()

sink("../workout01/output/kevin-durant-summary.txt")
summary(durant)
sink()

sink("../workout01/output/klay-thompson-summary.txt")
summary(thompson)
sink()

shotsdata = rbind(curry, green, iguodala, thompson, durant)
shotsdata

write.csv(shotsdata, file = "../workout01/data/shots-data.csv")

sink("../workout01/output/shots-data-summary.txt")
summary(shotsdata)
sink()

