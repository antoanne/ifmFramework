test.future.value <- function()
{
  vp <- future.value(1000, 0.01, 12)
  checkIdentical(round(vp, digits = 2), 1126.83)

  vp <- future.value(1000, 0.011425, 12)
  checkIdentical(round(vp, digits = 2), 1146.05)

  vp <- future.value(1000, 0.012, 12)
  checkIdentical(round(vp, digits = 2), 1153.89)
  
  vp <- future.value(1000, 0.0124, 12)
  checkIdentical(round(vp, digits = 2), 1159.38)
  
}