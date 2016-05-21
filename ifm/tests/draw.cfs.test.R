test.draw.cfs_filenamedefault  <- function()
{
  #Test wihtout param of  file name 
  ex.cfs <- c(-2000,1000,1500,-500,500)
  print("Evaluate: 1. If the graph is correct and 2. file default created correctly")
  draw.cfs(ex.cfs,'My Cash Flow')
  

}
test.draw.cfs_passingfilename <- function() 
  {
  #Test with param of  file name 
  ex.cfs <- c(-3000,100000,1500,-5000,500)
  print("Evaluate: 1. If the graph is correct, recorded in the file, not presented")
  draw.cfs(ex.cfs,'My Cash Flow', TRUE,'fileCashFlow')

  }