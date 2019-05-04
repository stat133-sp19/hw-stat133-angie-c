#Summary measures
context("check mean")

test_that("mean is a valid value", {
  expect_equal(aux_mean(2, 0.5), 1)
  expect_length(aux_mean(3, 0.6), 1)
  expect_is(aux_mean(25, 0.2), numeric)
})

context("check variance")

test_that("variance is a valid value", {
  expect_length(aux_variance(3, 0.6), 1)
  expect_is(aux_mean(25, 0.2), numeric)
  expect_equal(aux_variance(2, 0.5), (2 * 0.5) * (1 - 0.5))
})

context("check mode")

test_that("mode is a valid value", {
  expect_gte(aux_mode(3, 0.6), 0)
  expect_is(aux_mode(25, 0.2), numeric)
  expect_length(aux_mode(3, 0.6), 1)
})

context("check skewness")

test_that("mode is a valid value", {
  expect_gte(aux_skewness(3, 0.6), 0)
  expect_is(aux_skewness(25, 0.2), numeric)
  expect_length(aux_skewness(3, 0.6), 1)
})

context("check kurtosis")

test_that("mode is a valid value", {
  expect_is(aux_kurtosis(25, 0.2), numeric)
  expect_length(aux_kurtosis(3, 0.6), 1)
  expect_type(aux_kurtosis(25, 0.2), numeric)
})

