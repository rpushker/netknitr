testthat::test_that("Test readMyFile", {
  temp_file <- tempfile(fileext = ".csv")
  write.csv(mtcars, temp_file)
  res <- readMyFile(temp_file)
  testthat::expect_true(is.data.frame(res))
})
