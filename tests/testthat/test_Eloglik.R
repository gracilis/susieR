context("test_Eloglik.R")

test_that("Eloglik agrees with version 0.3",{
  original.res = readRDS('Eloglik_original_res.rds')
  simulate(sparse = TRUE)
  
  scaledX = safe_colScale(X)
  scaledX.sparse = safe_colScale(X.sparse)
  
  dense.res  = Eloglik(scaledX, y, s)
  sparse.res = Eloglik(scaledX.sparse, y, s)
  
  expect_equal(dense.res, original.res)
  expect_equal(sparse.res, original.res)
})
