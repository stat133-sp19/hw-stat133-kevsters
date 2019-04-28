context("Check checking functions")

test_that("check_prob functions with adequate values", {
  expect_true(check_prob(0.5))
  expect_true(check_prob(1))
  
})

test_that("check_prob errors with inadequate values", {
  expect_error(check_prob(-0.5))
  expect_error(check_prob(3))
  
})

test_that("check_prob errors with length > 1", {
  expect_error(check_prob(c(0.5, 0.8)))
  
})

test_that("check_trials functions with adequate values", {
  expect_true(check_trials(100))
  expect_true(check_trials(30))
  
})

test_that("check_trials errors with inadequate values", {
  expect_error(check_trials(-20))
  expect_error(check_trials(6.7))
  
})

test_that("check_successes functions with adequate values", {
  expect_true(check_successes(100, 200))
  expect_true(check_successes(0, 20))
  expect_true(check_successes(1:3, 5))
  
})


test_that("check_successes errors with inadequate values", {
  expect_error(check_successes(200, 100))
  expect_error(check_successes(-2, 20))
  expect_error(check_successes(19:21, 20))
  
})

