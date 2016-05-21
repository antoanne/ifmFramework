#' Calculate the future value of an asset at a specific date.
#' 
#' @name future.value
#' 
#' @aliases future_value futureValue
#' 
#' @description It measures the nominal future sum of money that a given sum of 
#' money is "worth" at a specified time in the future assuming a certain 
#' interest rate, or more generally, rate of return.

#' 
#' @param present.value A number that represents the present value of the money.
#' @param interest.rate A number that represents the interest rate.
#' @param number.of.periods Times that interest rate should be applied.
#' 
#' @return future value 
#' 
#' @export
#' 
#' @keywords futureValue
#' 
#' @family financial
#' 
#' @examples
#'
#' ex.fv <- future.value(1000, 0.011425, 12)
#' 

future.value <- future_value <- futureValue <- 
  function(present.value, interest.rate, number.of.periods) {
    return (present.value * (1 + (interest.rate)) ^ number.of.periods)
  }
