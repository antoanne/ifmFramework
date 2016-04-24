#   Copyright (C) 2016 Eber Schmitz <eber@nce.ufrj.br>   
# 	149, Athos da Silveira Ramos Avenue, 
#   Technology Center building, Block A / 2nd floor
#   University City
#	
#   This file is part of IFM R package.
#
#   IFM R package is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   IFM R package is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>
#
###################################################################

#' Draw the graph of cash flow.
#' 
#' @aliases draw_cfs drawCfs
#' @param cfs A vector with a series of cash flows.
#' @param gt A title for the graph.
#' 
#' @export
#' @keywords drawcfs
#' @examples
#'
#' cfs <- c(-2000,1000,1500,-500,500)
#' draw.cfs(cfs,'My Cash Flow')

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
