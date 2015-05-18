#' @name glm4precipitation
#' 
#' @title Generalized Linear Model to Forecast Precipitation
#' 
#' @description It creates a Generalized Linear Model (GLM) to forecast precipitation.
#'
#' @param ... a set of objects of DailyPrecipitationSerie class
#'  
#' @aliases glm4precipitation DailyPrecipitationSerie-methods
#'   
#' @author Lucas Venezian Povoa
#' 
#' @export 
glm4precipitation <- function(...) {
   
   res <- series.format(...)
   return(with(res, glm(precipitation ~ day + month + year)))
}