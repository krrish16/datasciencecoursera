rankall <- function(outcome, num = "best") {
                                                                             ## Read data
  data1 <- read.csv("outcome-of-care-measures.csv")
  
                                                                            ## validating  
  if (!((outcome == "heart attack") | (outcome == "heart failure")
        | (outcome == "pneumonia"))) {
    stop ("invalid outcome")
  }
  
  col <- if (outcome == "heart attack") {
    11
  } else if (outcome == "heart failure") {
    17
  } else {
    23
  }
  
  data1[, col] <- as.numeric(levels(data1[, col])[data1[, col]])
  data1[, 2] <- as.character(data1[, 2])
  
  ans <- vector()
  
  states <- levels(data1[, 7])
  
  for(i in 1:length(states)) {
    state_data <- data1[grep(states[i], data1$State), ]
    order_data <- state_data[order(state_data[, col], state_data[, 2], 
                                 na.last = NA), ]
    hosp <- if(num == "best") {
      order_data[1, 2]
    } else if(num == "worst") {
      order_data[nrow(order_data), 2]
    } else{
      order_data[num, 2]
    }
    ans <- append(ans, c(hosp, states[i]))
  }
  
  ans <- as.data.frame(matrix(ans, length(states), 2, byrow = TRUE))
  colnames(ans) <- c("hospital", "state")
  rownames(ans) <- states
  
  ans                                                                         #Thanks to https://github.com/DanieleP/PA3-tutorial for his tutorial
}