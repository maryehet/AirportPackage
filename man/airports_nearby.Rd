% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Airports_nearby.R
\name{airports_nearby}
\alias{airports_nearby}
\title{Finds all airports in `airport_data` within `x` miles of a longitude latitude point}
\usage{
airports_nearby(lonlat, airport_data = airport_data, x)
}
\arguments{
\item{lonlat}{- a 1 x 2 matrix containing a longitude and latitude (format is very particular)}

\item{airport_data}{- your airport data frame}

\item{x}{- distance}
}
\value{
ports - character vector of airport codes within x miles of lonlat
}
\description{
Description
}
\examples{
trial <- c(-94.39448, 30.03509)
dim(trial) <- c(1,2)
test <- airports_nearby(trial, airport_data, 75)
print(test)
}
