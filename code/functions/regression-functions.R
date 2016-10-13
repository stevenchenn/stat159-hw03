#' Calculates the residual sum of squares.
#' 
#' @param mod A linear mod
#' @return The residual sum of squares.
residual_sum_squares = function(mod) {
  rss = sum(mod$residuals^2)
  return(rss)
}

#' Calculates the total sum of squares.
#' 
#' @param mod A linear mod
#' @return The total sum of squares.
total_sum_squares = function(mod) {
  ybar = mean(mod$mod[[1]])
  tss = sum((mod$mod[[1]] - ybar)^2)
  return(tss)
}

#' Calculates the R^2 value.
#' 
#' @param mod A linear mod
#' @return The R^2 value.
r_squared = function(mod) {
  rss = residual_sum_squares(mod)
  tss = total_sum_squares(mod)
  return(1 - (rss/tss))
}

#' Calculates the F-statistic.
#' 
#' @param mod A linear mod
#' @return The F-statistic.
f_statistic = function(mod) {
  p = mod$rank - 1
  n = length(mod$residuals)
  numerator = (total_sum_squares(mod) - residual_sum_squares(mod))/p
  denominator = residual_sum_squares(mod)/(n - p - 1)
  return(numerator/denominator)
}

#' Calculates the residual standard error.
#' 
#' @param mod A linear mod
#' @return The residual standard error.
residual_std_error = function(mod) {
  p = mod$rank - 1
  n = length(mod$residuals)
  return(sqrt(residual_sum_squares(mod)/(n - p - 1)))
}