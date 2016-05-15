test.cpm.all.schedule <- function() {
   ex.cpm.activities.duration <- c(1,4,5,7,2,3,1)
   ex.cpm.activities.successors <- list(c(2,3), 4, c(4,5), 6, 7, 7, c(0))
   ex.cpm <- critical.path.method(ex.cpm.activities.duration, ex.cpm.activities.successors)
   ex.cpm.activities.schedule <- cpm.all.schedule(ex.cpm[[1]], ex.cpm[[3]] - ex.cpm[[1]])
   print ("CPM All Schedule Result")
   print (ex.cpm.activities.schedule)
   expected.result = matrix (0,nrow = 18, ncol = 7)
   expected.result <- rbind(c(0,1,1,6,6,13,16), c(0,1,1,6,7,13,16),c(0,1,1,6,8,13,16),c(0,1,1,6,9,13,16),c(0,1,1,6,10,13,16),c(0,1,1,6,11,13,16),c(0,1,1,6,12,13,16), c(0,1,1,6,13,13,16), c(0,1,1,6,14,13,16),  c(0,2,1,6,6,13,16),c(0,2,1,6,7,13,16), c(0,2,1,6,8,13,16),c(0,2 ,1,6,9,13,16), c(0,2,1,6,10,13,16),c(0,2,1,6,11,13,16),c(0,2,1,6,12,13,16), c(0,2,1,6,13,13,16),c(0,2,1,6,14,13,16))
   print ("Expected Result")
   print (expected.result)
   for (i in 1:18) {
     for (j in 1:7){
        checkIdentical(expected.result[i,j],ex.cpm.activities.schedule[i,j])
    }
  }
}