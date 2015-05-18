#' @name read.data
#' 
#' @title Read Precipitation Serie
#' 
#' @description It reads a precipitation serie from a CSV file.
#' 
#' @details The CSV file should be structure with 33 columns, where each line represents a sample.
#' The 1st column contains the year, the 2nd column contains the month, and the columns 3-33 contain
#' the precipitation in milimmeters for each day in the month/year.
#' 
#' @return An object of the class DailyPrecipitationSerie.
#' 
#' @aliases read.data DailyPrecipitationSerie-methods
#' 
#' @author Lucas Venezian Povoa
#' 
#' @export 
read.data <- function(file_path, sep = ",", quote = "\"", dec = ".", header = TRUE, na.value = NA, ...) {
   
   ##
   # Params via dots
   p <- list(...)
   
   obj <- DailyPrecipitationSerie()
   
   if (sum(names(p) == "lat") == 1)
      obj@lat = p$lat
   
   if (sum(names(p) == "long") == 1)
      obj@long = p$long
   
   if (sum(names(p) == "elevation") == 1)
      obj@elevation = p$elevation
   
   if (sum(names(p) == "station_name") == 1)
      obj@station_name = p$station_name
   
   ##
   # Data.frame with the values
   d <- read.csv(file_path, header, sep, quote, dec)
   
   if (ncol(d) < 33)
      stop("invalid data. It should has 33 columns.")
   
   if (ncol(d) > 33)
      d <- d[1:33]

   if (!is.na(na.value) && !is.na(na.value))
      d[which(d == na.value)] = NA
   
   ##
   # Removing invalid rows
   d <- d[!(is.na(d[,1])),]
   
   res <- apply(d, 1, FUN = function(r) {
            
      dt <- as.date(1:31, r[2], r[1])
      
      ##
      # Removing NA values
      dt <- dt[!is.na(dt) && !is.null(dt)]

      precipitation <- as.vector(r[3:(length(dt) + 2)])
      
      dt <- dt[which(!is.na(precipitation))]
      
      precipitation <- precipitation[!is.na(precipitation)]

      if (length(dt) > 0)
         data.frame(precipitation = precipitation, date = dt)
   })
   
   res <- do.call(rbind.data.frame, res)
   
   obj <- addPrecipitation(obj, res$precipitation, res$date)
   
   return(obj)
}