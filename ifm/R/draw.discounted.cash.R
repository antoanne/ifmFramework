#' Draw Discounted Cash vs Time
#' 
#' @name draw.discounted.cash
#' 
#' @aliases draw_discounted_cash
#' 
#' @param discounted.cash A vector with discounted cash flow for each timestamp.
#' @param smooth Multiplier used to smooth line
#' @param title Used to define the title of plot
#' 
#' @export draw.discounted.cash
#' 
#' @family draw
#' 
draw.discounted.cash <- draw_discounted_cash <-
  function(discounted.cash, smooth = 1, title = "Discounted Cash vs Time") {
    plot(spline(c(0, discounted.cash), n = smooth*length(c(0, discounted.cash))), 
         type="l", pch=20, xaxt='n',
         xlab="Time", ylab="Discounted Cash")
    title(title)
    abline(h=1)
  }