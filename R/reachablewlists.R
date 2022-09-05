#' Calculates Proportion of reachable grid points in USA
#'
#' reachablewlists returns proportion of grid points reachable from starting point
#' reachablewlistsrall returns proportion of grid points reachable from starting point and plots on map
#'
#' @param sym_direct_from, a symmmetric airport network list
#' @param lonlat1, an n x 2 matrix, first column longitudes(positive for eastern hemisphere and negative for western hemisphere), second column latitude (positive for northern hemisphere and negative for southern hemisphere)
#' @param x, 75 or 100 miles
#' @return prop, double between [0,1]
#'
#' @examples
#' # Calculate proportion of grid points reachable from a point
#' test <- reachablewlists( direct_from_a ,lonlat_usa[7,,drop=FALSE], 100)
#' print( test )
#' @export

reachablewlists <- function(sym_direct_from, lonlat, x) {
  library("fields")
  llt <- as.data.frame(lonlat_usa)
  # points within 2x miles
  indice <- which(lonlat[1] == llt$Var1 & lonlat[2] == llt$Var2 )
  less_than_2x <- c()
  if(x == 75){
    less_than_2x <- as.vector(points_near_points75[[indice]])}
  else{
    less_than_2x <- as.vector(points_near_points100[[indice]])}
  nearby_ports1 <- airports_nearby(matrix(lonlat, nrow= 1), airport_data, x)

  # take 1 flight within x miles and travel another x miles
  if (x == 75){
    nearby_ports1 <- closest_airport75[[indice]]}
  else{
    nearby_ports1 <- closest_airport100[[indice]]}

  less_than_x <- c()
  for (port in nearby_ports1) {
    directflights <- sym_direct_from[[port]]
    for (port2 in directflights) {
      if(x ==75){
        less_than_x <- c(less_than_x, points_near_airport75[[port2]])
      }
      if( x== 100){
        less_than_x <- c(less_than_x, points_near_airport100[[port2]])}

    }}
  all_points <- unique( c(less_than_x, less_than_2x) )
  all_points2 <- all_points[!is.na(all_points)]
  all_points2 <- all_points2[all_points2<=nrow(lonlat_usa)]
  mapster <- as.data.frame(lonlat_usa[all_points2,])
  prop <- nrow(mapster)/nrow(lonlat_usa)
  return(prop)
}
#' Calculates Proportion of reachable grid points in USA
#'
#' reachablewlists returns proportion of grid points reachable from starting point
#' reachablewlistsrall returns proportion of grid points reachable from starting point and plots on map
#'
#' @param sym_direct_from, a symmmetric airport network list
#' @param lonlat1, an n x 2 matrix, first column longitudes(positive for eastern hemisphere and negative for western hemisphere), second column latitude (positive for northern hemisphere and negative for southern hemisphere)
#' @param x, 75 or 100 miles
#' @return prop, double between [0,1] and map
#'
#' @examples
#' # Calculate proportion of grid points and plots map reachable from a point
#' test <- reachablewlistsrall( direct_from_a ,lonlat_usa[7,,drop=FALSE], 100)
#' print(test)
#' @export
reachablewlistsrall <- function(sym_direct_from, lonlat, x) {
  library("fields")
  library("mapview")
  llt <- as.data.frame(lonlat_usa)
  # points within 2x miles
  indice <- which(lonlat[1] == llt$Var1 & lonlat[2] == llt$Var2 )
  less_than_2x <- c()
  if(x == 75){
    less_than_2x <- points_near_points75[[indice]]}
  else{
    less_than_2x <- points_near_points100[[indice]]}
  #
  nearby_ports1 <- airports_nearby(matrix(lonlat, nrow= 1), airport_data, x)

  # take 1 flight within x miles and travel another x miles
  if (x == 75){
    nearby_ports1 <- closest_airport75[[indice]]}
  else{
    nearby_ports1 <- closest_airport100[[indice]]}

  less_than_x <- c()
  for (port in nearby_ports1) {
    directflights <- sym_direct_from[[port]]
    for (port2 in directflights) {
      if(x ==75){
        less_than_x <- c(less_than_x, points_near_airport75[[port2]])
      }
      if( x== 100){
        less_than_x <- c(less_than_x, points_near_airport100[[port2]])
      }
    }}

  all_points <- unique( c(less_than_x, less_than_2x) )
  all_points2 <- all_points[!is.na(all_points)]
  all_points2 <- all_points2[all_points2<=nrow(lonlat_usa)]
  #return(lonlat_usa[all_points2,]) this statement would return solely the points
  mapster <- as.data.frame(lonlat_usa[all_points2,])
  prop <- nrow(mapster)/nrow(lonlat_usa)
  return(list(mapView(mapster, xcol = "Var1", ycol = "Var2", crs = 4269, grid = FALSE),prop))
}
