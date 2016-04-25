#   IFM R package
#
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


#' Calculate the future value of an asset at a specific date.
#' It measures the nominal future sum of money that a given sum of money is
#' "worth" at a specified time in the future assuming a certain interest rate, 
#' or more generally, rate of return.
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
#' @examples
#'
#' fv.1 <- future.value(1000, 1.1425, 12)
#' print(fv.1)
#' 
#' fv.2 <- future_value(1000, 1.1425, 12)
#' print(fv.2)
#' 
#' fv.3 <- futureValue(1000, 1.1425, 12)
#' print(fv.3)
#' 

future.value <- future_value <- futureValue <- 
  function(present.value, interest.rate, number.of.periods) {
    return (present.value * (1 + (interest.rate/100)) ^ number.of.periods)
  }
