test.future.value <- function()
{
  nfv <- net.future.value(c(-300,100,100,100,100,100), 14.5, TRUE)
  checkIdentical(round(nfv, digits = 2), 0)
  
}