#' Draw Discounted Cash vs Time
#' 
#' @name draw.discounted.cash
#' 
#' @aliases draw_discounted_cash
#' 
#' @param discounted.cash A vector with discounted cash flow for each timestamp.
#' 
#' @export draw.discounted.cash
#' 
#' @family draw
#' 
draw.discounted.cash <- draw_discounted_cash <-
  function(discounted.cash) {
    plot(c(0, discounted.cash), type="l", xaxt='n',
         xlab="Time", ylab="Discounted Cash")
    title("Discounted Cash vs Time")
    abline(h=1)
  }