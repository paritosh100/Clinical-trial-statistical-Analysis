library(speff2trial)
df = ACTG175

df$treatment = factor(df$treat, levels = c(0, 1),
                      labels = c("Control", "Treatment"))
names(df)

df$sex = ifelse(df$gender == 1, "M", "F")
df$sex = factor(df$sex)

df$baseline_score = df$cd40
df$followup_score = df$cd420

df$delta = df$followup_score - df$baseline_score
df$response = ifelse(df$delta > 30, 1, 0)  # example responder rule

df$risk_group = ifelse(df$age > 40, 1, 0)

df$event = 1 - df$cens     # convert 0/1 to event indicator if needed
df$time_to_event = df$time


View(df)
write.csv(df,"data/actg175.csv",row.names = FALSE)
