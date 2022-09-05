#' Origin Airport IDs and their respective Longitude and Latitude coordinates
#'
#' A dataset with the coordinates of 354 airports
#'
#'@format a dataframe with 354 rows and 3 columns
#'\describe{
#'    \item{Origin}{airport city code}
#'    \item{Longitude}{longitude of airport, in decimal degrees east}
#'    \item{Latitude}{latitude of arport, in decimal degrees north}
#'}
"airport_data"

#' Grid of USA Longitude and Latitude coordinates
#'
#' A dataset with the coordinates of coordinates in USA
#'
#'@format a dataframe with 9284 rows and two columns
#'\describe{
#'    \item{Longitude}{longitude of airport, in decimal degrees east}
#'    \item{Latitude}{latitude of arport, in decimal degrees north}
#'}
"lonlat_usa"
#' Symmetric direct from list of airport connects
#'
#' A list with 354 elements, each element is a char vector of airports with direct flights from element airport
#'
#'@format a list with 354 elements
#'\describe{
#'    \item{Airport}{airport city code}
#'    \item{Connectinng flights}{char vector of connecting flights to airports}
#'}
"sym_direct_from"

#' Airports within 75 miles of a Longitude and Latitude coordinate
#'
#'@format A list with 9285 element. Each element is indexed by an indices in airport_data.
#'\describe{
#'    \item{Points}{lon lat}
#'    \item{Airports}{char vector of connecting flights to airports}
#'}
"closest_airport75"

#' Airports within 100 miles of a Longitude and Latitude coordinate
#'
#'@format A list with 9285 element. Each element is indexed by an indices in airport_data.
#'\describe{
#'    \item{Point}{lon lat}
#'    \item{Airports}{char vector of connecting flights to airports}
#'}
"closest_airport100"

#' Points within 75 miles of each other
#'
#'@format A list with 9285 element. Each element is indexed by an indices in airport_data.
#'\describe{
#'    \item{Point}{airport city code}
#'    \item{Point}{lonlat of nearby points}
#'}
"points_near_points75"

#' Points within 100 miles of each other
#'
#'@format A list with 9285 element. Each element is indexed by an indices in airport_data.
#'\describe{
#'    \item{Points}{lonlat}
#'    \item{naerby points}{list of lonlats }
#'}
"points_near_points100"

#' Airports within 75 miles of a Longitude and Latitude coordinate
#'
#'@format A list with 9285 element. Each element is indexed by an indices in airport_data.
#'\describe{
#'    \item{Airport}{airport city code}
#'    \item{Connectinng flights}{char vector of connecting flights to airports}
#'}
"points_near_airport75"

#' Airports within 100 miles of a Longitude and Latitude coordinate
#'
#'@format A list with 9285 element. Each element is indexed by an indices in airport_data.
#'\describe{
#'    \item{Airport}{airport city code}
#'    \item{Connectinng flights}{char vector of connecting flights to airports}
#'}
"points_near_airport100"

#' Direct_from object for scenario A: The total number of direct connections must remain constant. In other words, if you add a connection, you must remove a different connection.
#'
#' A list with 354 elements, each element is a char vector of airports with direct flights from element airport
#'
#'@format a list with 354 elements
#'\describe{
#'    \item{Airport}{airport city code}
#'    \item{Connectinng flights}{char vector of connecting flights to airports}
#'}
#'
"direct_from_a"
#' Direct_from object for scenario B: The total number of connections to and from each airport must remain constant.
#'
#' A list with 354 elements, each element is a char vector of airports with direct flights from element airport
#'
#'@format a list with 354 elements
#'\describe{
#'    \item{Airport}{airport city code}
#'    \item{Connectinng flights}{char vector of connecting flights to airports}
#'}
"direct_from_b"

#' Direct_from object for scenario C: add or subtract up to two connections from each airport, leaving the other connections unchanged, and keeping the total number of connections constant.
#'
#' A list with 354 elements, each element is a char vector of airports with direct flights from element airport
#'
#'@format a list with 354 elements
#'\describe{
#'    \item{Airport}{airport city code}
#'    \item{Connectinng flights}{char vector of connecting flights to airports}
#'}
"direct_from_c"
