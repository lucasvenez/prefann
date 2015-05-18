#' @name DailyPrecipitationSerie-class
#' 
#' @title The DailyPrecipitationSerie class
#' 
#' @description This class encompasses a daily precipitation serie, validating its input against duplicate dates
#' and invalid precipitations.
#' 
#' @aliases DailyPrecipitationSerie-class
#' 
#' @section Slots:
#' \itemize{
#'    \item \code{precipitation} the precipitation values in millimeters of the serie
#'    \item \code{date} the dates of the serie
#'    \item \code{lat} the latitude position of the precipitation sensor
#'    \item \code{long} the longitude position of the precipitation sensor
#'    \item \code{elevation} the elvation of the precipitation sensor
#'    \item \code{station_name} the name of the precipitation sensor
#' }
#' 
#' @author Lucas Venezian Povoa
#' 
#' @exportClass DailyPrecipitationSerie
setClass("DailyPrecipitationSerie",
   slots = c(
      precipitation = "numeric",
      date          = "Date",
      lat           = "numeric",
      long          = "numeric",
      elevation     = "numeric",
      station_name  = "character"
   )
)