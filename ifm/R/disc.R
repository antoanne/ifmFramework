disc <-
function(r, n, bop=FALSE) {
  t< -1/(1+r)
  e<- if(bop) {0:(n-1)} else {1:n}
  return(t^e)
}
