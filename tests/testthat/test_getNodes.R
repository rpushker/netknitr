testthat::test_that("test getNodes", {
  res <- getNodes(head(mtcars))
  testthat::expect_equal(res$id[1], 1)
  testthat::expect_equal(length(res$id), 37)
  testthat::expect_true(is.data.frame(res))
  testthat::expect_false(is.character(res$id))
  testthat::expect_equal(length(res), 2)
})

testthat::test_that("test getNodes for group", {
  res <- getNodes(head(mtcars), group = TRUE)
  testthat::expect_equal(res$id[1], 1)
  testthat::expect_equal(length(res$id), 42)
  testthat::expect_true(is.data.frame(res))
  testthat::expect_false(is.character(res$id))
  testthat::expect_equal(length(res), 3)
})
