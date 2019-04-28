context("Check auxiliary functions")

test_that("aux_mean functions as expected", {
  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_mean(9, 0.5), 4.5)
  expect_equal(aux_mean(7, 0.6), 4.2)
  
  
})

test_that("aux_variance functions as expected", {
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_variance(9, 0.5), 2.25)
  expect_equal(aux_variance(7, 0.6), 1.68)
  
  
})

test_that("aux_mode functions as expected", {
  expect_equal(aux_mode(10, 0.3), 3)
  expect_equal(aux_mode(9, 0.5), c(5, 4))
  expect_equal(aux_mode(7, 0.6), 4)
  
  
})

test_that("aux_skewness functions as expected", {
  expect_equal(aux_skewness(10, 0.3), 0.2760262, tol = 1e-4)
  expect_equal(aux_skewness(9, 0.5), 0)
  expect_equal(aux_skewness(7, 0.6), -0.15430334996)
  
  
})

test_that("aux_kurtosis functions as expected", {
  expect_equal(aux_kurtosis(10, 0.3), -0.1238095, tol = 1e-4)
  expect_equal(aux_kurtosis(9, 0.5), -2 / 9, tol = 1e-4)
  expect_equal(aux_kurtosis(7, 0.6), -0.2619047619
)
  
  
})