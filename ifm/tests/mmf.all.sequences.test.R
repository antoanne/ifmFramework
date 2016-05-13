test.mmf.all.sequences <- function() {
  ex.activities.predecessors<-list(0,1,2,3,1,5,c(4,6))
  expected.result <- list(c(1,2,3,4,5,6,7),c(1,2,3,5,4,6,7),c(1,2,3,5,6,4,7),c(1,2,5,3,4,6,7),c(1, 2, 5, 3, 6, 4, 7),c(1,2,5,6,3,4,7),c(1,5,2,3,4,6,7),c(1,5,2,3,6,4,7),c(1,5,2,6,3,4,7), c(1, 5, 6, 2, 3, 4, 7))
  ex.mmf.seq <- mmf.all.sequences(ex.activities.predecessors)
  for (i in 1:10) {
    for (j in 1:7){
      checkIdentical(expected.result[[i]][[j]],ex.mmf.seq[[i]][[j]])
    }
  }

  ex.activities.predecessors<-list(0,1,2,3,3,3,c(4,5),6,c(7,8),9 )
  expected.result <- list(c(1, 2,  3,  4,  5,  6,  7,  8  ,9, 10),  c(1,  2,  3,  4,  5, 6,  8,  7  ,9, 10),c(1,  2,  3,  4,  5,  7,  6,  8  ,9, 10),  c(1,  2,  3,  4,  6,  5,  7,  8  ,9, 10),  c(1,  2,  3,  4,  6,  5,  8,  7  ,9, 10),c(1,  2,  3,  4,  6,  8,  5,  7  ,9, 10),  c(1,  2 , 3,  5,  4,  6,  7,  8  ,9, 10),  c(1,  2 , 3,  5,  4,  6,  8,  7  ,9, 10),   c(1,  2 , 3,  5,  4,  7,  6,  8  ,9, 10),  c(1,  2 , 3,  5,  6,  4,  7,  8  ,9, 10),  c(1,  2 , 3,  5,  6,  4,  8,  7  ,9, 10),c(1,  2 , 3,  5,  6,  8,  4,  7  ,9, 10),  c(1,  2 , 3,  6,  4,  5,  7,  8  ,9, 10),  c(1,  2 , 3,  6,  4,  5,  8,  7  ,9, 10),  c(1,  2 , 3,  6,  4,  8,  5,  7  ,9, 10),  c(1,  2 , 3,  6,  5,  4,  7,  8  ,9, 10),   c(1,  2 , 3,  6,  5,  4,  8,  7  ,9, 10),  c(1,  2 , 3,  6,  5,  8,  4 , 7  ,9, 10),  c(1,  2 , 3,  6,  8,  4,  5,  7  ,9, 10),c(  1,  2,  3,  6,  8,  5,  4,  7,  9, 10))
  ex.mmf.seq <- mmf.all.sequences(ex.activities.predecessors)
  for (i in 1:20) {
    for (j in 1:10){
      checkIdentical(expected.result[[i]][[j]],ex.mmf.seq[[i]][[j]])
    }
  }
}