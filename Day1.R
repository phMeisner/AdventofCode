library(readr)
library(stringr)
library(stringi)
library(dplyr)

#part1

setwd("D:/Users/Philipp/Projekte/AdventOfCode")
input <- read.csv("Day1.txt", header = FALSE)

df <- data.frame(number1 = str_extract(input$V1,"[0-9]"),
                 number2 = str_extract(stri_reverse(input$V1), "[0-9]")) %>% 
                  mutate(Number = as.integer(paste0(number1,number2)))
sum(df$Number)

#part2

df <- data.frame(input$V1, number1 = str_replace_all(str_extract(input$V1,"([1-9]|one|two|three|four|five|six|seven|eight|nine)"),
                                           c("one" = "1", "two" = "2", "three" = "3", "four" = "4", "five" = "5",
                                           "six" = "6","seven" = "7", "eight" = "8", "nine" = "9")),
                 number2 = str_replace_all(sapply(str_extract_all(input$V1,"([1-9]|one(?!ight)|two(?!ne)|three(?!ight)|four|five(?!ight)|six|seven(?!ine)|eight(?!(hree|wo))|nine(?!ight))"),
                                                  function(x) tail(x, n = 1)),
                                           c("one" = "1", "two" = "2", "three" = "3", "four" = "4", "five" = "5",
                                             "six" = "6", "seven" = "7", "eight" = "8", "nine" = "9"))) %>%
            mutate(Number = as.integer(paste0(number1,number2)))

sum(df$Number)
