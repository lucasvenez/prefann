#' @name length
#' 
#' @aliases length DailyPrecipitationSerie-methods
#' 
#' @author Lucas Venezian Povoa
#' 
#' @exportMethod 
setMethod("length", "DailyPrecipitationSerie",
   definition = function(x) {
      base::length(x@precipitation)
   }
)