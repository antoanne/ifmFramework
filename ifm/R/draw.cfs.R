#' Draw the graph of cash flow.
#' 
#' @name draw.cfs
#' 
#' @aliases draw_cfs drawCfs
#' @param cfs A vector with a series of cash flows.
#' @param gt A title for the graph.
#' 
#' @export
#' 
#' @keywords drawcfs
#' 
#' @family financial
#' 
#' @examples
#' 
#' ex.cfs <- c(-2000,1000,1500,-500,500)
#' draw.cfs(ex.cfs,'My Cash Flow')

draw.cfs <- draw_cfs <- drawCfs <- function(cfs, gt = 'Cash Flow Graphic') {
  plot(cfs, xlab="Period", ylab="Cash")
  abline(h = c(0))
  title(gt)
  count <- 0
  for(i in cfs) {
    count <- count + 1
    if(i != 0) { 
      arrows(count, 0, count, i, length=0.1, angle=20)
    }
  }
}
