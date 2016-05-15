test.critical.path.method <- function() {
 ex.cpm.activities.duration <- c(4,10,2,4,3,16,4, 1)
 ex.cpm.activities.successors <- list(2, c(3,4),5,6,6,7,8, c(0))
 expected.result <- list(c(0,4,14,14,16,19,35,39),c(4,14,16,18,19,35,39, 40),c(0,4,14,15,16,19,35,39),c(4,14,16,19,19,35,39, 40))
 ex.cpm <- critical.path.method(ex.cpm.activities.duration, ex.cpm.activities.successors)
 print ("CPM Result")
 print (ex.cpm)  
 print ("Expected")
 print (expected.result)
 for (i in 1:4) {
   for (j in 1:8){
       checkIdentical(expected.result[[i]][[j]],ex.cpm[[i]][[j]])
     }
 }
 ex.cpm.activities.duration <- c(1,4,5,7,2,3,1)
 ex.cpm.activities.successors <- list(c(2,3), 4, c(4,5), 6, 7, 7, c(0))
 expected.result <- list(c(0,1,1,6,6,13,16),c(1,5,6,13,8,16,17),c(0,2,1,6,14,13,16),c(1,6,6,13,16,16,17))
 ex.cpm <- critical.path.method(ex.cpm.activities.duration, ex.cpm.activities.successors)
 print ("CPM Result")
 print (ex.cpm)  
 print ("Expected")
 print (expected.result)
 for (i in 1:4) {
    for (j in 1:7){
      checkIdentical(expected.result[[i]][[j]],ex.cpm[[i]][[j]])
  }
 }
 
}