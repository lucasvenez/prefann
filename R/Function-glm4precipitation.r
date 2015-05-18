glm4precipitation <- function(...) {
   
   res <- series.format(...)
   return(with(res, glm(precipitation ~ day + month + year)))
}