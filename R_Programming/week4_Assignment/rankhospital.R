rankhospital <- function(state, outcome , num = "best")
{
  data1 <- read.csv("outcome-of-care-measures.csv",colClasses = "character")     #Read data
  
  if(!any(state == data1[["State"]])){                                           #Validating input
    stop("invalid state")}
  else if((outcome %in% c("heart attack", "heart failure",                       
                          "pneumonia")) == FALSE) {                              # ***
    stop("invalid outcome")
  }
  
  data2 <- subset(data1, State == state) 
  
  if (outcome == "heart attack") {                                               #Getting Column number
    col <- 11
  }
  else if (outcome == "heart failure") {
    col <- 17
  }
  else {
    col <- 23
  }
  
  data2[ ,col] <- as.numeric(data2[ ,col])        
  data3 <- data2[order(data2[ ,col],data2[,2]), ]
  data3 <- data3[(!is.na(data3[ ,col])),]
  
  if(num == "best") {
    data3[1, 2]
  } else if(num == "worst") {
    data3[nrow(data3), 2]
  } else{
    data3[num, 2]
  }
}
