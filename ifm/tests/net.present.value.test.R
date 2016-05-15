test.net.present.value_BegPeriodTrue <- function()
{
  npv <- net.present.value(c(-1000,100, 100), 10.0,TRUE)
  checkIdentical( round (sum(npv), digits =4),-751.3148)
  
  npv <- net.present.value(c(-300,100,100,100,100,100), 14.5, TRUE)
  checkIdentical(round(sum(npv), digits = 3), 34.2555)

}
test.net.present.value_BegPeriodFalse <- function()
{
  #Appling to the second period (begin.of.periodo=FALSE)
  npv <- net.present.value(c(-1000,100, 100), 10.0, FALSE)
  checkIdentical( round (sum(npv), digits =2),-826.45)
}