#' @name as.date
#' 
#' @title Date
#' 
#' @description It creates an object of class Date
#' 
#' @aliases Date
#' 
#' @usage Date(day = NA, month = NA, year = NA)
#' 
#' @param day the day
#' @param month the month in number format
#' @param year the year with four digits
#' 
#' @return a Date object
#' 
#' @author Lucas Venezian Povoa
#' 
#' @export
as.date <- function(day = NA, month = NA, year = NA) {
   return(as.Date(paste(day, month, year, sep = "-"), format = "%d-%m-%Y"))
}