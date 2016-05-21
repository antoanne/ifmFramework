#' Calculate the Inflation-free Interest Rate.
#' 
#' @name ifir
#' 
#' @aliases inflation.free.interest.rate IFIR IfIR
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
#' ex.ifir <- inflation.free.interest.rate(0.1425, 0.0759)
#' 
ifir <- inflation.free.interest.rate <- IFIR <- IfIR <-
  function(interest.rate = 0.1425, inflation.rate = 0.0759) 
    {
      return (((1+interest.rate)/(1+inflation.rate) - 1))
    }