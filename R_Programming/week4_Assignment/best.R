best<- function(state, outcome)
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
  
  req_row <- which(as.numeric(data2[ ,col]) == min(as.numeric(data2[ ,col]), na.rm = TRUE))      # ***                      #Getting required row and hospital      
  req_hosp <- data2[req_row,2]
  req_hosp <- sort(req_hosp)
  return(req_hosp[1])
}
