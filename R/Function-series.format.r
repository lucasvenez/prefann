#' @name series.format
#' 
#' @title Compact daily precipitation series
#' 
#' @description It compacts daily precipitation 
#' series into a unique data.frame
#' 
#' @aliases series.format DailyPrecipitationSerie-methods
#' 
#' @author Lucas Venezian Povoa
#' 
#' @param ... a set of objects of class DailyPrecipitationSerie
#' 
#' @return A data.frame with all input data
#' 
#' @export
series.format <- function(...) {
   
   p <- list(...)
   
   r <- lapply(p, function(x) {
            
            if (class(x) == "DailyPrecipitationSerie")
               return(TRUE)
            else
               return(FALSE)
         })
   
   if (length(p) != sum(unlist(r)))
      stop("All parameters should be of class DailyPrecipitationSerie")
   
   res <- lapply(p,
         function(x) {
            
            rrr <- lapply(strsplit(as.character(x@date), "-"),
                  function(dt) {
                     data.frame(
                           day   = as.numeric(dt[3]), 
                           month = as.numeric(dt[2]), 
                           year  = as.numeric(dt[1])
                     )
                  }
            )
            
            rrr <- do.call(rbind.data.frame, rrr)
            
            data.frame(
                  precipitation = x@precipitation,
                  day           = rrr$day,
                  month         = rrr$month,
                  year          = rrr$year,
                  lat           = x@lat,
                  long          = x@long,
                  elevation     = x@elevation
            )
         }
   )
   
   res <- do.call(rbind.data.frame, res)
   
   res
}