testthat::test_that("Test readMyFile", {
  write.csv(mtcars, 'test_data.csv')
  res <- readMyFile("test_data.csv")
  testthat::expect_true(is.data.frame(res))
})
