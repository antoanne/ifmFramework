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
  
  # an initial outlay of $10,000, oOver the course of three years, the project is expected to generate revenues of $2,000, $7,000 and $11,000, respectively. The anticipated discount rate is 4.5%. 
  # NPV = $1,913.88 + $6,410.11 + $9,639.26 - $10,000')
  ex.npv <- net.present.value(c(-10000,2000,7000,11000), 4.5, TRUE)
  checkIdentical (round (npv, digits = 2), 7963.25)
  
  
  # Calculate the net present value of a project which requires an initial investment of $243,000 and it is expected to generate a cash inflow of $50,000 each month for 12 months. Assume that the salvage value of the project is zero. The target rate of return is 12% per annum.
  ex.npv <- net.present.value(c(-243000,50000,50000,50000,50000,50000,50000,50000,50000,50000,50000,50000,50000), 1.0, TRUE)
  checkIdentical( round (npv, digits =1) ,319753.9  )
  
  #An initial investment of $8,320 thousand on plant and machinery is expected to generate cash inflows of $3,411 thousand, $4,070 thousand, $5,824 thousand and $2,065 thousand at the end of first, second, third and fourth year respectively. At the end of the fourth year, the machinery will be sold for $900 thousand. Calculate the net present value of the investment if the discount rate is 18%.
  ex.npv <- net.present.value(c(-8320,3411, 4070,5824,2965), 18.0, TRUE)
  checkIdentical( round (npv, digits =2),2567.67)
  
  #Appling to the second period (begin.of.periodo=FALSE)
  ex.npv <- net.present.value(c(-1000,100, 100), 10.0, FALSE)
  checkIdentical( round (npv, digits =3),809,091)
  
}