utils.build <- function() {
  setwd("ifm")
  
  roxygen2::roxygenise()
  
  setwd("../")
  
  system("R CMD check ifm")
  
  
}