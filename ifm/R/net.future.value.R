#' Vectorize the Future Value
#' 
#' @name net.future.value
#' 
#' @aliases npv
#' 
#' @param cfs A vector with a series of cash flows.
#' @param interest.rate A number that represents the nominal Interest Rate, 
#' presented by year.
#' @param begin.of.period A boolean that represents if the Tax Rate will be 
#' applied at the begining of period. FALSE by default.
#' 
#' @export
#' 
#' @keywords futureValue
#' 
#' @family financial
#' 
#' @examples
#'
#' ex.nfv <- net.future.value(c(-350,100,200,150,75), 6.19, TRUE)
#' 
net.future.value <-
function(cfs, interest.rate, begin.of.period=FALSE) {
  time.instance <- if(begin.of.period) {0:(length(cfs)-1)} else {1:(length(cfs))}
  tax.rate <- ((1 + (interest.rate/100)) ^ time.instance)
  return (cfs * tax.rate)
}
