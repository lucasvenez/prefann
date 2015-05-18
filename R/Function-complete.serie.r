#' @name complete.serie
#' 
#' @title Completing Daily Precipitation Serie
#' 
#' @description It completes missing dates into a daily precipitation 
#' serie using a statistical method for forecasting missing values.
#' 
#' @param object an object of the class DailyPrecipitationSerie
#' 
#' @param method what type of method should be used. Possible methods are:
#' \item{mlp}{for Multilayer Perceptron Artifical Neural Network}
#' \item{glm}{for Generalized Linear Regression} 
#' 
#' @aliases complete.serie DailyPrecipitationSerie-methods
#' 
#' @author Lucas Venezian Povoa
#' 
#' @exportMethod 
setGeneric("complete.serie",
   def = function(serie, method) {
      standardGeneric("complete.serie")     
   }
)

setMethod("complete.serie", "DailyPrecipitationSerie", 
   definition = function(serie, method) {
      
      model <-     
         if (method == "mlp") {
            mlp4precipitation(serie)
         } else if (method == "glm") {
            glm4precipitation(serie)
         } else {
            stop(paste("invalid method ", method))
         }
   
      mdt <- missing.dates(serie)
      
      res <- lapply(as.list(mdt), 
         FUN = function(x, method, model, serie) {
            
            x <- as.numeric(unlist(strsplit(as.character(x), "-")))

            newdata <- data.frame(day = x[3], month = x[2], year = x[1])
            
            if (method == "mlp") {
               newdata <- RSNNS:::normalizeDataWithParams(newdata, attr(model, "inputNormParams"))
               newdata <- data.frame(day = newdata[1,3], month = newdata[1,2], year = newdata[1,1])
               row.names(newdata) <- 1
            }
            
            precipitation <- predict(model, newdata)
            
            if (method == "glm") {
             
               if (precipitation <= 0)
                  precipitation = 0
               
            } else if (method == "mlp") {
               
               precipitation <-
                  denormalizeData(precipitation, attr(model, "outputNormParams"))
               
            }
            
            return(
               data.frame(
                  date <- as.date(x[3], x[2], x[1]),
                  precipitation = precipitation
               )
            )
         },
         method, model, serie
      )
      
      res <- do.call(rbind.data.frame, res)
      
      r <- 
            r.squared(
               {if(method == "mlp") normalizeData(serie@precipitation, "0_1")
               else serie@precipitation}, 
               predict(model)
            )
      
      for (i in 1:nrow(res))
         serie <- addPrecipitation(serie, res$precipitation[i], res$date[i])
      
      m <- 
         if ("mlp" %in% class(model)) 
            "Multilayer Perceptron"
         else if ("glm" %in% class(model))
            "Generalized Linear Regression"
      
      attr(serie, "r-squared") <- r
      
      attr(serie, "forecast-model") <- m
      
      attr(serie, "completed-dates") <- mdt
         
      writeLines(paste("Model type:", m, sep = " "))
      
      writeLines(paste("R-squared:",  paste(round(r * 100, 2), "%", sep = ""), sep = " "))
      
      writeLines(paste("Completed missing dates:", length(mdt), sep = " "))
      
      return(serie)
   }
)