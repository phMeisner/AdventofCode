library(stringr)

input <- readLines("input")

#part1
sum <- 0

for (i in input) {
  number1 <- max(sapply(strsplit(i, ""), as.numeric))
  location <- str_locate(i, as.character(number1))[1]
  
  if (location == nchar(i)) {
    number2 <- number1
    number1 <- max(sapply(strsplit(i, "")[[1]][1:(nchar(i) - 1)], as.numeric))
  } else{
    number2 <- max(sapply(strsplit(i, "")[[1]][(location + 1):nchar(i)], as.numeric))
  }
  
  joltage <- as.numeric(paste0(as.character(number1), as.character(number2)))
  sum <- sum + joltage
}
sum



#part2
sum <- 0

for (i in input) {
  number <- ""
  location <- 0
  for (last in c(11:0)) {
    number1 <- max(sapply(strsplit(i, "")[[1]][(location + 1):(nchar(i) - last)], as.numeric))
    
    location <- location + str_locate(substring(i, location + 1), as.character(number1))[1]
    number <- paste0(as.character(number), as.character(number1))
  }
  sum <- sum + as.numeric(number)
}
sum
sprintf("%1.f",sum)
