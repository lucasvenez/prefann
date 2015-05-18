#' @name DailyPrecipitationSerie
#'
#' @title DailyPrecipitationSerie Constructor
#' 
#' @description It constructs an instance of the DailyPrecipitationSerie class. 
#' 
#' @docType function
#' 
#' @aliases DailyPrecipitationSerie DailyPrecipitationSerie-methods
#' 
#' @usage DailyPrecipitationSerie(precipitation = numeric(0), date = as.Date(character(0)), lat = 0, long = 0, elevation = 0, station_name = "")
#' 
#' @param precipitation the precipitation values in millimeters of the serie
#' @param date the dates of the serie
#' @param lat the latitude position of the sensor
#' @param long the longitude position of the sensor
#' @param elevation the elevation of the sensor
#' @param station_name the name of the sensor
#' 
#' @return an object of the class DailyPrecipitationSerie
#' 
#' @author Lucas Venezian Povoa
#' 
#' @export
DailyPrecipitationSerie <- function(
      precipitation = numeric(0), 
      date          = as.Date(character(0)), 
      lat           = 0, 
      long          = 0, 
      elevation     = 0, 
      station_name  = "") {

   new("DailyPrecipitationSerie",
      precipitation = precipitation,
      date          = date,
      lat           = lat,
      long          = long,
      elevation     = elevation,
      station_name  = station_name
   )
}