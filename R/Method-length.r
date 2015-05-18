#' @name length
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