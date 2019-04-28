context("Check binomial functions")

test_that("bin_choose functions as expected", {
  expect_equal(bin_choose(5, 2), 10)
  expect_equal(bin_choose(5, 0), 1)
  expect_equal(bin_choose(5, 1:3), c(5, 10, 10))
  
  
})

test_that("bin_probability functions as expected", {
  expect_equal(bin_probability(2, 5, 0.5), 0.3125)
  expect_equal(bin_probability(0:2, 5, 0.5), c(0.03125, 0.15625, 0.31250))
  expect_equal(bin_probability(55, 100, 0.45), 0.01075277, tol = 1e-4)
  
  
})

test_that("bin_distribution functions as expected", {
  distr = bin_distribution(5, 0.5)
  
  expect_equal(distr$success, 0:5)
  expect_equal(distr$probability, c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125))
  expect_equal(class(distr), c("bindis", "data.frame"))
  
  
})

test_that("bin_cumulative functions as expected", {
  cum = bin_cumulative(5, 0.5)
  
  expect_equal(cum$success, 0:5)
  expect_equal(cum$cumulative, c(0.03125, 0.18750, 0.5, 0.8125, 0.96875, 1))
  expect_equal(class(cum), c("bincum", "data.frame"))
  
  
})