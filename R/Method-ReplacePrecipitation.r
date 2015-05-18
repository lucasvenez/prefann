#' @name replacePrecipitation
#'
#' @title Replace precipitation value
#' 
#' @description It replaces a precipitation value of a DailyPrecipitationSerie object.
#' 
#' @aliases replacePrecipitation replacePrecipitation-method DailyPrecipitationSerie-methods
#' 
#' @param object an object of class DailyPrecipitationSerie
#' @param precipitation the precipitation amount in millimeters
#' @param date the date of the precipitation amount accurance
#'
#' @return the modified object
#'  
#' @author Lucas Venezian Povoa
#'  
#' @exportMethod replacePrecipitation
setGeneric("replacePrecipitation", 
   def = function(object, precipitation, date) {
      standardGeneric("replacePrecipitation")
   }
)

setMethod("replacePrecipitation",
   signature = "DailyPrecipitationSerie",
   definition = function(object, precipitation, date) {
      
      if (length(precipitation) == length(date))
         stop("precipitation and date lengths should be equal")
         
      if (length(object@date[object@date == date]) != 1)
         stop("date not found into the serie")
         
      object@precipitation[which(object@date == date)] = precipitation
   }
)