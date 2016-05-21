#' Calculate the present value of an asset at a specific date.
#' 
#' @name present.value
#' 
#' @aliases present_value presentValue
#' 
#' @param future.value A number that represents the future value of the money.
#' @param interest.rate A number that represents the interest rate.
#' @param number.of.periods A number that represent the number of periods.
#' 
#' @export
#' 
#' @description In economics, present value, also known as present discounted 
#' value, is the value of an expected income stream determined as of the date 
#' of valuation. The present value is always less than or equal to the future 
#' value because money has interest-earning potential, a characteristic referred
#' to as the time value of money, except during times of negative interest 
#' rates, when the present value will be less than the future value.
#' 
#' @keywords presentValue
#' 
#' @family financial
#' 
#' @examples
#'
#' ex.pv <- present.value(1000, 0.01425, 12)
#' 

present.value <- present_value <- presentValue <-
  function(future.value, interest.rate, number.of.periods) {
    return (future.value / (1 + (interest.rate)) ^ number.of.periods )
  }
