#' Draw the graph of cash flow
#'
#' @name draw.cfs
#'
#' @aliases draw_cfs drawCfs
#' @param cfs A vector with a series of cash flows.
#' @param gt A title for the graph.
#' @param to.file Save or not the graph in the file
#' @param filename File's name
#'
#' @description Draw the graph of cash flow in order to facilitate the study and the effects of the analysis of a certain application.
#' @description Cash flow is a mathematical concept that can be plotted in order to facilitate the study and the effects of the analysis of a certain
#' @description  application, which may be an investment loan, finance, etc.
#'
#' @description Normally a cash flow contains inputs and outputs of capital, marked in
#' @description the timeline starting at t = 0.
#'
#' @description A typical example is the graph that represents a bank loan held by a form
#' @description of business that shall return this loan in n equal installments over
#' @description the following months.
#' @description E1 E2 E3 ... En-1 En
#' @description  ^
#' @description  I
#' @description  0 1 2 3 ... n-1 n
#' @description    I I I
#' @description   V V V
#' @description  S1 S2 S3 ... Sn-1 Sn
#'
#' @description Is possible to note that the value is entered in the company's cash (cash was
#' @description positive) and S1, S2, ..., Sn are the values of the parcels will leave
#' @description the company's cash (negative).
#'
#' @description The fact that each arrow is pointing upward (positive) or down (negative),
#' @description it is assumed by convention, and the cash flow will depend on who receives
#' @description or pays the Capital at a certain time, and:
#'
#' @description  t = 0 indicates the current day;
#'
#' @description Ek is the capital input at a time k;
#'
#' @description Sk is the capital output at a time k.
#' @export
#' @return A plot with cash flow series
#' @keywords draw, cash flow series
#'
#' @family financial
#'
#' @importFrom grDevices dev.off png
#' @importFrom graphics abline arrows axis barplot legend title
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
