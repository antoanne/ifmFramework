source('..\net.present.value.R')

test.examples <- function() {
  print (' an initial outlay of $10,000, oOver the course of three years, the project is expected to generate revenues of $2,000, $7,000 and $11,000, respectively. The anticipated discount rate is 4.5%. ') 
  print ('NPV = $1,913.88 + $6,410.11 + $9,639.26 - $10,000')
  ex.npv <- net.present.value(c(-10000,2000,7000,11000), 4.5, TRUE)
  print(sum(ex.npv))
  checkEquals(7963.248,sum(ex.npv)  )
  
  
  print (' Calculate the net present value of a project which requires an initial investment of $243,000 and it is expected to generate a cash inflow of $50,000 each month for 12 months. Assume that the salvage value of the project is zero. The target rate of return is 12% per annum.')
  ex.npv <- net.present.value(c(-243000,50000,50000,50000,50000,50000,50000,50000,50000,50000,50000,50000,50000), 1.0, TRUE)
  print(sum(ex.npv))
  checkEquals(319753.9,sum(ex.npv)  )
  print  ('An initial investment of $8,320 thousand on plant and machinery is expected to generate cash inflows of $3,411 thousand, $4,070 thousand, $5,824 thousand and $2,065 thousand at the end of first, second, third and fourth year respectively. At the end of the fourth year, the machinery will be sold for $900 thousand. Calculate the net present value of the investment if the discount rate is 18%.')
  ex.npv <- net.present.value(c(-8320,3411, 4070,5824,2965), 18.0, TRUE)
  print(ex.npv)
  print(sum(ex.npv))
  checkEquals(2567.669,sum(ex.npv)  )
  
}

test.deactivation <- function()
{
  DEACTIVATED('Deactivating this test function')
}
