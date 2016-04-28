utils.build <- function() {
  roxygen2::roxygenise()
  
  setwd("../")
  
  system("R CMD check ifm")
  
  setwd("ifm")
}