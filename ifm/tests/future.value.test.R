test.future.value <- function()
{
  vp <- future.value(1000, 0.9, 12)
  checkIdentical(round(vp, digits = 2), 1113.51)
  
  vp <- future.value(1000, 1, 12)
  checkIdentical(round(vp, digits = 2), 1126.83)

  vp <- future.value(1000, 1.1425, 12)
  checkIdentical(round(vp, digits = 2), 1146.05)
  
  vp <- future.value(1000, 1.2, 12)
  checkIdentical(round(vp, digits = 2), 1153.89)
  
  vp <- future.value(1000, 1.24, 12)
  checkIdentical(round(vp, digits = 2), 1159.38)
  
}