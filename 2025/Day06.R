input <- readLines("input")

#part1

sum <- 0
for (i in 1:length(unlist(strsplit(input[1], " +")))) {
  numbers <- c()
  for (j in 1:4) {
    numbers <- append(numbers, as.numeric(unlist(strsplit(input[j], " +"))[i]))
  }
  if (unlist(strsplit(input[5], " +"))[i] == "*") {
    sum <- sum + prod(numbers)
  } else if (unlist(strsplit(input[5], " +"))[i] == "+") {
    sum <- sum + sum(numbers)
  }
}


#part2

split <- strsplit(input, "")

for (i in 1:length(split[[1]])) {
  if (all(sapply(list(
    split[[1]][i], split[[2]][i], split[[3]][i], split[[4]][i], split[[5]][i]
  ), FUN = identical, " "))) {
    for (j in 1:5) {
      split[[j]][i] <- "|"
    }
  }
}

input_new <- c()
for (i in 1:4) {
  input_new[i] <- strsplit(paste0(split[[i]], collapse = ""), "\\|")
}

sum <- 0
for (i in 1:length(input_new[[1]])) {
  numbers <- c()
  for (j in 1:length(strsplit(input_new[[1]][i], "")[[1]])) {
    numbers <- append(numbers, as.numeric(trimws(
      paste0(
        strsplit(input_new[[1]][i], "")[[1]][j],
        strsplit(input_new[[2]][i], "")[[1]][j],
        strsplit(input_new[[3]][i], "")[[1]][j],
        strsplit(input_new[[4]][i], "")[[1]][j]
      )
    )))
  }
  if (unlist(strsplit(input[5], " +"))[i] == "*") {
    sum <- sum + prod(numbers)
  } else if (unlist(strsplit(input[5], " +"))[i] == "+") {
    sum <- sum + sum(numbers)
  }
}