drawcfs <-
function(cfs) {
  plot(cfs, xlab="Periodo", ylab="y")
  abline(h=c(0))
  title("Fluxo de Caixa")
  count <- 0
  for(i in cfs){
    count <- count + 1
    if(i!=0) { arrows(count,0,count,i,length=0.1,angle=20) }
  }
}
