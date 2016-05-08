test.present.value <- function()
{
  vp <- present.value(1000, 0.88, 12)
  checkIdentical(round(vp, digits = 2), 900.20)
  
  vp <- present.value(1000, 1, 12)
  checkIdentical(round(vp, digits = 2), 887.45)

  vp <- present.value(1000, 1.1425, 12)
  checkIdentical(round(vp, digits = 2), 872.56)
  
  vp <- present.value(1000, 1.2, 12)
  checkIdentical(round(vp, digits = 2), 866.63)
  
  vp <- present.value(1000, 1.22, 12)
  checkIdentical(round(vp, digits = 2), 864.58)
  
}