#' @name missingDates
#' 
#' @title Get Missing Dates
#' 
#' @description It gets the missing dates into a precipitation serie described via an object of class
#' DailyPrecipitationSerie.
#' 
#' @aliases missingDates DailyPrecipitationSerie-methods
#' 
#' @exportMethod missing.dates
setGeneric("missing.dates", def = function(object) {
      standardGeneric("missing.dates")
   }
)

setMethod("missing.dates", "DailyPrecipitationSerie",
   definition = function(object) {
      
      fullSerie <- seq.Date(base::min(object@date), base::max(object@date), by = 1)
      
      return(as.Date(setdiff(as.character(fullSerie), as.character(object@date))))
   }
)