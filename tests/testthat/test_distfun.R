test_that( "test distfun", {
  lonlat1 <- matrix(c(45, 23,12, 56), ncol=2)
  lonlat2 <- matrix(c(23,57,23,1), ncol=2)
  test <- distfun(lonlat1, lonlat2)
  result <- sum( is.na(test) )
  expect_equal(result, 0)
})
