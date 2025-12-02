library(readr)
library(stringr)
library(dplyr)
library(tidyverse)

#part1

setwd("D:/Users/Philipp/Projekte/AdventOfCode")
input <- read.csv("Day4.txt", header = FALSE, sep=":", stringsAsFactors=FALSE)

df <- input %>% mutate(win = str_split_i(V2, "\\|",1)) %>% mutate(mycard = str_split_i(V2, "\\|",2))

df$win <- df$win %>%  str_match_all("[0-9]+")
df$mycard <- df$mycard %>%  str_match_all("[0-9]+")  


matches <- 0
sum <- 0
for (i in 1:length(df$mycard)){
  matches <- 0
  for (j in 1:nrow(df$mycard[[i]])){
    if (df$mycard[[i]][j,] %in% df$win[[i]]) matches <- matches + 1
     
  }
  if (matches > 0) sum <- sum + 2**(matches-1)
}
sum

#part2

matches <- 0
sum <- 0
for (i in 1:length(df$mycard)){
  matches <- 0
  for (j in 1:nrow(df$mycard[[i]])){
    if (df$mycard[[i]][j,] %in% df$win[[i]]) matches <- matches + 1
  }
  df$matches[i] <- matches
  }

df$anzahl <- 1

for(i in 1:length(df$matches)){
  if (df$matches[i] > 0){
    for (j in i+1:df$matches[i]){
      df$anzahl[j] <- df$anzahl[i] + df$anzahl[j]
  }
  }
}
sum(df$anzahl)
