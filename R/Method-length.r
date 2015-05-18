#' @name length
#' 
#' @title length
#' 
#' @description It returns the number of observations into a daily precipitation serie.
#' 
#' @aliases length DailyPrecipitationSerie-methods
#' 
#' @author Lucas Venezian Povoa
#' 
#' @exportMethod length
setMethod("length", "DailyPrecipitationSerie",
   definition = function(x) {
      base::length(x@precipitation)
   }
)