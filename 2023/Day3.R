library(readr)
library(stringr)
library(dplyr)
library(tidyverse)

#part1

setwd("D:/Users/Philipp/Projekte/AdventOfCode")
input <- read.csv("Day3.txt", header = FALSE, sep=",", stringsAsFactors=FALSE)
d <- input[,1]
Symbols <- "[@*\\/%&$=+#-]"


sum <- 0
for (line in 1:length(d)){
 zahlen <- str_locate_all(d[line], "[0-9]+")[[1]]
 if (is_empty(zahlen)){
 }else if (line == 1){
   for (i in 1:length(zahlen[,1])){
     if (str_detect(substring(d[line], zahlen[i]-1, zahlen[i,2]+1),Symbols)|
         str_detect(substring(d[line+1], zahlen[i]-1, zahlen[i,2]+1), Symbols)) {
       sum <- sum + as.numeric(substring(d[line], zahlen[i], zahlen[i,2]))
     }
   }
 }else if(line == length(d)){
   for (i in 1:length(zahlen[,1])){
     if (str_detect(substring(d[line-1], zahlen[i]-1, zahlen[i,2]+1),Symbols)|
         str_detect(substring(d[line], zahlen[i]-1, zahlen[i,2]+1), Symbols)) {
       sum <- sum + as.numeric(substring(d[line], zahlen[i], zahlen[i,2]))
     }
   }
 }else{
   for (i in 1:length(zahlen[,1])){
     if (str_detect(substring(d[line+1], zahlen[i]-1, zahlen[i,2]+1),Symbols)|
       str_detect(substring(d[line-1], zahlen[i]-1, zahlen[i,2]+1),Symbols)|
         str_detect(substring(d[line], zahlen[i]-1, zahlen[i,2]+1), Symbols)) {
       sum <- sum + as.numeric(substring(d[line], zahlen[i], zahlen[i,2]))
     }
   }
 }
}
sum
