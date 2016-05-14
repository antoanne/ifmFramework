#' Calculate the Inflation-free Interest Rate.
#' 
#' @name inflation.free.interest.rate
#' 
#' @aliases IFIR IfIR ifir
#' 
#' @param interest.rate A number that represents the nominal Interest Rate, 
#' presented by year.
#' @param inflation.rate A number that represents the Inflation Rate, presented 
#' by year.
#' 
#' @export
#'
#' @return Returns the inflation-free interest rate
#' 
#' @keywords inflation-free, interest rate
#' 
#' @family financial
#' 
#' @examples
#'
#' ex.ifir <- inflation.free.interest.rate(14.25, 12)
#' 
inflation.free.interest.rate <- IFIR <- IfIR <- ifir <-
function(interest.rate = 14.25, inflation.rate = 7.59) {
  return (100*((1+interest.rate/100)/(1+inflation.rate/100) - 1))
}
