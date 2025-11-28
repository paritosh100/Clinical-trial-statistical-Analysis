set.seed(42)
n <- 300
df <- data.frame(
  patient_id = 1:n,
  age = rnorm(n, 55, 10),
  sex = sample(c("M","F"), n, replace = TRUE),
  treatment = sample(c("Placebo","Drug"), n, replace = TRUE),
  baseline_score = rnorm(n, 50, 10),
  followup_score = rnorm(n, 45, 12),
  adverse_event = rbinom(n, 1, 0.2),
  time_to_event = rexp(n, 0.1),
  event = rbinom(n, 1, 0.4),
  site_id = sample(1:5, n, replace = TRUE)
)
df$response <- ifelse(df$followup_score < df$baseline_score - 5, 1, 0)
write.csv(df, "./data/clinical_trial.csv", row.names = FALSE)
