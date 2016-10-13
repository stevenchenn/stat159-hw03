library(testthat)

context('Test for residual_sum_squares')
test_that('RSS is positive', {
  mod = lm(mpg ~ disp + hp, data = mtcars)
  expect_gte(residual_sum_squares(mod), 0)
  expect_length(residual_sum_squares(mod), 1)
  expect_type(residual_sum_squares(mod), 'double')
})

test_that('RSS is correct against R', {
  mod = lm(mpg ~ disp + hp, data = mtcars)
  rss = sum(mod$residuals^2)
  err = abs(residual_sum_squares(mod) - rss)
  expect_lte(err, 10^-3)
})

context("Test for total_sum_squares")
test_that('TSS is positive', {
  mod = lm(mpg ~ disp + hp, data = mtcars)
  expect_gte(total_sum_squares(mod), 0)
  expect_length(total_sum_squares(mod), 1)
  expect_type(total_sum_squares(mod), 'double')
})

test_that('TSS is correct against R', {
  mod = lm(mpg ~ disp + hp, data = mtcars)
  tss = sum((mtcars$mpg - mean(mtcars$mpg))^2)
  err = abs(total_sum_squares(mod) - tss)
  expect_lte(err, 10^-3)
})

context("Test for r_squared")
test_that('R^2 is positive and between 0,1', {
  mod = lm(mpg ~ disp + hp, data = mtcars)
  expect_gte(r_squared(mod), 0)
  expect_lte(r_squared(mod), 1)
  expect_length(r_squared(mod), 1)
  expect_type(r_squared(mod), 'double')
})

test_that('R^2 is correct against R', {
  mod = lm(mpg ~ disp + hp, data = mtcars)
  R2 = summary(mod)$r.squared
  err = abs(r_squared(mod) - R2)
  expect_lte(err, 10^-3)
})

context('Test for f_statistic')
test_that('F-Statistic is positive', {
  mod = lm(mpg ~ disp + hp, data = mtcars)
  expect_gte(f_statistic(mod), 0)
  expect_length(f_statistic(mod), 1)
  expect_type(f_statistic(mod), 'double')
})

test_that('F-Statistic is correct against R', {
  mod = lm(mpg ~ disp + hp, data = mtcars)
  f = summary(mod)$fstatistic[1]
  err = abs(f_statistic(mod) - f)
  expect_lte(err, 10^-3)
})

context("Test for residual_std_error")
test_that('Residual S.E. is positive', {
  mod = lm(mpg ~ disp + hp, data = mtcars)
  expect_gte(residual_std_error(mod), 0)
  expect_length(residual_std_error(mod), 1)
  expect_type(residual_std_error(mod), 'double')
})

test_that('Residual S.E. is correct against R', {
  mod = lm(mpg ~ disp + hp, data = mtcars)
  rse = summary(mod)$sigma
  err = abs(residual_std_error(mod) - rse)
  expect_lte(err, 10^-3)
})