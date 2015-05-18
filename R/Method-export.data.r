#' @name export.data
#' @title Export data
#' @description It exports an object of class DailyPrecipitationSerie to a CSV file.
#' 
#' @aliases export.data DailyPrecipitationSerie-methods
#' 
#' @author Lucas Venezian Povoa
#' 
#' @exportMethod export.data
setGeneric("export.data", 
   function(serie, file, sep = ",", dec = ".") {
      standardGeneric("export.data")
   }
)

setMethod("export.data", "DailyPrecipitationSerie",
   definition = function(serie, file, sep = ",", dec = ".") {
      
      res <- as.data.frame(serie)
      
      result <- lapply(as.list(unique(res[,1])),
            
         function(x, res) {

            d <- lapply(as.list(1:12), 
               function(y, x, res) {

                  l <- res[which(res$year == x & res$month == y), 4]
                  
                  l <- c(l, rep(NA, 31 - length(l)))
                  
                  r <- data.frame(year = x, month = y, 
                     d01 = l[01], d02 = l[02], d03 = l[03], d04 = l[04], d05 = l[05],
                     d06 = l[06], d07 = l[07], d08 = l[08], d09 = l[09], d10 = l[10],
                     d11 = l[11], d12 = l[12], d13 = l[13], d14 = l[14], d15 = l[15],
                     d16 = l[16], d17 = l[17], d18 = l[18], d19 = l[19], d20 = l[20],
                     d21 = l[21], d22 = l[22], d23 = l[23], d24 = l[24], d25 = l[25],
                     d26 = l[26], d27 = l[27], d28 = l[28], d29 = l[29], d30 = l[30],
                     d31 = l[31]                     
                  )
               }, x, res
            )
            
            d <- do.call(rbind.data.frame, d)
            
            d
            
         }, res
      )
      
      result <- do.call(rbind.data.frame, result)
      
      write.table(result, file = file, sep = sep, dec = dec, row.names = FALSE)
   } 
)