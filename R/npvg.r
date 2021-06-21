npvg<-function (csf,r=0.01) {
#returns the net present value discount vector of a generalized cash flow stream
#input: relation csf={(vi,ti)} where vi is the element at time ti (byrow=F)
#ti is an integer
d<-vector(length=length(csf))
d<-1/(1+r)^csf[,2]
v<-sum(d*csf[,1])
v
}



