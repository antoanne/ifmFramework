# TODO: aplicar o desconto da taxa.
mmf.get.breakeven <- function(mmf.npv) {
  all.npv.breakeven <- list()
  for (count in 1:length(mmf.npv)) {
    current.npv.matrix <- (matrix(unlist(mmf.npv[[count]]),
                                  ncol = length(mmf.npv[[1]][[1]]),
                                  byrow = T))
    current.cfs <- cumsum(colSums(current.npv.matrix))
    current.cfs[which(current.cfs < 0)] = 0
    all.npv.breakeven[[count]] <- min(which(current.cfs > 0))
  }
  return(all.npv.breakeven)
}