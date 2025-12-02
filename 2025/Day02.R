library(stringr)

input <- readLines("input")

#part 1

sum <- 0

for(id in str_split(input, ",")[[1]]){
  
  start_range <- as.numeric(str_split(id, "-")[[1]][1])
  end_range <- as.numeric(str_split(id, "-")[[1]][2])
  
  for (number in start_range:end_range){
    string <- as.character(number)
    if (nchar(string)%%2 == 0){
    if (substring(string,1, nchar(string)/2) == substring(string, nchar(string)/2 + 1)){
      sum <- sum + number
    }
    }
  }
}

sum

#part2

sum <- 0

for(id in str_split(input, ",")[[1]]){
  
  start_range <- as.numeric(str_split(id, "-")[[1]][1])
  end_range <- as.numeric(str_split(id, "-")[[1]][2])
  
  for (number in start_range:end_range){
    string <- as.character(number)
      if (grepl("\\b(\\d+)\\1+\\b", string)){
        sum <- sum + number
      
    }
  }
}

sum

