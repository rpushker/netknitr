testthat::test_that('test getAssociation', {
  res <- getAssociation(head(mtcars[,c("cyl", "gear")]))
  testthat::expect_true(is.data.frame(res))
  testthat::expect_equal(nrow(res),  3)
  testthat::expect_equal(ncol(res), 2)
  testthat::expect_equal(res$from[1], "6")
  testthat::expect_equal(res$to[1], "4")
})
