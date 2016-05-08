test.present.value <- function()
{
  npv <- net.present.value(c(-300,100,100,100,100,100), 14.5, TRUE)
  checkIdentical(round(npv, digits = 2), 39.22)
  
  npv <- net.present.value(c(-300,100,100,100,100,100), 12.5, TRUE)
  checkIdentical(round(npv, digits = 2), 56.06)  
  
  npv <- net.present.value(c(-500,200,200,200,200,200), 12.5, TRUE)
  checkIdentical(round(npv, digits = 2), 212.11)  

  npv <- net.present.value(c(-500,200,200,200,200,200), 11, TRUE)
  checkIdentical(round(npv, digits = 2), 239.18)
  
}