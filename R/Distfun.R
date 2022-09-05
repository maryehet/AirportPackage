#' Calculates the Great Circle Distance
#'
#' Computes the Great Circle Distance distance from two coordinates between
#' pairs of longitude and latitude coordinates
#'
#' @param lonlat1, an n1 x 2 matrix, first column longitudes(positive for eastern hemisphere and negative for western hemisphere), second column latitude (positive for northern hemisphere and negative for southern hemisphere)
#' @param lonlat1, an n2 x 2 matrix, first column longitudes(positive for eastern hemisphere and negative for western hemisphere), second column latitude (positive for northern hemisphere and negative for southern hemisphere)
#' @return distmat, an n1 x n2 matrix of the pairs' distance (ie.distmat[i,j] is the distance between lonlat1[i,] and lonlat2[j,])
#'
#' @examples
#' # Calculate the distance between all the airports in the airport_data dataframe
#' lonlat1 <- data.frame(airport_data$Longitude, airport_data$Latitude)
#' lonlat2 <- data.frame(airport_data$Longitude, airport_data$Latitude)
#' test <- distfun(lonlat1, lonlat2)
#' print(head(test) )
#' @export
distfun <- function(lonlat1, lonlat2){
  #long1, lat1, long2, lat2
  R <- 3963 # Earth mean radius [miles]
  n1 <- nrow(lonlat1)
  n2 <- nrow(lonlat2)
  distmat <- matrix(NA, n1, n2 )
  for(i in 1:nrow(lonlat1)){
    for(j in 1:nrow(lonlat2)){
      if (i == j){
        distmat[i,j] <- 0}
      else{
        d <- acos(sin(lonlat1[i,2]*pi/180)*sin(lonlat2[j,2]*pi/180) + cos(lonlat1[i,2]*pi/180)*
                    cos(lonlat2[j,2]*pi/180) *cos((lonlat2[j,1]*pi/180)-(lonlat1[i,1]*pi/180))) * R
        #manually computes the great circle distance to demonstrate understanding
        #of the formula
        #we used rdist.earth function later for speed
        distmat[i,j] <- d}
    }}

  return(distmat) #returns distance in miles
}
