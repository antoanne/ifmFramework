#' Net present value generalized.
#' Returns the net present value discount vector of a generalized cash flow stream.
#' input: relation csf={(vi,ti)} where vi is the element at time ti (byrow=F)
#' ti is an integer
#'
#'
#' @name npvg
#'
#' @param csf cash flow stream vector
#' @param r rate
#'
#' @return generalized cash flow stream
#' @export
#'
npvg<-function (csf,r=0.01) {
  d<-vector(length=length(csf))
  d<-1/(1+r)^csf[,2]
  v<-sum(d*csf[,1])
  v
}
