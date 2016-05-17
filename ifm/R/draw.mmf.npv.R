draw.mmf.npv <- function(mmf.npv) {
  mmf.npv.matrix <- matrix(c(cbind(1:nrow(mmf.npv)), unlist(mmf.npv)), nrow(mmf.npv))
  
  ordered.matrix <- (mmf.npv.matrix[do.call(order, c(as.data.frame(mmf.npv.matrix[,2]), decreasing=TRUE) ),])
  
  plot(ordered.matrix[,2], xaxt = "n", xlab="Period", ylab="Cash")
  title("Sorted NPV")
  axis(1, at=1:nrow(ordered.matrix) , labels=ordered.matrix[,1])
}

# draw.mmf.npv(ex.mmf.df.1r["npv"])