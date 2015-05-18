#' @name addOrReplacePrecipitation
#'
#' @title Add or replace precipitation
#' 
#' @description It adds or replaces a precipitation value in millimetesr along with its occurance date into 
#' an object of class DailyPrecipitationSerie.
#' 
#' @aliases addOrReplacePrecipitation addOrReplacePrecipitation-method DailyPrecipitationSerie-methods
#' 
#' @param object an object of class DailyPrecipitationSerie
#' @param precipitation the precipitation amount in millimeters
#' @param date the date of the precipitation amount accurance
#' 
#' @return the \code{object} modified with the new precipitation value
#' 
#' @author Lucas Venezian Povoa
#' 
#' @exportMethod addOrReplacePrecipitation
setGeneric("addOrReplacePrecipitation",
   def = function(object, precipitation, date) {
      standardGeneric("addOrReplacePrecipitation")
   }
)

setMethod("addOrReplacePrecipitation",
   signature = "DailyPrecipitationSerie",
   definition = function(object, precipitation, date) {
      
      if (length(precipitation) != length(date))
         stop("precipitation and date lengths should be equal")
         
      if (length(object@date[object@date == date]) == 1) {
         
         object@precipitation[which(object@date == date)] = precipitation
         
      } else {
         
         object@precipitation = c(object@precipitation, precipitation)    
         object@date = c(object@date, date)
         
         object@date <- object@date[order(object@date)]
         object@precipitation <- object@precipitation[order(object@date)]
      }
   }
)