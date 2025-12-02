library(stringr)

input <- readLines("input")

#part1
start = 50
counter = 0

for (rotation in input){
  
  direction <- substring(rotation, 1, 1)
  if (direction == "L"){
    start <-  start - as.numeric(substring(rotation, 2))
  }else if (direction == "R"){
    start <- start + as.numeric(substring(rotation, 2))
  }
  start <- start %% 100
  if (start == 0){
    counter <- counter + 1
  }
  
}

#part2

start = 50
counter = 0

for (rotation in input){
  
  direction <- substring(rotation, 1, 1)
  if (direction == "L"){
    if (start == 0){
      counter <- counter - 1
    }
    start <-  start - as.numeric(substring(rotation, 2))
    
  }else if (direction == "R"){
    start <- start + as.numeric(substring(rotation, 2))
  }
  if (start < 0 && start %% 100 == 0){
    counter <- counter + 1
  }
  counter <- counter + abs(start%/%100)
  if (start == 0){
    counter <- counter + 1
  }
  start <- start %% 100
}

