#' The cash flows incomes/outcomes applying the Tax Rate to the present time.
#' @name discounted.csf
#' @aliases discounted_csf discountedCsf
#' @param cfs A vector with a series of cash flows.
#' @param interest.rate A number that represents the nominal Interest Rate, 
#' presented by year.
#' @param begin.of.period A boolean that represents if the Tax Rate will be 
#' applied at the begining of period. FALSE by default, the Tax Rate will be 
#' applied to the second period.
#' @export
#' @return The vector of cash flows incomes/outcomes applying the Tax Rate to
#' the present time.
#' @keywords cash flow series
#' @family financial
#' @examples
#'
#' ex.disc.csf <- discounted.csf(c(-350,100,200,150,75), 0.0619, FALSE)
#' 
discounted.csf <- discounted_csf <- discountedCsf <- 
  function(cfs = c(-350,100,200,150,75), 
           interest.rate = 0.0619, 
           begin.of.period = FALSE) 
  {
    time.instance <- if(begin.of.period) {0:(length(cfs)-1)} else {1:(length(cfs))}
    tax.rate <- (1 / ((1 + (interest.rate)) ^ time.instance))
    return (cfs * tax.rate)
  }