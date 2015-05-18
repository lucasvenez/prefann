#' @name mlp
#' 
#' @title Multilayer Perceptron (MLP)
#' 
#' @description A MLP for completing missing dates into a precipitation serie.
#' 
#' @param ... a set of objects of DailyPrecipitationSerie
#' 
#' @export
mlp4precipitation <- function(...) {
   
   res <- series.format(...)
   
   inputs <- normalizeData(res[2:4],  type = "0_1")
   
   output <- normalizeData(res[1],  type = "0_1")
   
   model <- mlp(
      x               = inputs,
      y               = output,
      size            = c(3, 3, 3),
      learnFunc       = "BackpropChunk",   #"BackpropBatch", #"Std_Backpropagation",
      learnFuncParams = c(5, 0, 1, -5, 5), #c(.98, 1),
      hiddenActFunc   = "Act_TanH",
      updateFunc      = "Topological_Order",
      maxit           = 1000,
      linOut          = FALSE,
      inputsTest      = inputs,
      targetsTest     = output
   )
   
   attr(model, "inputNormParams") <- 
         list(
               colMaxima  = c(base::max(res[,2]), base::max(res[,3]), base::max(res[,4])), 
               colMinima  = c(base::min(res[,2]), base::min(res[,3]), base::min(res[,4])), 
               type = "0_1")
   
   attr(model, "outputNormParams") <- 
         list(
            colMaxima  = base::max(res[,1]), 
            colMinima  = base::min(res[,1]), 
            type = "0_1") 
   
   return(model)
}