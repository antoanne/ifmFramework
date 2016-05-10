test.mmf.all.sequences <- function() {
  ex.activities.predecessors<-list(0,1,2,3,1,5,c(4,6))
  expected.result <- list(c(2,2,3,4,5,6,7),c(1,2,3,5,4,6,7),c(1,2,3,5,6,4,7),c(1, 2, 5, 3, 4, 6, 7), c(1, 2, 5, 3, 6, 4, 7),c(1, 2, 5, 6, 3, 4, 7), c(1, 5, 2, 3, 4, 6, 7),c(1,5, 2, 3, 6, 4, 7),c(1, 5, 2, 6, 3, 4, 7),c(1, 5, 6, 2, 3, 4, 7) ) 
  ex.mmf.seq <- mmf.all.sequences(ex.activities.predecessors)
  print (ex.mmf.seq)
  
  ex.activities.predecessors<-list(0,1,2,3,3,3,c(4,5),6,c(7,8),9 )
  ex.mmf.seq <- mmf.all.sequences(ex.activities.predecessors)
  print (ex.mmf.seq)
  
  
}