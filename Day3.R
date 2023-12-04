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


#part 2
Symbols <- "[*]"
numbers <- "[0-9]+"

input <- read.csv("Day3.txt", header = FALSE, sep=",", stringsAsFactors=FALSE)
d <- input[,1]
d <- d[1:3]

symbs_line <- str_locate_all(d[2], Symbols)[[1]]
i <- 1

line1 <-str_locate_all(substring(d[1], symbs_line[i]-1, symbs_line[i]+1), numbers)
line2 <-str_locate_all(substring(d[2], symbs_line[i]-1, symbs_line[i]+1), numbers)
line3 <-str_locate_all(substring(d[3], symbs_line[i]-1, symbs_line[i]+1), numbers)

test = c(line1,line2,line3)


gears <- c()
for (zeile in 1:3){
if (is_empty(test[[zeile]])){
  
}else if (test[[zeile]][,1] == test[[zeile]][,2]){ #start= end
  if (test[[zeile]][,1] == 1){  #start = 1
    gear <- as.numeric(str_match(substring(d[zeile], symbs_line[i]-3, symbs_line[i]-1), numbers))
  }else if(test[[zeile]][,1] == 2){ #start = 2
    gear <- substring(d[zeile], symbs_line[i], symbs_line[i])
  }else if (test[[zeile]][,1] == 3){ #start = 3
    gear <- str_match(substring(d[zeile], symbs_line[i]+1, symbs_line[i]+3), numbers)
  }
}else{ #start =! end
  if (test[[zeile]][,1] == 1){  #start = 1
    gear <- as.numeric(str_match(substring(d[zeile], symbs_line[i]-2, symbs_line[i]+2), numbers))
  }else if(test[[zeile]][,1] == 2){ #start = 2
    gear <- str_match(substring(d[zeile], symbs_line[i], symbs_line[i]+2), numbers)
  }else if (test[[zeile]][,1] == 3){ #start = 3
    gear <- str_match(substring(d[zeile], symbs_line[i]+1, symbs_line[i]+3), numbers)
  }  
}
gears <- append(gears, gear)  
}





sum <- 0
for (line in 1:length(d)){
  symbs_line <- str_locate_all(d[line], Symbols)[[1]]
  if (is_empty(symbs_line)){
  }else if (line == 1){
    for (i in 1:length(symbs_line[,1])){
      line1 <-str_locate_all(substring(d[line], symbs_line[i]-1, symbs_line[i]+1),numbers)
      line2 <-str_locate_all(substring(d[line+1], symbs_line[i]-1, symbs_line[i]+1), numbers)
      
      umgeb <- length(line1) + length(line2)
      if(umgeb == 2){
        
      }
        sum <- max(sum, umgeb)
    }
  }else if(line == length(d)){
    for (i in 1:length(symbs_line[,1])){
      line1 <-str_locate_all(substring(d[line-1], symbs_line[i]-1, symbs_line[i]+1),numbers)
      line2 <-str_locate_all(substring(d[line], symbs_line[i]-1, symbs_line[i]+1), numbers)
      umgeb <- length(line1) + length(line2)
        sum <- max(sum, umgeb)
      }
  }else{
    for (i in 1:length(symbs_line[,1])){
      line1 <-str_locate_all(substring(d[line-1], symbs_line[i]-1, symbs_line[i]+1),numbers)
      line2 <-str_locate_all(substring(d[line], symbs_line[i]-1, symbs_line[i]+1), numbers)
      line3 <-str_locate_all(substring(d[line + 1], symbs_line[i]-1, symbs_line[i]+1), numbers)
      
      
      umgeb <- length(line1) + length(line2) + length(line3)
      
      if(umgeb == 2){
        
        
        gear <- num1 * num2
      }
      
    }
  }
}
gear
