pollutantmean <- function(directory,pollutant,id=1:332)
{ 
  directory <- ("G:/R Programming/W2_Assign/specdata/")
  filepath <- paste(directory,as.character(list.files(directory)), sep="")
  vec <- c()
  for(i in id)
  {
    cfile <- read.csv(filepath[i], header= TRUE , sep = ',')
    vec <- c(vec,cfile[[pollutant]])
  }
  mean(vec,na.rm = TRUE) 
}

#test cases
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)