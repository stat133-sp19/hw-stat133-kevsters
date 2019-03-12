#' @Title: Make-Shots-Data-Script
#' @Description: Purpose is to create a shots-data.csv file which will contain all required variables to
# be used during visualization.
#' @Input: The csv files in the data folder
#' @Output: Txt summary files for each player's shot data

library(plyr)
library(dplyr)

setwd("../../stat133/workouts/workout01")

# For entry #2 (date of game), maybe better to use some kind of datetime package than just a character
data_Types = c("character", "character", "integer", "integer", "integer", 
               "integer", "factor", "factor", "factor", "integer", 
               "character", "integer", "integer")

curry = read.csv("data/stephen-curry.csv", stringsAsFactors = FALSE, colClasses = data_Types)
iggy = read.csv("data/andre-iguodala.csv", stringsAsFactors = FALSE, colClasses = data_Types)
durant = read.csv("data/kevin-durant.csv", stringsAsFactors = FALSE, colClasses = data_Types)
klay = read.csv("data/klay-thompson.csv", stringsAsFactors = FALSE, colClasses = data_Types)
dray = read.csv("data/draymond-green.csv", stringsAsFactors = FALSE, colClasses = data_Types)


# add a player name column to each data frame
curry$player_name = c("Stephen Curry")
iggy$player_name = c("Andre Iguodala")
durant$player_name = c("Kevin Durant")
klay$player_name = c("Klay Thompson")
dray$player_name = c("Draymond Green")

# In shot_made_flag category, change "n" to "shot_no", and "y" to "shot_yes"

curry$shot_made_flag = revalue(curry$shot_made_flag, c("y" = "shot_yes", "n" = "shot_no"))
iggy$shot_made_flag = revalue(iggy$shot_made_flag, c("y" = "shot_yes", "n" = "shot_no"))
durant$shot_made_flag = revalue(durant$shot_made_flag, c("y" = "shot_yes", "n" = "shot_no"))
klay$shot_made_flag  = revalue(klay$shot_made_flag, c("y" = "shot_yes", "n" = "shot_no"))
dray$shot_made_flag  = revalue(dray$shot_made_flag, c("y" = "shot_yes", "n" = "shot_no"))

# add minute column which is minute where shot occurred

curry$minute = ((curry$period - 1) * 12) + (12 - curry$minutes_remaining)
iggy$minute = ((iggy$period - 1) * 12) + (12 - iggy$minutes_remaining)
durant$minute = ((durant$period - 1) * 12) + (12 - durant$minutes_remaining)
klay$minute = ((klay$period - 1) * 12) + (12 - klay$minutes_remaining)
dray$minute = ((dray$period - 1) * 12) + (12 - dray$minutes_remaining)

# sending summary of each data frame to outputs directory
sink(file = 'output/stephen-curry-summary.txt')
summary(curry)
sink()

sink(file = 'output/andre-iguodala-summary.txt')
summary(iggy)
sink()

sink(file = 'output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = 'output/klay-thompson-summary.txt')
summary(klay)
sink()

sink(file = 'output/draymond-green-summary.txt')
summary(dray)
sink()

# stack data frames into one object and sink it to data directory

stacked = rbind(curry, iggy, durant, klay, dray)

write.csv(stacked, 'data/shots-data.csv')

# send summary of the assembled table to outputs folder
sink(file = 'output/shots-data-summary.txt')
summary(stacked)
sink()




