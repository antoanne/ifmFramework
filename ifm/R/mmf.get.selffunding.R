mmf.get.selffunding <- function(mmf.npv) {
  all.npv.selffunding <- list()
  for (count in 1:length(mmf.npv)) {
    current.npv.matrix <- (matrix(unlist(mmf.npv[[count]]),
                                  ncol = length(mmf.npv[[1]][[1]]),
                                  byrow = T))
    
    current.cfs <- cumsum(colSums(current.npv.matrix))
    
    all.npv.selffunding[[count]] <- which.min(current.cfs)
  }
  return(all.npv.selffunding)
}