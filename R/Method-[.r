#' @name Extract
#' 
#' @title Extract or Replace Parts of an Object of DailyPrecipitationSerie Class
#' 
#' @description Operators acting on DailyPrecipitationSerie objects to extract
#' or replace dates and precipitation values.
#'
#' @aliases [ DailyPrecipitationSerie-methods
#'  
#' @author Lucas Venezian Povoa
#' 
#' @exportMethod [
setMethod("[", "DailyPrecipitationSerie",
   definition = function(x, i, j, ..., drop) {
      x@precipitation <- x@precipitation[i]
      x@date          <- x@date[i]
      x
   }
)