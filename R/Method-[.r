#' 
#' 
#' 
#' 
#' 
setMethod("[", "DailyPrecipitationSerie",
   definition = function(x, i, j, ..., drop) {
      x@precipitation <- x@precipitation[i]
      x@date          <- x@date[i]
      x
   }
)