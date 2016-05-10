#' Draw the graph of cash flow in order to facilitate the study and the effects
#' of the analysis of a certain application.
#'
#' Cash flow is a mathematical concept that can be plotted in order to
#' facilitate the study and the effects of the analysis of a certain
#' application, which may be an investment loan, finance, etc.
#'
#' Normally a cash flow contains inputs and outputs of capital, marked in
#' the timeline starting at t = 0.
#'
#' A typical example is the graph that represents a bank loan held by a form
#' of business that shall return this loan in n equal installments over
#' the following months.
#' E1 E2 E3 ... En-1 En
#'  ^
#'  I
#'  0 1 2 3 ... n-1 n
#'    I I I
#'    V V V 
#'  S1 S2 S3 ... Sn-1 Sn
#'
#' Is possible to note that the value is entered in the company's cash (cash was
#' positive) and S1, S2, ..., Sn are the values of the parcels will leave
#' the company's cash (negative).
#'
#' The fact that each arrow is pointing upward (positive) or down (negative),
#' it is assumed by convention, and the cash flow will depend on who receives
#' or pays the Capital at a certain time, and:
#'
#' t = 0 indicates the current day;
#' 
#' Ek is the capital input at a time k;
#' 
#' Sk is the capital output at a time k.
#' 
#' 
#'
#' @name draw.cfs
#'
#' @aliases draw_cfs drawCfs
#' @param cfs A vector with a series of cash flows.
#' @param gt A title for the graph.
#' @param to.file Save or not the graph in the file 
#' @param filename File's name 
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
#'

draw.cfs <- draw_cfs <- drawCfs <- 
function(cfs, gt = 'Cash Flow Graphic', to.file=FALSE, 
         filename="output/draw.cfs.graph.png") {
  if(to.file) {png(filename)}
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
  if(to.file) {dev.off()}
}
