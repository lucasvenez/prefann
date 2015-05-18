#' @name max
#' 
#' @title Max precipitation along with its date
#' 
#' @description It gets the first minimum precipitation value along with its respective date.
#' 
#' @return the first maximum precipitation value along with its respective date.
#' 
#' @author Lucas Venezian Povoa
#' 
#' @exportMethod max
setGeneric("max", 
   function(x, ..., na.rm = FALSE) {
         standardGeneric("max")      
   },
   useAsDefault = function(x, ..., na.rm = FALSE) {
      base::max(x, ..., na.rm);
   }
)

setMethod("max", "DailyPrecipitationSerie",
   definition = function(x, na.rm = FALSE) {
      i = which(x@precipitation == max(x@precipitation, na.rm = na.rm))[1]
      data.frame(precipitation = x@precipitation[i], date = x@date[i])   
   }
)