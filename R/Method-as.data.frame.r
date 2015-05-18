#' @name as.data.frame
#' 
#' @title Convert to data.frame
#' 
#' @description It converts a DailyPrecipitationSerie into a data.frame.
#' 
#' @return A data.frame with 33 columns, where the first refers to year, the second refers to months, 
#' and the remainder for precipitation in millimenters for each day.
#' 
#' @author Lucas Venezian Povoa
#' 
#' @exportMethod as.data.frame
setMethod("as.data.frame", "DailyPrecipitationSerie",
   definition = function(x) {
      
      res <- lapply(strsplit(as.character(x@date), "-"),
            function(x) 
               data.frame(
                   year  = as.numeric(x[1]), 
                   month = as.numeric(x[2]), 
                   day   = as.numeric(x[3]))  
      )
      
      res <- do.call(rbind.data.frame, res)
      
      res <- cbind(res, data.frame(precipitation = x@precipitation))
      
      res
   }
)