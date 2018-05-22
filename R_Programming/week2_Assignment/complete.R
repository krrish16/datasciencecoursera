complete <- function(directory,id = 1:332)
{
  directory <- ("G:/R Programming/W2_Assign/specdata/")
  filepath <- paste(directory,as.character(list.files(directory)), sep="")
  nobs = c()
  for(i in id)
  {
    cfile <- read.csv(filepath[i], header= TRUE , sep = ',')
    nobs <- c(nobs,sum(complete.cases(cfile)))
  }
  data.frame(id,nobs)
}

#test cases
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
