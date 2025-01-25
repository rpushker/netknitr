testthat::test_that("Test getShapes", {
  nodes <- getNodes(head(mtcars[,c("cyl", "gear")]), group = TRUE)
  res <- getShapes(nodes)
  testthat::expect_true(length(res) == 5)
})