Disc<-function(r,n,bop=0){
  #r: tax rate
  #n:number of periods
  #bop: accruin time of cash flow element - bop=0 "End of period"
  if(bop==0){
    e<-1:n
  }
  else{
    e<-0:(n-1)
  }
  
  t<-1/(1+r)
  txret<-t^e
  txret
}