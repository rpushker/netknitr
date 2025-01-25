testthat::test_that("Test fixNodeBias", {
  res <- data.frame(x=letters[1:3], y = letters[1:3])
  res <- fixNodeBias(res)
  testthat::expect_equal(length(res), 2)
  testthat::expect_true(is.data.frame(res))
  testthat::expect_equal(nrow(res), 3)
  testthat::expect_equal(as.character(res$x[1]), "x : a")
})