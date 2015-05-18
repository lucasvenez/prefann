#' @name min
#' 
#' @title Min precipitation along with its date
#' 
#' @description It gets the first minimum precipitation value along with its respective date.
#' 
#' @return the first minimum precipitation value along with its respective date.
#' 
#' @author Lucas Venezian Povoa
#' 
#' @exportMethod min
setGeneric("min", 
   function(x, ..., na.rm = FALSE) {
      standardGeneric("min")      
   },
   useAsDefault = function(x, ..., na.rm = FALSE) {
      base::min(x, ..., na.rm);
   }
)

setMethod("min", "DailyPrecipitationSerie",
   definition = function(x, na.rm = FALSE) {
      i = which(x@precipitation == base::min(x@precipitation, na.rm = na.rm))[1]
      data.frame(precipitation = x@precipitation[i], date = x@date[i])                
   }
)