#' @title Bin_Choose
#' @description Computes 'n choose k'
#' @param n an integer or vector of numerics - number of trials
#' @param k an integer or vector of numerics - number of successes
#' @return an integer - number of combinations in which k successes can occur in n trials
#' @export
#' @examples
#' # integers 
#' combs <- bin_choose(n = 5, k = 2)
#' 
#' # vectorized
#' combs <- bin_choose(5, 1:3)
#' 

bin_choose <- function(n, k) {
  if (!all(k <= n)) {
    stop("'k' cannot be greater than 'n'")
  }
  return (factorial(n) / (factorial(k) * factorial(n - k)))
  
}

#' @title Bin_Probability
#' @description Computes the probability of a certain amount of success in a certain amount
#' of trials, given the probability of a single success
#' @param trials an integer or vector of numerics - number of trials
#' @param success an integer or vector of numerics - number of successes
#' @param prob a numeric value between 0 and 1
#' @return probability of getting success successes in trials given prob of success
#' @export
#' @examples
#' # integers 
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' 
#' # vectorized
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' 

bin_probability <- function(success, trials, prob) {
  check_prob(prob)
  check_trials(trials)
  check_successes(success, trials)

  return (bin_choose(trials, success) * (prob ^ success) * ((1 - prob) ^ (trials - success)))
  
}

#' @title Bin_Distribution
#' @description takes in trials and prob and outputs a data frame for all success possibilities.
#' @param trials an integer or vector of numerics - number of trials
#' @param prob a numeric value between 0 and 1
#' @return a data frame with the distribution of successes
#' @export
#' @examples
#' # default
#' distr <- bin_distribution(trials = 5, prob = 0.5)
#' 


bin_distribution <- function(trials, prob) {
  
  success = 0:trials
  probability = vector()
  
  for (i in success) {
    probability[i + 1] = bin_probability(i, trials, prob)
  }
  
  result = data.frame(success, probability)
  class(result) <- c("bindis", "data.frame")
  
  return (result)
  
}

#' @export
plot.bindis <- function(distr) {
  return (barplot(height = distr$prob, 
                  xlab = "Successes", ylab = "Probability", names.arg = distr$success))
}


#' @title Bin_Cumulative
#' @description takes in trials and prob and outputs a data frame for all success possibilities.
#' Includes a column for that success alone, as well as a column for that success or fewer
#' @param trials an integer or vector of numerics - number of trials
#' @param prob a numeric value between 0 and 1
#' @return a data frame with the distribution of successes (both individual and cumulative)
#' @export
#' @examples
#' # default
#' cum <- bin_cumulative(trials = 5, prob = 0.5)
#' 


bin_cumulative <- function(trials, prob) {
  
  success = 0:trials
  probability = vector()
  cumulative = vector()
  
  for (i in success) {
    probability[i + 1] = bin_probability(i, trials, prob)
    
    if (i == 0) {
      cumulative[i + 1] = probability[i + 1]
    } else {
      cumulative[i + 1] = cumulative[i] + probability[i + 1]
    }
  }
  
  result = data.frame(success, probability, cumulative)
  class(result) <- c("bincum", "data.frame")
  
  return (result)
  
}

#' @export
plot.bincum <- function(distr) {
  return (plot(x = distr$success, y = distr$cumulative, type = "o",
                  xlab = "Successes", ylab = "Probability"))
}

#' @title Bin_Variable
#' @description takes in trials and prob and outputs a named list describing those values
#' @param trials an integer or vector of numerics - number of trials
#' @param prob a numeric value between 0 and 1 
#' @return a "binvar" object, which is a named list
#' @export
#' @examples
#' # default
#' bin1 <- bin_variable(trials = 10, prob = 0.3)
#' 


bin_variable <- function(trials, prob) {
  
  check_prob(prob)
  check_trials(trials)
  
  result = list(trials = trials,
                prob = prob)
  
  class(result) <- "binvar"
  
  return (result)
  
}

#' @export
print.binvar <- function(bin) {
  
  cat("\"Binomial Variable\"\n\nParameters\n- number of trials: ", 
      bin[["trials"]], "\n- prob of success: ", bin[["prob"]])
}

#' @export
summary.binvar <- function(bin) {
  
  result = list(trials = bin[["trials"]],
                prob = bin[["prob"]], 
                mean = aux_mean(bin[["trials"]], bin[["prob"]]),
                variance = aux_variance(bin[["trials"]], bin[["prob"]]),
                mode = aux_mode(bin[["trials"]], bin[["prob"]]),
                skewness = aux_skewness(bin[["trials"]], bin[["prob"]]),
                kurtosis = aux_kurtosis(bin[["trials"]], bin[["prob"]])
                )
  
  class(result) <- "summary.binvar"
  
  return(result)
}

#' @export
print.summary.binvar <- function(binsum) {
  
  cat("\"Summary Binomial\"\n\nParameters\n- number of trials: ", 
      binsum[["trials"]], "\n- prob of success: ", binsum[["prob"]],
      "\n\nMeasures\n- mean    : ", binsum[["mean"]], "\n- variance: ", 
      binsum[["variance"]], "\n- mode    : ", binsum[["mode"]], "\n- skewness: ", 
      binsum[["skewness"]], "\n- kurtosis: ", binsum[["kurtosis"]])
}



#' @title Bin_Mean
#' @description finds mean of binomial given trials and prob
#' @param trials an integer or vector of numerics - number of trials
#' @param prob a numeric value between 0 and 1 
#' @return the mean of the variable passed in
#' @export
#' @examples
#' # default
#' mean <- bin_mean(trials = 10, prob = 0.3)
#' 

bin_mean <- function(trials, prob) {
  check_prob(prob)
  check_trials(trials)
  
  return(aux_mean(trials, prob))
}

#' @title Bin_Variance
#' @description finds variance of binomial given trials and prob
#' @param trials an integer or vector of numerics - number of trials
#' @param prob a numeric value between 0 and 1 
#' @return the variance of the variable passed in
#' @export
#' @examples
#' # default
#' var <- bin_variance(trials = 10, prob = 0.3)
#' 

bin_variance <- function(trials, prob) {
  check_prob(prob)
  check_trials(trials)
  
  return(aux_variance(trials, prob))
}

#' @title Bin_Mode
#' @description finds mode of binomial given trials and prob
#' @param trials an integer or vector of numerics - number of trials
#' @param prob a numeric value between 0 and 1 
#' @return the mode of the variable passed in
#' @export
#' @examples
#' # default
#' mode <- bin_mode(trials = 10, prob = 0.3)
#' 

bin_mode <- function(trials, prob) {
  check_prob(prob)
  check_trials(trials)
  
  return(aux_mode(trials, prob))
}

#' @title Bin_Skewness
#' @description finds skewness of binomial given trials and prob
#' @param trials an integer or vector of numerics - number of trials
#' @param prob a numeric value between 0 and 1 
#' @return the skewness of the variable passed in
#' @export
#' @examples
#' # default
#' skew <- bin_skewness(trials = 10, prob = 0.3)
#' 

bin_skewness <- function(trials, prob) {
  check_prob(prob)
  check_trials(trials)
  
  return(aux_skewness(trials, prob))
}

#' @title Bin_Kurtosis
#' @description finds kurtosis of binomial given trials and prob
#' @param trials an integer or vector of numerics - number of trials
#' @param prob a numeric value between 0 and 1 
#' @return the kurtosis of the variable passed in
#' @export
#' @examples
#' # default
#' kurt <- bin_kurtosis(trials = 10, prob = 0.3)
#' 

bin_kurtosis <- function(trials, prob) {
  check_prob(prob)
  check_trials(trials)
  
  return(aux_kurtosis(trials, prob))
}

#private function to test if input PROB is a valid probability value
check_prob <- function(prob) {
  if (length(prob) > 1) {
    stop("\n'p' has to be a number, not a vector")
  }
  
  if (prob < 0 | prob > 1) {
    stop("\n'p' has to be a number betwen 0 and 1")
  }
  return (TRUE)
}

#private function to test if input TRIALS is a valid, non-negative, value
check_trials <- function(trials) {
  if (trials < 0) {
    stop("\n'trials' must be non-negative")
  }
  if (round(trials) != trials) {
    stop("\ntrials must be an integer")
  }
  return (TRUE)
}

#private function to test if input vector SUCCESSES is valid (between 0 and input TRIALS)
check_successes <- function(successes, trials) {
  check_trials(trials)
  
  if (! all(successes >= 0 & successes <= trials)) {
    stop("\n'successes' must be a number between 0 and trials")
  }
  return (TRUE)
}

# private function to calculate mean
aux_mean <- function(trials, prob) {
  return (trials * prob)
}

# private function to calculate variance
aux_variance <- function(trials, prob) {
  return (trials * prob * (1 - prob))
}

#private helper function for mode.  returns a length 2 vector of n 
#and n-1 if n is an integer, else returns floor(n)
int <- function(n) {
  if (n == round(n)) {
    return (c(n, n - 1))
  } else {
    return (floor(n))
  }
}

# private function to calculate mode
aux_mode <- function(trials, prob) {
  return (int((trials * prob) + prob))
}

# private function to calculate skewness
aux_skewness <- function(trials, prob) {
  return ((1 - 2 * prob) / sqrt(aux_variance(trials, prob)))
}

# private function to calculate kurtosis
aux_kurtosis <- function(trials, prob) {
  return ((1 - (6 * prob * (1 - prob))) / aux_variance(trials, prob))
}
