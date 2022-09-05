# test check symmetric
test_that( "check sym_direct_from is symmetric", {
  result <- check_symmetry(sym_direct_from)
  expect_equal(result[[1]], TRUE)
})




