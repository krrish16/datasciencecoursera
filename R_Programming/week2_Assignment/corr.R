corr <- function(directory,threshold=0)
{
  directory <- ("G:/R Programming/W2_Assign/specdata/")
  files_list <- as.character(list.files(directory))
  filepath <- paste(directory,files_list, sep="")
  vec = c()
  for(i in 1:length(files_list))
  {
    cfile <- read.csv(filepath[i], header= TRUE , sep = ',')
    sum_com <- sum(complete.cases(cfile))
    if(sum_com > threshold)
    {
      na_Sulfate <- cfile[which(!is.na(cfile$sulfate)), ]
      na_removed <- na_Sulfate[which(!is.na(na_Sulfate$nitrate)), ]
      vec <- c(vec, cor(na_removed$sulfate, na_removed$nitrate))    
    }
  }
  vec
}


#test cases
cr <- corr("specdata", 150)
head(cr)
summary(cr)
cr <- corr("specdata", 400)
head(cr)
summary(cr)
cr <- corr("specdata", 5000)
summary(cr)
length(cr)
cr <- corr("specdata")
summary(cr)
length(cr)