test.discount.rate.vector_BegPeriodTrue <- function()
{
  #Appling to the first period (begin.of.period=TRUE)
  drv <-  discount.rate.vector(0.10, 1, TRUE)
  checkIdentical( drv[1], 0.9090909)

  drv <-  discount.rate.vector(0.10, 2, TRUE)
  checkIdentical( drv[1], 0.9090909)  
  checkIdentical( drv[1], 0.8264463)
  

}
test.discount.rate.vector.value_BegPeriodFalse <- function()
{
  #Appling to the second period (begin.of.periodo=FALSE)
  drv <-  discount.rate.vector(0.10, 1, FALSE)
  checkIdentical( drv[1], 1)

  drv <-  discount.rate.vector(0.10, 2, FALSE)
  checkIdentical( drv[1], 1)
  checkIdentical( drv[2], 0.9090909)
}