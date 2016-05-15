test.future.value_BegPeriodTrue <- function()
{
  nfv <- net.future.value(c(-3000,1000,1000,1000,1000,1000), 5.0, FALSE)
  checkIdentical(round(nfv[[1]], digits = 2), -3000.00)
  checkIdentical(round(nfv[[2]], digits = 2), 1050.00)
  checkIdentical(round(nfv[[3]], digits = 2), 1102.50)
  checkIdentical(round(nfv[[4]], digits = 2), 1157.63)
  checkIdentical(round(nfv[[5]], digits = 2), 1215.51)
  checkIdentical(round(nfv[[6]], digits = 2), 1276.28)
}
test.future.value_BegPeriodFalse <- function()
{  
  nfv <- net.future.value(c(-3000,1000,1000,1000,1000,1000), 5.0, TRUE)
  checkIdentical(round(nfv[[1]], digits = 2), -3150.00)
  checkIdentical(round(nfv[[2]], digits = 2), 1102.50)
  checkIdentical(round(nfv[[3]], digits = 2), 1157.63)
  checkIdentical(round(nfv[[4]], digits = 2), 1215.51)
  checkIdentical(round(nfv[[5]], digits = 2), 1276.28)
  checkIdentical(round(nfv[[6]], digits = 2), 1340.10)
}