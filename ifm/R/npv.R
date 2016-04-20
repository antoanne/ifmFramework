npv <-
function(cfs, r, bop=TRUE) {
  e <- if(bop) {0:(length(cfs)-1)} else {1:(length(cfs))}
  tax <- (1/((1+(r/100))^e))
  return (cfs * tax)
}
