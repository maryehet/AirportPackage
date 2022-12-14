% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reachablewlists.R
\name{reachablewlistsrall}
\alias{reachablewlistsrall}
\title{Calculates Proportion of reachable grid points in USA}
\usage{
reachablewlistsrall(sym_direct_from, lonlat, x)
}
\arguments{
\item{sym_direct_from, }{a symmmetric airport network list}

\item{x, }{75 or 100 miles}

\item{lonlat1, }{an n x 2 matrix, first column longitudes(positive for eastern hemisphere and negative for western hemisphere), second column latitude (positive for northern hemisphere and negative for southern hemisphere)}
}
\value{
prop, double between [0,1] and map
}
\description{
reachablewlists returns proportion of grid points reachable from starting point
reachablewlistsrall returns proportion of grid points reachable from starting point and plots on map
}
\examples{
# Calculate proportion of grid points and plots map reachable from a point
test <- reachablewlistsrall( direct_from_a ,lonlat_usa[7,,drop=FALSE], 100)
print(test)
}
