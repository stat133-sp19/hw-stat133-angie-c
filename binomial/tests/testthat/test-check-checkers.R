#Checkers
context("check probability")

test_that("prob is a valid value", {
  expect_true(check_prob(0))
  expect_true(check_prob(1))
  expect_error(check_prob(-0.1))
  expect_error(check_prob((1.1)))
})

context("check trials")

test_that("trials is a valid value", {
  expect_true(check_trials(c(0, 1)))
  expect_true(check_trials(5))
  expect_error(check_trials(-1))
  expect_error(check_trials((1.5)))
})

context("check successes")

test_that("successes is a valid value", {
  expect_true(check_success(5))
  expect_error(check_success(-1))
  expect_error(check_success((1.5)))
})
