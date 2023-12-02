library(readr)
library(stringr)
library(dplyr)
library(tidyverse)

#part1

setwd("D:/Users/Philipp/Projekte/AdventOfCode")
input <- read.csv("Day2.txt", header = FALSE, sep = ":")

too_big <- "((1[3-9]|2[0-9]) red|(1[4-9]|2[0-9]) green|(1[5-9]|2[0-9]) blue)"

df <- input %>% mutate(too_big = str_detect(input$V2, too_big)) %>% rownames_to_column() %>% 
  transform(rowname = as.numeric(rowname))
sum(df$rowname)


#part2

df <- df %>% mutate(maxblue = as.numeric(lapply(str_match_all(V2,"[0-9]+(?= blue)"), function(x) max(as.numeric(x))))) %>%
  mutate(maxgreen = as.numeric(lapply(str_match_all(V2,"[0-9]+(?= green)"), function(x) max(as.numeric(x))))) %>%
  mutate(maxred = as.numeric(lapply(str_match_all(V2,"[0-9]+(?= red)"), function(x) max(as.numeric(x))))) %>%
  mutate(max = maxblue*maxred*maxgreen)

sum(df$max)
