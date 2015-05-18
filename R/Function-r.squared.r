#' @name r.squared
#' 
#' @title R-squared
#' 
#' @description It calculate the accurracy metric R-squared:
#' 1 - (sum((y-yhat)^2)/sum((y-mean(y))^2))
#' 
#' @author Lucas Venezian Povoa
#' 
#' @export
r.squared <- function(y, yhat) 1 - (sum((y-yhat)^2)/sum((y-mean(y))^2))