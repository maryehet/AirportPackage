#' Checks whether a list is symmetrical
#'
#' Tests whether a `direct_from` object is symmetric.
#'
#' @param a list, ex(direct_from or sym_direct_from)
#' @return a list whose first element is TRUE or FALSE (whether or not it is symmetric), and whose second element is an `n x 2` character matrix giving the `n` asymmetric connections.
#'
#' @examples
#' test1 <- check_symmetry(direct_from_a)
#' print(test1)
#' test2 <- check_symmetry(sym_direct_from)
#' print(test2)
#' @export
check_symmetry <- function(direct_from){
  con1 <- vector()
  con2 <- vector()
  symm <- TRUE
  origin_names <- airport_data$Origin
  dest_names <- airport_data$Origin
  for( origin in origin_names){
    for(dest in dest_names){
      if(all(origin %in% direct_from[[dest]]) == TRUE &
         all(dest %in% direct_from[[origin]]) == FALSE){
        symm <- FALSE
        con1 <- c(con1, origin)
        con2 <- c(con2, dest)
      }
    }
  }
  conn <- cbind(con1, con2)
  return(list(symm = symm, conn = conn))
}
