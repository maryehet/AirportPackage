#' Finds all airports in `airport_data` within `x` miles of a longitude latitude point
#'
#' Description
#'
#' @param lonlat - a 1 x 2 matrix containing a longitude and latitude (format is very particular)
#' @param airport_data - your airport data frame
#' @param x - distance
#' @return ports - character vector of airport codes within x miles of lonlat
#'
#' @examples
#' trial <- c(-94.39448, 30.03509)
#' dim(trial) <- c(1,2)
#' test <- airports_nearby(trial, airport_data, 75)
#' print(test)
#'@export
airports_nearby <- function(lonlat, airport_data=airport_data, x){
  less_than_x <- c()
  library(fields)
  d <- rdist.earth(lonlat, airport_data[, c("Longitude", "Latitude")])
  d <- as.vector(d)
  less_than_x <- d[d <= x] #subsets it to values less than the distance (x)

  ports = airport_data$Origin[less_than_x] #returns the origin values
  return( ports )
}


