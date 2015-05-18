#' @name addPrecipitation
#'
#' @title Add precipitation
#' 
#' @description Add a precipitation value in millimeters along with its respective date into 
#' an object of class DailyPrecipitationSerie.
#' 
#' @aliases addPrecipitation addPrecipitation-method DailyPrecipitationSerie-methods
#' 
#' @usage addPrecipitation(object, precipitation, date)
#' 
#' @param object an object of class DailyPrecipitationSerie
#' @param precipitation the precipitation amount in millimeters
#' @param date the date of the precipitation amount accurance
#'
#' @return the modified object
#' 
#' @author Lucas Venezian Povoa
#' 
#' @exportMethod addPrecipitation
setGeneric("addPrecipitation", 
   def = function(object, precipitation, date) {
      standardGeneric("addPrecipitation")
   }
)

setMethod("addPrecipitation", 
   signature = "DailyPrecipitationSerie",
   definition = function(object, precipitation, date) {
      
      if (length(precipitation) != length(date))
         stop(paste( "precipitation and date lengths should be equal: ", length(precipitation), " != ", length(date), sep = ""))
         
      if (length(object@date[object@date == date]) != 0)
         stop("impossible to add precipitation for an existent date")

      if (!is.na(date) && !is.null(date) && class(date) == "Date") {
         
         precipitation[precipitation < 0.00] <- NA
         
         object@precipitation = c(object@precipitation, precipitation) 
         object@date = c(object@date, date)
         
         object@date <- object@date[order(object@date)]
         object@precipitation <- object@precipitation[order(object@date)]
         
         return(object)
      }
   }
)