#' Vectorize the Discount Rate
#' 
#' @name discount.rate.vector
#' 
#' @aliases disc
#' 
#' @param interest.rate A number that represents the nominal Interest Rate, presented by year.
#' @param number.of.periods Times that interest rate should be applied.
#' @param begin.of.period A boolean that represents if the Tax Rate will be applied at the begining of period. FALSE by default.
#' 
#' @export
#' 
#' @description Generate a vector with discount rate to be applied to each of the time periods.
#' 
#' @keywords discount rate, interest rate
#' 
#' @family financial
#' 
#' @examples
#'
#' ex.disc.vector <- discount.rate.vector(6.19, 12)
#' 
discount.rate.vector <- disc <-
function(interest.rate, number.of.periods, begin.of.period=FALSE) {
  tax.rate <- 1/(1+interest.rate)
  time.instance<- if(begin.of.period) {0:(number.of.periods-1)} else {1:number.of.periods}
  return(tax.rate^time.instance)
}
