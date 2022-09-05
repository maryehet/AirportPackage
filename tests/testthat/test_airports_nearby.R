test_that( "test airports_nearby", {
  library("fields")
  test1 <- airports_nearby(matrix(c(-80.53985, 25.40244), ncol=2), airport_data, x=75)
  test2 <- airports_nearby(matrix(c(-80.53985, 25.40244), ncol=2), airport_data, x=100)
  expect_equal( c(test1[1], test2[1]), c("BTM", "DLH") )
})
