#' Calculate the future value of an asset at a specific date.
#' It measures the nominal future sum of money that a given sum of money is
#' "worth" at a specified time in the future assuming a certain interest rate, 
#' or more generally, rate of return.
#' 
#' @name future.value
#' 
#' @aliases future_value futureValue
#' 
#' @param present.value A number that represents the present value of the money.
#' @param interest.rate A number that represents the interest rate.
#' @param number.of.periods A number that represent the number of periods.
#' 
#' @export
#' 
#' @keywords futureValue
#' 
#' @family financial
#' 
#' @examples
#'
#' fv.1 <- future.value(1000, 1.1425, 12)
#' print(fv.1)
#' 

future.value <- future_value <- futureValue <- 
  function(present.value, interest.rate, number.of.periods) {
    return (present.value * (1 + (interest.rate/100)) ^ number.of.periods)
  }
